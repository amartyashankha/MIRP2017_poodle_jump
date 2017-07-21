# Build your own Doodle Jump!
---------
## Introduction

Doodle Jump is a popular Android and iPhone game. In the game the aim is to guide a player up a never-ending series of platforms without falling. The left side of the playing field is connected with the right side. There is no definitive end to the game, but the end for each gameplay session happens when the player allows the player to fall to the bottom of the screen without hitting any platform.


In this lab, you will be building your own version of Doodle Jump! We recommend that you try out the [game](http://doodlejump-online.com/) first, in order to understand the gameplay. Note that our version of the game does not contain any of the special collectibles, but we encourage you to add these after you finish the lab.

We provide you an outline of code for you to start this lab, but you will be writing most of the code that creates this game! This code skeleton will provide you many constants that will make your life easier, so be sure to use these constants in your code! We also take care of key handling for you,  and you can read more about this in the *Key Handling* section below.

In addition to this README file, you will also find many instructions and hints in the code we give you! Be sure to **read the comments** carefully to determine what needs to be done inside each function!

### Set Up
You will be completing this lab in **Processing** and start with the 5 skeleton files we provide you inside the `poodle_jump` folder. These files are:
> **FILES**
> - **poodle_jump.pde**: This is the main game file that you will be editing.
> - **constants.pde**: This file contains constants that will be useful to you! Make sure to read through this file before you begin, and you may need to 
> - **flow.pde**: This is a simple file that controls the flow of the game. You will update this code based on what should happen when a point is scored.
> - **key_handling.pde**: This file is for your convenience and does not need to be edited! It takes care of key handling.
> - **physics.pde**: In this file, you will write code that determines how the player's position and velocity will be updated as well as the resolving collisions using the physics you learned in class!

Note that ".pde" at the end of the file indicates that the file should be opened using Processing.

### How to get these files
In order to download these files, you will `fork` this repository as you learned in class! Make sure you **DO NOT CLONE** this repository directly! You can find the original repository at
```
https://github.com/amartyashankha/MIRP2017_poodle_jump
```
**<span style="font-size:larger;">Please use the most recent version of this README, which will be available at the above link.</span>**

Once you have forked the respoitory into your own Github account, you can then clone it onto your computer to work on the code. Make sure you are logged in to your own Github account while you do this!

<i class="icon-folder-open"></i> **poodle_jump.pde**
Just like any main Processing file, the functions that will be run are
 `void setup()` and `void draw()`. These functions, however, will mainly call other functions that you write

FUNCTION: `void setup()` is provided to you, which calls `resetGame()` to start a new game. **You** will write what happens inside `resetGame()` at the bottom of the file. Remember that `setup()` only gets called ONCE at the start of the program.

FUNCTION: `void draw()`is given to you, but simply calls `drawGameScreen()` (which you will be writing) according to each different Game State where:

 - 0 -- Start Screen
 - 1 -- Game Running Screen
 - 2 -- Lose Screen

The initial Game State is 0.

Remember that `draw()` gets called many times per second, and this is how the game screen will be refreshed each time something changes.
 
<i class="icon-folder-open"></i> **constants.pde**
This file consists of all sorts of useful variables that you will use throughout your code. Never use arbitrary values in your code; create a variable for it in this file if it doesn't already exist and then use that variable in your code. For example:

 - DO NOT write `size(500, 500)`
 - Instead, write: `size(displayWidth, displayHeight);` and define the variables `displayWidth` and `displayHeight` in the constants file.

Most constants in this file are self-explanatory based on the name of the variable and the comments throughout the file. If you still aren't sure what one of the variables is, ASK! Or look for where that variable is being used and make an educated guess. Here are some variables that may be confusing:

 - `PLAYER_HORIZ_VELOCITY`: This is the speed of the player in horizontal direction. The player's velocity in the x-direction `playerVx` will always have the same magnitude, namely `PLAYER_HORIZ_VELOCITY,`but opposite signs. 
 - Similarly,  `PLAYER_VERT_VELOCITY` is the speed of the player in vertical direction. Now,  the player's velocity in the y-direction will be `playerVy`. 
 - However, `MAX_VERT_VELOCITY` is the max velocity of the screen used in updatePositions() in order not to move the screen too fast.

## Step 1: Create the Player and its properties
 The player  will be represented as a circle with the `playerRadius` specified in the constants file. Feel free to make the player a different or more complicated shape. The player also has a `position` and `velocity` throughout the game. These variables have been declared in the `constants` file with the appropriate names, but you need to set their values in the appropriate places.
 
 - Write the function `drawPlayer()` to display the player in the correct position and give it a velocity.
 - To draw the player, you are given the player's radius and color: `playerRadius` and `playerColor` among the defined constants.
 - Note that gravity acts on the player. You may turn it off for debugging purposes.

## Step 2: Initialize the Platforms
Write your code in the `initializePlatforms()`function to create an initial set of platforms according to the number of of platforms defined by `numPlatforms` among the constants. Each platform is denoted by two coordinates. You can store these in the `platforms[][2]` array.

For example, if the fourth platform has coordinates `(30,60)`, then you can set `platforms[4][0] = 30`, and `platforms[4][1] = 60`.

### Random Generation
You will find it useful to use the function `random()` in order to randomly generate the number of platforms needed. Specifically `random(low, high)` will generate a random number that is `>= low` and `< high`.
You may refer to the [documentation](https://processing.org/reference/random_.html) for the `random` function.

## Step 3: Draw the Platforms
Now try to write your code for the `drawPlatforms()` function. To do this you will use the Platform parameters defined among the constants:  `platformLength,  platformHeight, platformRadius, platformColor`

You should draw all the visible platforms that are present in the `platforms[][2]` array.

## Step 4: Player-Platform Resolving Collision
Now it's time to detect and resolve collisions. In the `resolveCollisions()` function, write your code to detect ball collisions with platforms keeping in mind that:

 - **Collisions ONLY happen when the player is falling**. When the player is moving upwards, it does not collide with any platforms.
 - If Player lands on a platform, it bounces off with `PLAYER_VERT_VELOCITY`. Note that this is not the same as reflection, but the `x`-velocity should remain the same.
 
## Step 4: Move the Player
Now, we will make the player move. To do this fill out the `updatePlayerVelocity()` function in order to:  

	 - Update Player Velocities according to keys pressed (`A`-left and `D`-right)
	 - Apply Gravity and optionally Air Drag

You should also add some lines of code to the `updatePlayerPosition()` function so that if Player falls out of side of screen, enters from opposite side.

## Step 5: Move the Screen
Now the game must get exciting. It's time to start moving the screen (i.e. the platforms). In order to do this, go to the `updatePositions()` function. If the player goes into the top half of screen, then:

 - Move the view upwards. This means that the platforms should move downwards (increase `y`-coordinate.
 - Generate new platforms 

### Making the motion smooth (Optional)
If you play the game now, you will notice that the screen m

## Step 6: Player loses a point
Detect losing as the player falling to the bottom of the screen without hitting any platform.
Update the `playerLose()` function in `flow.pde`. Think about what happens when a player scores a point.

## Step 7: Display scores
Write your code for the displayScores() function to display player score in a corner.

## Step 8: Create the Start and Lose screens
The hard part is over! Good job, you're almost there.
Now you just have to draw the Start and Lose screens.

Write your code in the `drawStartScreen()` and `drawLoseScreen()` functions.

## Step 11: Pausing the game
If the game is paused, the player and platform properties should not be updated until the game is unpaused. Also indicate on the game screen that the game is paused.

**Key Handling**

You are given defined keyboard keys that the player will use in the game. They will do their assigned functions only when pressed.

 - Player controls:
	
	LEFT = 'a'     
	RIGHT = 'd'    
	UP = 'w'

 - Game Controls
 
	RESET = 'r'
	PAUSE = 'p'
	START = 's'
