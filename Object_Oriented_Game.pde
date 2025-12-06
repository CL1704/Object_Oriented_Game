import gifAnimation.*;

int time = 0; //the time/score in the game
int finalScore = 0;

PImage startButton;
PImage background;
Player player;
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
float rateUp = 45; // starting value of the amount of frames between each asteroid

// game states
final int start = 0; // start screen
final int play  = 1; // the gameplay
final int end   = 2; // game over :(
int gameState = start;

void setup() {
  size(600, 400);
  background = loadImage("background.png");
  startButton = loadImage("Startscreen.png");
  imageMode(CENTER);
  frameRate(60);
  player = new Player(this);
}

void draw() {
  background(255);
  image(background, 310, 80);
  rectMode(CENTER);

  // the floor (drawn on all screens)
  noStroke();
  fill(#484639);
  rect(width/2, 350, width, 100);

  // game states:
  if (gameState == start) {
    //start screen of the game
    fill(0);
    textAlign(CENTER, CENTER);
    image(startButton, width/2, height/2+20);
    startButton.resize(400,150);
  }
  else if (gameState == play) {
    // the game itself

    // timer / score
    time = time + 1;
    fill(255);
    textSize(35);
    text("Score: " + time, 100, 60);

    // player
    player.update();
    player.display();

    // spawn asteroids
    if (frameCount % int(rateUp) == 0) {        // spawns an asteroid every rateUp frames
      asteroids.add(new Asteroid(this));
      if (rateUp > 12) {
        rateUp = rateUp - 0.5; // increase difficulty as time progresses
      }
    }

    // updating / drawing / collision / removing asteroids
    for (int i = asteroids.size()-1; i >= 0; i--) {
      Asteroid a = asteroids.get(i);
      a.update();
      a.display();

      // "if player is hit with an asteroid, move to the game over screen"
      if (collidesWithPlayer(a)) {
        finalScore = time;
        gameState = end;
      }

      if (a.offScreen()) {
        asteroids.remove(i);
      }
    }
  }
  else if (gameState == end) {
    // game over screen
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(50);
    text("Final Score: "+finalScore, width/2, height/2 - 20);
    textSize(20);
    text("PRESS R TO RESTART", width/2, height/2 + 40);
  }
}

// hitbox collision
boolean collidesWithPlayer(Asteroid a) {
  // player rectangle hit box for being hit with the asteroids.
  float pLeft   = player.posX - hitW/2.0;
  float pRight  = player.posX + hitW/2.0;
  float pTop    = 310 - hitH/2.0;
  float pBottom = 310 + hitH/2.0;

  // circle hitboxes of the falling asteroids
  float radius  = 25;
  float aLeft   = a.x - radius;
  float aRight  = a.x + radius;
  float aTop    = a.y - radius;
  float aBottom = a.y + radius;

  return pRight  > aLeft &&
         pLeft   < aRight &&
         pBottom > aTop &&
         pTop    < aBottom;
}

// controls for the game based on the game state :)
void keyPressed() {
  if (gameState == start && keyCode == ENTER) {
    // start game from start screen
    restartGame();          // *** reset everything ***
    gameState = play;
  }
  else if (gameState == play) {
    // forward movement keys to player only while playing
    player.movePressed(keyCode);
  }
  else if (gameState == end && (key == 'r' || key == 'R')) {
    // restart from game over
    restartGame();
    gameState = play;
  }
}

void keyReleased() {
  if (gameState == play) {
    player.moveReleased(keyCode);
  }
}

// reseting the game
void restartGame() {
  time = 0;
  rateUp = 45;
  asteroids.clear();
  player = new Player(this);
}
