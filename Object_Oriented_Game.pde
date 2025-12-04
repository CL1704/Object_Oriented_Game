import gifAnimation.*;
int posX=300;
Gif gif1;
Gif gif2;
Gif gif3;
int numFrames;
PImage background;

void setup(){
  size(600, 400);
  background = loadImage("background.png");
  imageMode(CENTER);
  
 gif1 = new Gif(this, "munchwalkside.gif");
 gif2 = new Gif(this, "munchwalkside2.gif");
 gif3 = new Gif(this, "munchwalkdownt.gif");
 
 numFrames = gif1.getPImages().length;
 numFrames = gif2.getPImages().length;
 numFrames = gif3.getPImages().length;
  gif1.play();
  gif2.play();
  gif3.play();
  
}
class Gif {

  
  
}
void draw() {
 background(255);
 image(background,310,80);
 rectMode(CENTER);
 fill(#484639);
 rect(width/2, 350, width, 100);  
}

void keyPressed(){
 if (keyCode == LEFT) {
   leftPressed = true;
 } else if (keyCode == RIGHT) {
   rightPressed = true;
 } 
}

void keyReleased() {
  if (keyCode == LEFT) {
    rightPressed = false;
  }else if (keyCode == RIGHT);
  leftPressed = false;
}
