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

void draw() {
 background(255);
 image(background,310,80);
 rectMode(CENTER);
 fill(#484639);
 rect(width/2, 350, width, 100);
 if ( gif1.isPlaying() ){
   
  if(keyCode == RIGHT) {
   image(gif1,posX, 300);
   }
 if(keyCode == LEFT) {
   image(gif2,posX, 300);
   
}

}
}
void keyPressed(){
  if(keyPressed == true){
    if (keyCode == RIGHT) {
  posX = posX +7;
  }
  if(keyCode == LEFT) {
    posX = posX -7;
    
  }
}
}
