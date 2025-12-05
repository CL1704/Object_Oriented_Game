import gifAnimation.*;
PImage background;
Player player;
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();

void setup() {
  size(600, 400);
  background = loadImage("background.png");
  imageMode(CENTER);
  
  player = new Player(this);
}

void draw() {
  background(255);
  image(background, 310, 80);
  rectMode(CENTER);
  fill(#484639);
  rect(width/2, 350, width, 100);

  player.update();
  player.display();

if (frameCount % 30 == 0) {        // spawns an asteroid every 30 frames 
    asteroids.add(new Asteroid(this));
}
    for (int i = asteroids.size()-1; i >= 0; i--) {
    Asteroid a = asteroids.get(i);
    a.update();
    a.display();
    if (a.offScreen()) {
      asteroids.remove(i);
    }
  }
}


void keyPressed() {
  player.movePressed(keyCode);
}
void keyReleased() {
  player.moveReleased(keyCode);
}
