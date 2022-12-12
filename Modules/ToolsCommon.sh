
# Deal with differing "which" semantics
mywhich()
{
    which "$1" 2>/dev/null | grep -v "no $1"
}

# Get the name and execute switch for a useful terminal emulator
#
# Sets $gxtpath to the emulator path or empty
# Sets $gxttitle to the "title" switch for that emulator
# Sets $gxtexec to the "execute" switch for that emulator
# May clobber $gtx*
# Calls mywhich
getxterm()
{
    # gnome-terminal and mate-terminal use -e differently to other emulators
    for gxti in "konsole --title -e" "gnome-terminal --title -x" "mate-terminal --title -x" "xterm -T -e"; do
        set $gxti
        gxtpath="`mywhich $1`"
        case "$gxtpath" in ?*)
            gxttitle=$2
            gxtexec=$3
            return
            ;;
        esac
    done
}
