#!/usr/bin/env bash

log_into_game(){
    curl --output ID_card.txt --silent http://127.0.0.1:8000/download/file.txt
    username=$(grep -o '"username": *"[^"]*"' ID_card.txt | cut -d'"' -f4)
    password=$(grep -o '"password": *"[^"]*"' ID_card.txt | cut -d'"' -f4)
    }

get_game_questions(){
        game_questions=$(curl --silent --cookie-jar cookie.txt --user $username:$password http://127.0.0.1:8000/login)
    curl --silent --cookie cookie.txt http://127.0.0.1:8000/game > game
    question=$(grep -o '"question": *"[^"]*"' game | cut -d'"' -f4)
    answer=$(grep -o '"answer": *"[^"]*"' game | cut -d'"' -f4)
}

correct_answer(){
    responses=( "Perfect!" "Awesome!" "You are a genius!" "Wow!" "Wonderful!" )
    pos=$((RANDOM % 5))
    echo "${responses[$pos]}"
    (( correct_answers++ ))
}

wrong_answer(){
    echo "Wrong answer, sorry!"
    echo "$player_name you have $correct_answers correct answer(s)."
    score=$(( $correct_answers * 10 ))
    echo "Your score is $score points."
    echo "User: $player_name, Score: $score, Date: $(date +%F)" >> scores.txt
}

print_welcome(){
    echo -e "Welcome to the True or False Game!"
}

print_menu(){
    echo -e "0. Exit\n1. Play a game\n2. Display scores\n3. Reset scores\nEnter an option:"
}

play_game(){
    RANDOM=4096
    correct_answers=0
    log_into_game
    echo -e "What is your name?"
    read player_name
    while true; 
    do {
	    get_game_questions
	    echo $question
	    echo "True or False?"
	    read user_answer
	    
	    if [ "$user_answer" == "$answer" ]; then
		correct_answer
	    else
	    	wrong_answer
	    	break
	    fi
	}
    done

}

display_score(){
    if [ -f ./scores.txt ]; then
    	echo "Player scores"
    	cat ./scores.txt
    else
    	echo "File not found or no scores in it!"
    fi
}

reset_score(){
    if [ -f ./scores.txt ]; then
    	rm -f ./scores.txt 
    	echo "File deleted successfully!"
    else
    	echo "File not found or no scores in it!"
    fi
}

exit_program(){
    echo -e "See you later!"
    exit
}

invalid_option(){
    echo -e "Invalid option!"
}


main(){
    print_welcome
    while true; 
    do {
    	print_menu
    	read user_choice
    	case $user_choice in
    		"1")
    		    play_game ;;
    		"2")
    		    display_score ;;
    		"3")
    		    reset_score ;;
    		"0")
    		    exit_program ;;
    		 *)
    		    invalid_option ;;
	esac
    }
    done
 
}

main