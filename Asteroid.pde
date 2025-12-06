class Asteroid {
  float x, y;
  float vy;
  float vx;
  float size;
  float angle;
  Gif gif4;

  Asteroid(PApplet app) {
    gif4 = new Gif(app, "asteroid.gif");
    gif4.play();

    x = random(width);
    y = -20;
    vy = random(2, 6);
    vx = random(-2, 2);
    size = random(20, 50);
    angle = atan2(vy, vx);
    angle -= HALF_PI; //angle of the image follows the direction it is falling
  }

  void update() {
    x += vx;
    y += vy;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(angle);
    imageMode(CENTER);
    image(gif4, 0, 0, 180, 180);
    popMatrix();
//this is the hitbox
    noFill();
    ///////////////////////////////////////////////////////////
   // circle(x, y+12, 50);
   //comment out above to hide the hitbox of the meteors
   ///////////////////////////////////////////////////////////
  }

  boolean offScreen() {
    return y - size/2 > height-100 || x + size/2 < 0 || x - size/2 > width;
  }
}
