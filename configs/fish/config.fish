function fish_greeting
    fastfetch
    echo ""
    echo -n "	"(set_color blue)"-->" (set_color red)"Backup:" (set_color green)"dejadup - timeshift" (set_color blue)"              <--"
    echo ""
    echo -n "	"(set_color blue)"-->" (set_color red)"System Updates:" (set_color green)"pacman - paru - fwupd" (set_color blue)"    <--"
    echo ""
    echo -n "	"(set_color blue)"-->" (set_color red)"Local Updates:" (set_color green)"uv - fisher - lazyvim" (set_color blue)"     <--"
    echo ""
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    alias clrf="clear && fish_greeting"
    eval (starship init fish)
end

set -gx EDITOR nvim

# uv
fish_add_path "/home/rafaelo/.local/bin"
