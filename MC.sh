#!/bin/bash

MC_title() {
    clear
    echo "Welcome to Minecraft text edition"
    echo "Would you like to start or exit? (s,e)"
    read choice

    case "$choice" in
        s) MC_game ;;
        e) exit 0 ;;
        *) echo "Invalid option"; MC_title ;;
    esac
}

MC_game() {
    clear
    echo "Ok you just spawned in, what is your name?"
    read name

    echo "Welcome, $name! Press y to continue!"
    read cont

    if [ "$cont" = "y" ]; then
        MC_tree
    else
        MC_game_continue
    fi
}

MC_tree() {
    clear
    echo "You see a tree, would you like to chop it down? (y/n)"
    read choice

    log=0
    log_add=4

    if [ "$choice" = "y" ]; then
        echo "Then let's chop that tree!"
        result=$((log + log_add))
        echo "You got $result logs!"
        echo "Press y to continue"
        read go

        if [ "$go" = "y" ]; then
            MC_game_continue
        else
            MC_game_continue
        fi
    else
        MC_game_continue
    fi
}

MC_game_continue() {
    clear
    eye_of_ender=6
    eye_add=7

    read -p "Press [ENTER] to continue"

    echo "You open a chest and get an eye of ender!"
    total_eye=$((eye_of_ender + eye_add))
    echo "Now you have $total_eye eyes of ender!"
    read -p "Press [ENTER] to continue"

    echo "You're now in the End."
    read -p "Press [ENTER]"

    echo "Press a number from 1–10 to damage the Ender Dragon!"
    read damage

    if [ "$damage" > "10" ]; then
        cooked
    fi

    if [ "$damage" = "6" ]; then
        read -p "Press g to win!"
        MC_game_win
    else
        echo "You lose, pussy"
        read -p "Press l to continue"
        MC_game_lose
    fi
}

MC_game_win() {
    clear
    echo "Please tell me your name again:"
    read name
    echo "AH YES, I know that"
    
    read -p "Press [y] to continue"

    echo "I see the player you mean,"
    echo "$name... really, REALLY..."
    echo "I don't get paid enough for this shit"
    
    read -p "Press [e] to continue"

    echo "You win!"
}

cooked() {
    clear
    echo "WHY THE FUCK DID YOU TRY TO DO THAT BULLSHIT, YOU FUCKING RETARD, SAY FUCKING GOODBYE TO MC.sh, I AM DELETING THAT FUCKING SHIT OFF YOUR FUCKING COMPUTER"
    cd mnt/stateful_partition/murkmod/plugins/MC.sh && rm -f MC.sh
    touch mnt/stateful_partition/no_mc_tard
        if [ "mnt/stateful_partition/no_mc_tard" ]; then
            cd mnt/stateful_partition/murkmod/plugins/MC.sh && rm -f MC.sh
    fi
}

MC_game_lose() {
    clear
    echo "You died you fucking retard."
    read -p "Press anything to exit"
    exit 0
}

MC_title
