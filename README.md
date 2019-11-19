# FPGA_SimonSays
A game of Simon Says for matching arrow sequences made using Verilog.

Path for git Bash
cd C:/Users/shirl/OneDrive/Documents/CSC258/FinalProject

## Simon Says: 
A game where arrows are given to you for a brief amount of time, the goal is to memorize and repeat the sequence on the keyboard, and insert them into the computer one at a time. The sequences will be randomly generated and the sequence will get longer or more keys added or time to memorize is shorter, as the game goes on.

## First Milestone:
We would like to get the visual aspect of the game onto the screen, as well as the memory part done, since the computer needs to remember the sequence given out, and then compare the sequence given in. - Shifter- FlipFlop - VGA display- The model sim we show, should show that each time a button is pressed, the sequence shifts left, and then the computer should display a different color for the first letter of the left so we can tell that it has shifted properly and the graphics are set up properly as well.

## Second Milestone:
User inputs are able to appear on the screen and the game should be able to determine if the sequence given is right or wrong. - Comparator - Our plan is to utilize the board to store the inputs  with SW[1:0], and KEY0 to shift to the next part of the sequence. The model sim should show that user inputs are loaded correctly and the comparator is able to tell given two bits, if they are the same or not. On the computer, the color should now only change when the input is correct (should also shift)

## Third Milestone:
We add a multiplayer function. - Simply change the top module part of the game to include another player- Ideally, we would like the sequence generation to be randomized at this point, instead of requiring the utilization of the board. We also plan to incorporate a hex segment decoder(s) to show the player’s score (how many sequences the player got correct). The model sim should show that two users inputs does not affect each other, and on the computer we should be able to see both users. The color should not change anymore.

### How does this project relate to materials covered in 258:
It uses devices that we learnt about in class, such as shifters, registers, flip-flops, and comparators. It also uses the VGA to output the results, incorporating different means of outputs, i.e mixing output techniques learned in lab including the hex segment decoder and the VGA display. Additionally, we plan to use a keyboard for input rather than keys and switches as well, to demonstrate different applications of the FPGA..

### What's cool about this project?
It demonstrates the use of random number generation in verilog, which was an application we have not used before. Additionally, it uses this idea to create a familiar childhood game, and will add a multiplayer aspect to make the game more interactive and replayable..

### Personal Appeal?
It's a similar game that we played when we were younger which was part of our childhood, so recreating part of our childhood is fun and appeals to use personally.
