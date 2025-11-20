#!/bin/bash

tile_1() { 
clear
echo "Welcome to an updated version of the original MC"
echo "This one is better because it is, well, more realistic"
echo "press y to continue or l to leave"
read choice

  case "$choice" in
    y) player_name ;;
    l) exit 0 ;;
    *) echo "WRONG ANSWER"; title_1 ;;
  esac
}

  player_name() {
    clear
    echo "Enter username!"
    read name

    echo "OK, $name, press 'G' to keep going, or 'B' to go back to title, and E to exit game entirely"
    read choice

  case "$choice" in
    g) create_world ;;
    b) title_1 ;;
    e) exit 0 ;;
    *) echo "WRONG ANSWER"; player_name ;;
  esac
}

  create_world() {
    clear
    echo "Ok now that we have all that cleared up, what would you like to name your world?"
    read world_name

    # world name 
    echo "Aight, so you wanna really call your world $world_name, cause that shit's ass!"
    read -p "Ok, press any key to continue!"

    #seed name
    clear
    echo "As you know, every good world needs a seed and in order to do so, your fat ass has to type one!"
    echo "Also, if your seed is greater than 9999999, then it will fuck shit (maybe) so just to be safe I made sure you can't, but you could always change this in the code."
    read seed

    if [ "$seed" > 9999999 ]; then
      echo "bad boy! TYPE SMALLER ONE!!"; create_world ;;
    fi

    echo "so now, we are trying to find the seed $seed, but this will be tricky, VERY TRICKY"
    read -p "GREAT, WE FOUND A WORLD WITH THE NAME $world_name and the seed: $seed. Press [ENTER] to continue."

    clear
    echo "OK, let's make this world"
    echo "press 'o' to open the world!"
    case "$open" in
      o) world
      *) echo "wrong answer DIPSHIT"; clear; create_world ;;
    esac
}

  world() {
    clear
    echo "Welcome to the world, what do you think you would like to do?"
    echo "

    1) Chop Tree
    2) Kill an animal
    3) Open Inventory
    4) Exit to title screen
    -- MORE COMING SOON --
    "
    case "$options" in
      1) chop ;;
      2) animal ;;
      3) inv_open ;;
      4) title_1 ;;
      500) commands
    esac
}

  chop() {
    clear
    echo "You see a tree, would you like to chop it down?"
    echo "Y or N"
    read choice
    
    if [ "$choice" = "y" ]; then
      clear
      echo "Wow, you got "
