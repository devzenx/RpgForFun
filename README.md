# RpgForFun

**myLittleRPG** is an exercice from *Lecture 49 - iOS 9 and Swift 2: From Beginner to Paid Professional*. 
I will show all different steps to create my solution of the case study proposed by Mark Price.
Indeed, there are plenty of improvements regarding the exercice. The core goal is to understand the core concepts of object oriented programming.

## TABLE OF CONTENT
* I. Compability
* II. Assets
* III. Design requirements
* IV. Extra notes

## I. Compability
This app has been made for iOS and has been tested Xcode 7.3 (Swift 2.2) as well as on iPhone (9.3.1). It is optimized for an iPhone 5s in landscape mode.

## II. Assets
* Graphic assets : From Mark Price's course. Some have been edited.
* Audio assets (all credits are in the AudioGame.swift file) : ![here] (https://github.com/devzenx/RpgForFun/blob/master/docs/RpgForFun_Audio.assets.zip)

## III. Design requirements

#### Flowchart
![myLittleRPG - Flowchart](https://github.com/devzenx/RpgForFun/blob/master/docs/images/myLittleRPG.flowchart.jpg)

#### Implementation priorities :
- (A) This feature is essential to the program. Without it, the user cannot fully use the program.
- (B) This feature is not mandatory but having it can prevent some programs flaws. They also stronly improve the selling values of the program (usability, restrictions, etc.).
- (C) These features are not critical but can improve the overal aspect of the program. 

**￬ FEATURES LIST NEEDS TO BE UPDATED**

#### 1.0 - Fighter Selection screen
![myLittleRPG - Fighter Selection screen](https://github.com/devzenx/RpgForFun/blob/master/docs/images/myLittleRPG_select.screen_proto.png)

**01#1.0 Each player can enter his/her name**
- **01#1.1** (A) There is an text input field for each player at the top of the screen. Left corner for player 1 and right corner for player 2.
- **01#1.2** (A) There is a placeholder text such as "Tap to enter your name".
- **01#1.3** (B) (not done) The name is limited to 10 characters. Beyond 10 characters, 3 dots such as "..." are displayed.
- **01#1.4** (C) All characters are converted to uppercase.
- **01#1.5** (C) There is a button to clear the text within the field while editing.
- **01#1.6** (C) A custom font is applied to the name of the player.

**01#2.0 Each player can choose between a Human or an Orc**
- **01#2.1** (A) Each player can choose a fighter type by pressing the "Human" or the "Orc" button.
- **01#2.2** (B) If the player presses the "Human" button, it shows above the button a human fighter image. If instead, the "orc" button is pressed, then an orc fighter image will be shown.
- **01#2.3** (C) By default, if no buttons pressed, there is a picture representating an "unknown fighter". A label in the middle of the picture indicates on the first line "Player 1" (or 2), and on the second line "Choose your fighter".

**01#3.0 Each player needs to confirm when he/she's ready**
- **01#3.1** (A) If no fighters have been selected by the player, then the "Tap when ready" button is disabled.
- **01#3.2** (A) If a player presses "Tap when ready", the text changes to "Ready" and the player's "Human", "Orc", "ready" buttons and the name text input field get disabled. The player needs to wait for the other to be ready to start the fight.
- **01#3.3** (C) A custom font is applied to the "ready" button.

**01#4.0 Sounds are played based on player's actions**
- **01#4.1** (C) If the "Orc" button is pressed, player should hear an monster grunting
- **01#4.2** (C) if the "human" button is pressed, player should hear a human battle scream.
- **01#4.3** (C) After tapping "Tap when ready", a sword slice sound effect should be played.

**01#5.0 A background music is played while selecting fighters**
- **01#5.1** (C) As soon as the selection screen is displayed a background music is played.
- **01#5.2** (C) As soon as the players leave the selection screen, the music fades out.


#### 2.0 - Battle screen
![myLittleRPG - Battle screen](https://github.com/devzenx/RpgForFun/blob/master/docs/images/myLittleRPG_fight.screen_proto.png)


** There is a message bar at the top of the screen **

**Players' names are displayed**
- (A) The names previously chosen by player 1 and player 2 are displayed above the health points and under the events bar information.
- (A) If player 1 or 2 didn't enter their names, player 1 should read "Player 1" and/or player 1 should read "Player 2".
- (C) A custom font is applied to the name of the player.
- (C) All characters are converted to uppercase.

**Players' health points are displayed**

**The game is over when one player's HP reaches 0**

**Players can attack each other by pressing a button**
- (A) At the bottom of each player's fighter sprite, there is an attack button.
- (A) Once the button is pressed, a player can reduce the other player's health by 10 points.
- (A) After an attack, the button is disabled for 3 seconds.
- (C) Whatever the fighter type, when the attack button is pressed, an attack sound will randomly played among 4 different sword attack sounds.

#### 3.0 - Restart screen
![myLittleRPG - Restart screen](https://github.com/devzenx/RpgForFun/blob/master/docs/images/myLittleRPG_restart.screen_proto.png)

**The players can go back to the select screen**
- (A) By tapping a button, they can go back to the Fighter Selection screen and choose new fighters.

**The players can restart the same fight**
- (A) Players' HP is not newly generated, they get back their initial HP from last fight.

## IV. Extra notes
- There are plenty of features which can be added. This is just an exercise.
