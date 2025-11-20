#!/bin/bash

ROWS=9
COLS=9
MINES=10

declare -A board revealed flagged

in_bounds() {
    (( $1 >= 0 && $1 < ROWS && $2 >= 0 && $2 < COLS ))
}

neighbors() {
    local r=$1 c=$2
    for dr in -1 0 1; do
        for dc in -1 0 1; do
            (( dr == 0 && dc == 0 )) && continue
            local nr=$((r+dr)) nc=$((c+dc))
            in_bounds "$nr" "$nc" && echo "$nr $nc"
        done
    done
}

# mine shit
generate_board() {
    # place mines
    local placed=0
    while (( placed < MINES )); do
        r=$(( RANDOM % ROWS ))
        c=$(( RANDOM % COLS ))
        [[ ${board[$r,$c]} == M ]] && continue
        board[$r,$c]=M
        ((placed++))
    done

    # compute numbers
    for ((r=0;r<ROWS;r++)); do
        for ((c=0;c<COLS;c++)); do
            [[ ${board[$r,$c]} == M ]] && continue
            count=0
            while read nr nc; do
                [[ ${board[$nr,$nc]} == M ]] && ((count++))
            done <<< "$(neighbors $r $c)"
            board[$r,$c]=$count
        done
    done
}

# ======= REVEAL LOGIC =======
reveal_cell() {
    local r=$1 c=$2
    [[ ${revealed[$r,$c]} == 1 || ${flagged[$r,$c]} == 1 ]] && return
    revealed[$r,$c]=1

    # lose condition
    if [[ ${board[$r,$c]} == M ]]; then
        game_over 0
    fi

    # flood-fill blanks
    if [[ ${board[$r,$c]} == 0 ]]; then
        while read nr nc; do
            reveal_cell "$nr" "$nc"
        done <<< "$(neighbors $r $c)"
    fi
}

what ts looks like
draw_board() {
    echo
    printf "    "
    for ((c=0;c<COLS;c++)); do printf "%2d " $c; done
    echo
    echo

    for ((r=0;r<ROWS;r++)); do
        printf "%2d  " $r
        for ((c=0;c<COLS;c++)); do
            if [[ ${flagged[$r,$c]} == 1 ]]; then
                printf " F "
            elif [[ ${revealed[$r,$c]} != 1 ]]; then
                printf " . "
            else
                v=${board[$r,$c]}
                [[ $v == 0 ]] &&
