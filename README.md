# True or False Game

A Bash-based command-line True or False quiz game. The script connects to a local game server, retrieves login credentials, logs in, fetches questions, checks answers, tracks the player's score, and stores results.

## Features

- Play a True/False quiz game in the terminal
- Download login credentials from a local server
- Log in using the downloaded username and password
- Fetch questions from the game server
- Check user answers
- Count correct answers
- Calculate a final score
- Save scores to scores.txt
- Display saved scores
- Reset saved scores
- Exit from an interactive menu

## Requirements

- Bash
- curl
- grep
- cut
- A local game server running at http://127.0.0.1:8000

## How to Run

Save the script to a file, for example:

    script.sh

Make it executable:

    chmod +x script.sh

Run it:

    ./script.sh

## Menu

When the program starts, it displays a welcome message and a menu:

    Welcome to the True or False Game!
    0. Exit
    1. Play a game
    2. Display scores
    3. Reset scores
    Enter an option:

## Menu Options

| Option | Description |
|---|---|
| 1 | Start a new game |
| 2 | Display saved scores |
| 3 | Delete saved scores |
| 0 | Exit the program |

## Gameplay

To play the game:

1. Choose option 1.
2. Enter your name.
3. Read the question.
4. Answer with True or False.
5. If your answer is correct, the game continues.
6. If your answer is wrong, the game ends.
7. Your final score is calculated and saved.

The score is calculated as:

    correct answers × 10

## Correct Answers

When you answer correctly, the program prints one of the following messages:

    Perfect!
    Awesome!
    You are a genius!
    Wow!
    Wonderful!

The number of correct answers increases by one.

## Wrong Answer

When you answer incorrectly, the program prints:

    Wrong answer, sorry!

Then it shows how many correct answers you had and calculates your score.

Example:

    Alice you have 3 correct answer(s).
    Your score is 30 points.

## Scores

Scores are saved in scores.txt.

Each saved score uses this format:

    User: Alice, Score: 30, Date: 2026-11-06

## Display Scores

Choose option 2 to display saved scores.

If scores exist, the program prints:

    Player scores

Then it displays the contents of scores.txt.

If there are no scores, it prints:

    File not found or no scores in it!

## Reset Scores

Choose option 3 to delete the score file.

If the file exists, the program prints:

    File deleted successfully!

If the file does not exist, it prints:

    File not found or no scores in it!

## Exit

Choose option 0 to exit the program.

The program prints:

    See you later!

## Generated Files

The script may create the following files:

| File | Description |
|---|---|
| ID_card.txt | Stores downloaded login credentials |
| cookie.txt | Stores login cookies |
| game | Stores the latest game response |
| scores.txt | Stores player scores |

## Server Endpoints Used

The script expects a local server at:

    http://127.0.0.1:8000

It uses the following endpoints:

| Endpoint | Purpose |
|---|---|
| /download/file.txt | Downloads login credentials |
| /login | Logs into the game using basic authentication |
| /game | Retrieves a game question |

## Notes

- The local server must be running before starting the game.
- The server responses should contain username, password, question, and answer fields.
- User answers must match the expected answer exactly.
- The game ends after the first wrong answer.