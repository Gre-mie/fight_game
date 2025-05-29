# Contributing

Use **Ctr + Shift + v** to view file preview in VScode

This file contains rules/styles and an explination of how to use files/directories

## Style

- Functions and files should have a short comment explaining its purpose
- Directories use `chammelCase`, files use `snake_case`
- Directories holding test exicutables and exicutable test files should start with the word `test`.
    + directory: `testExample/`
    + file: `test_example.sh`
- Logs should be in the format `<date/time> <message status>: <message>` 
    + use the log function in `./functs/debug/log.sh` to append to log.txt
    + `log` takes a single string and will add the date/time automatically, eg. `log "ERROR: something broke"`


## Project walkthrough

- `main.sh` - exicutable: entry point for game
- `test.sh` - exicutable: runs all valid test scripts within a given direcotry. If no argument, uses `./tests/` by default 
- `tests/` - contains test scripts, scripts may be grouped into subdirectories
- `vars/` - contains sctips that set variables when exicuted
    + `entities/` - variables for entities that can be interacted with
- `functs/` - contains scrips that setup files and read functions when exicuted

## Run tests

Use `./tests.sh [path]` from the project root to exicute all valid test files in the given directory and all sub directories. If no path is given, will run tests from `./tests/` by default.

## Creating rooms

Rooms should be named in `room<int>.sh` format in `.vars/rooms/`.

Rooms are entered starting with room1 incrementing until the `max_levels` threshold is reached

## Creating enemies

These rules should be followed when creating an enemy stat file to keep the game balanced.

- enemy health < player health
- enemy defence < player power
- enemy power <= 1/4 player health
