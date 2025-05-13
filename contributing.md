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
    + `log` takes a single string, eg. `log "ERROR: something broke"`


## Project walkthrough

- `main.sh` - exicutable: entry point for game
- `test.sh` - exicutable: runs all valid test scripts within a given direcotry. If no argument, uses `./tests/` by default 
- `tests/` - contains test scripts, scripts may be grouped into subdirectories
- `vars/` - contains sctips that set variables when exicuted
    + `entities/` - variables for entities that can be interacted with
- `functs/` - contains scrips that setup files and read functions when exicuted
    + `debug` - functions that can be used for debugging such as `log.sh`
    + `paths` - functions to do with pathing such as checking if a path exists


## Run tests

Use `./tests.sh [path]` from the project root to exicute all valid test files in given directory and sub directories. If no path given will run tests from `./tests/`
