#!/usr/bin/env bash

function usage {
    echo "Usage: $0 [OPTIONS] [FILE FILE2...]"
    echo "Makes a sym link in your home directory to the dotfile specified."
    echo ""
    echo "For example "$0 vimrc" -- creates $HOME/.vimrc"
    echo "pointing to the vimrc file here."
    echo ""
    echo "Options:"
    echo "      --no-backup     Prevents creating backups of existing dotfiles (default is to backup)."
    echo "      --all, -a       Links all files, rather than FILE FILE2 etc."
    exit 1
}

function msg {
    echo $(echo $1 | sed -e s@$HOME@~@g)
}

function do_backup {
    DEST=$1
    if [ $DO_BACKUP -eq 1 ] && [ -e "${DEST}" ]; then
        msg "Backing up ${DEST} to ${DEST}.bkup"
        cp -r "${DEST}" "${DEST}.bkup"
    fi
}

function link_file {
    DOTFILE=$1
    DEST="${HOME}/.${DOTFILE}"
    NEW_FILE="${BASE}/${DOTFILE}"

    if [[ `readlink "${DEST}"` == "${NEW_FILE}" ]]; then
        msg "${DEST} already points to ${NEW_FILE}, skipping..."
        return
    fi
    
    do_backup $DEST

    ln -sf "${NEW_FILE}" "${DEST}"
    msg "Linked ${NEW_FILE} to ${DEST}"
}

function link_config_dir {
    for D in $(find "${BASE}/config" -maxdepth 1 -print); do
        D=$(basename "${D}")
        DEST="${HOME}/.config/${D}"
        NEW_DIR="${BASE}/config/${D}"

        if [[ "$D" == "config" ]]; then
            continue
        fi

        if [[ `readlink "${DEST}"` == "${NEW_DIR}" ]]; then
            msg "${DEST} already points to ${NEW_DIR}, skipping..."
            continue
        fi

        do_backup $DEST

        ln -sf "${NEW_DIR}" "${DEST}"
        msg "Linked ${NEW_DIR} to ${DEST}"
    done
}

DO_BACKUP=1
LINK_ALL=0
FILES=()
BASE=$(realpath `dirname "${0}"`)

for A in "${@}"; do
    case "${A}" in
    --no-backup)
        DO_BACKUP=0
        ;;
    --all | -a)
        LINK_ALL=1
        ;;
    *)
        FILES+=("${A}")
        ;;
    esac
done

# if not linking all files and none were given as args
if [ $LINK_ALL -eq 0 ] && [[ "${FILES[@]}" == "" ]]; then
    # print help and exit
    usage
fi

# if linking all
if [ $LINK_ALL -eq 1 ]; then
    # get list of all files
    FILES=$(find "${BASE}/" -maxdepth 1 -print)
fi

for F in $(echo "${FILES[@]}" | awk '{ print $1 }'); do
    if [[ "${F}" == "${BASE}" ]]; then
        continue
    fi

    F=$(basename $F)
    # if the file is this script or starts with a dot
    if [[ "${F}" == "install.sh" ]] || [[ "${F:0:1}" == "." ]]; then
        # skip it
        continue
    fi

    if [ ! -e "${F}" ]; then
        msg "${F} doesn't exist, skipping..."
        continue
    fi

    if [[ "${F}" == "config" ]]; then
        link_config_dir
    else
        link_file $F
    fi
done
