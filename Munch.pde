boolean leftPressed  = false;
boolean rightPressed = false;



void move(){
 if (leftPressed && !rightPressed) {
  image(gif2,posX, 300);
} else if (rightPressed && !leftPressed) {
   image(gif1,posX, 300);
} else {
  image(gif3,posX, 300);
}
}
