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
    + use the log function in `./functs/debug/log.sh` to append to `game.log`
    + `log` takes a single string and will add the date/time automatically, eg. `log "ERROR: something broke"`

## Release features and bug fixes

How releases and bug fixes should be handled so people can play the latest working version as I continue working on features.

- ***Release***: Create a new branch with name format `Release_<update_name>`
- **Bug fix**:   Commit using commit message format `Release_vn.n.n+1`

Checklist before release/bug fix
- Update changelog section in README
- Update branch in `how to play` section of README.md
- Make sure version number is correctly set in `./vars/global_vars.sh`

The `main` branch should pull in changes from the latest release branch but release branches should NEVER pull in changes from main

## Project walkthrough

- `main.sh` - exicutable: entry point for game
- `test.sh` - exicutable: runs all valid test scripts within a given direcotry. If no argument, uses `./tests/` by default 
- `tests/` - contains test scripts, scripts may be grouped into subdirectories
- `vars/` - contains sctips that set variables when exicuted
    + `entities/` - variables for entities that can be interacted with
- `functs/` - contains scrips that setup files and read functions when exicuted

## Run tests

Use `./test.sh [path]` from the project root to exicute all valid test files in the given directory and all sub directories. If no path is given, will run tests from `./tests/` by default.

## Exit codes

Exit codes used by the game

- 0 - programme ran successfully
- 1 - programme ended with Error
- 2 - programme was exited by user

## Creating rooms

Rooms should be named in `room<int>.sh` format in `.vars/rooms/`.

Rooms are entered starting with room1 incrementing until the `max_levels` threshold is reached

## Creating enemies

These rules should be followed when creating an enemy stat file to keep the game balanced.

- enemy health < player health
- enemy defence < player power
- enemy power <= 1/4 player health

