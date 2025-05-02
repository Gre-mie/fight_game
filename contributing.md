# Contributing

**Ctr + Shift + v** to view this files preview in VScode

This file contains rules/styles and an explination of how to use files/directories

# Style

- functions and files should have a short comment explaining its purpose
- directories use `chammelCase`, files use `snake_case`
- directories holding test exicutables and exicutable test files should start with the word `test`. eg directory: `testExample/` file: `test_example.sh`


# Project walkthrough

- `main.sh` - exicutable: entry point for game
- `test.sh` - exicutable: runs all valid test scripts within a given direcotry. If no argument given uses `./tests/` by default 
- `tests/` - contains test scripts, scripts may be grouped into subdirectories
- `vars/` - contains sctips that set variables when exicuted
- `functs` - contains scrips that set functions when exicuted