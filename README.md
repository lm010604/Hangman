# Hangman (Command Line Version)

Welcome to the Command-Line Hangman Game! This game allows you to play classic hangman using a random English word, with the ability to save and load your progress.

## Features

- Random word selection from a clean English word list
- Save and load game functionality
- Command-line interface
- Persistent game data through file system

## File Structure

```perl
project_root/
│
├── lib/
│   ├── hangman_game.rb          # Core game logic
│   ├── hangman_persistence.rb   # Save/load logic
│   └── hangman_runner.rb        # User interaction logic
│
├── google-10000-english-no-swears.txt   # Word bank for random word generation
├── main/                                
|   |── main.rb                          # Entry point of the game
|   |── hangman_CLI.rb                   # CLI logic
├── games/                               # Folder for saved games (created automatically)
└── README.md
```

## How to Play

### 1. Clone the Repository
```
git clone https://github.com/your-username/hangman-game.git
cd hangman
```

### 2. Run the Game
```
ruby main/main.rb
```

### 3. Follow the Prompts
- Type ```new``` to start a new game.
- Type ```load``` to resume from a saved game.

## Saving & Loading
- Saved games are stored in the saves/ folder.
- If no saved games exist, you’ll start a new game automatically.
- You can resume saved games by selecting them from the list when prompted.

## Requirements
- Ruby 2.5+
- Terminal access

## Notes
- Customize or replace google-10000-english-no-swears.txt to change the word pool.