# About

This project was made as a submission to [Boot.dev Personal Project](https://www.boot.dev/courses/build-personal-project-1)

Pick options to battle enemies until all enemies are defeated or the player health reaches zero.

## How to play

Right now the current release has no graphics and is best played inside an IDE.<br/>
The terminal will take input and show minimal information. If using an IDE the `game.log` file will give more information (the `game.log` file is generated after `main.sh` is exicuted).

When the game starts it'll ask you to give a name. This will be your charactors name and must be `a-zA-Z`, without spaces and no more than 20 chars.

You'll be asked to enter an option until the game ends. The option you choose will be the action your charactor takes.

Available options
- `0` - exit the game
- `1` - fight
- `2` - block

Your final score will print to the terminal when your charactor dies, all enemies are defeated or you choose `0` to exit the game.

## Run the game

Because I'm continuing work on the game, some setup is needed to play a working version.<br/>
After cloneing the repo run `setup.sh`.<br/>
`setup.sh` will branch off the last working release and switch to that branch. The new branch name will be simular to `release_v0.1.0`.
Setup will only need to be run when you update the cloned repo.

Check your in the new branch and run `./main.sh` to start playing.

### Trouble shooting

**NOTE**: This game was made using WSL and may not work as intended in some terminal environments.

Some environments may not have all the features used by the game code but will still run. (For example VScode doesn't have blinking mode)

`main.sh` and `setup.sh` need exicute permissions to run.<br>
You can check exicute permissions with `ls -l`<br>
