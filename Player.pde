import gifAnimation.*;
int hitW = 30; //hitbox dimensions for width and height
int hitH = 50;

class Player {
  int posX = 300;
  Gif gif1;
  Gif gif2;
  Gif gif3;
  boolean rightPressed = false;
  boolean leftPressed = false;

  Player(PApplet app) {
  //the three animations for each direction of movement/idle animations
    gif1 = new Gif(app, "munchwalkside.gif");
    gif2 = new Gif(app, "munchwalkside2.gif");
    gif3 = new Gif(app, "munchwalkdownt.gif");
    gif1.play();
    gif2.play();
    gif3.play();
  }

  void update() {
    // movement of the player
    if (leftPressed) {
      posX -= 6;
    }
    if (rightPressed) {
      posX += 6;
    }
    //screen borders
     posX = constrain(posX, 30, width-30);
  }

  void display() {

  
  
    // this is to make it so the animatiosn will only play when the specific direction is pressed
    if (leftPressed) {
      image(gif2, posX, 290);
    }
    if (rightPressed) {
      image(gif1, posX, 290);
    }
    if (!leftPressed && !rightPressed) {
      image(gif3, posX, 290);
    }
        noFill();
  stroke(255);
  /////////////////////////////////////////////////////////////////
  //rect(posX,310,hitW,hitH); //hitbox of the player
  //comment out above to hide player hurtbox
  /////////////////////////////////////////////////////////////////
  }
//mvmt is short for movement!, 
//below is the code for tracking player inputs into movements
  void movePressed(int mvmt) {
    if (mvmt == LEFT) {
      leftPressed = true;
    }
    if (mvmt == RIGHT) {
      rightPressed = true;
    }
  }
  
  void moveReleased(int mvmt) {
    if (mvmt == LEFT) {
      leftPressed = false;
    }
    if (mvmt == RIGHT) {
      rightPressed = false;
    }
  }
}
