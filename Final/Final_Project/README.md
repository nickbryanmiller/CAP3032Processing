##Title:
To Be Determined

##Description:
This is a infinite scroller style game (it continues until you die).
It is a spin off of the Disney movies.
You play as an object and the goal is to dodge enemy objects.
These enemy objects will slide at you with a constant speed.
If you get one of the special perks you can fight back for a limited time.

##From a developer standpoint:
-"Final_Project" is the controller class for the entire game.
-It calls the "Menu" class first.
-When the start button is pressed it calls the "Level" class to display.
-This "Level" class is the controller for the game objects.
-Inside of "Level" we have the enemy object instantiated 5 times, the player object, the heart controller, and the score controller.
-The "Enemy" obejcts have the same reference to the score because the "Level" class passed the "Score" object to all of them.
-When the enemy and player objects are being made they are passed an image number.
-They then decides what their images should be and set their width and height accordingly.
-This number is based upon which mode they choose (easy, medium, or hard).

-The movement of the player (key presses) and the detection of the mouse presses are passed throughout the function from the main controller, "Final_Project".
-This class also controls all of the sound you hear in the game.

-All buttons on the screen are from the "Button" class (which contains a isClicked method).

-There is a "MyColors" class that just contains a bunch of colors so I did not have to enter RGB values everywhere.
