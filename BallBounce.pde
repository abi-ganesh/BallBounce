//-----------------------------------------------------------------
// Abirami Ganesh
// BallBounce
// cmps 5J
// programming assignment 6
//-----------------------------------------------------------------
// ball variables
float r,x,y, Xspeed, Yspeed;
// environment variables
float gravity, stopSpeed, dissipation;
void setup() {
 size(500,500);
 smooth();

 // initialize ball variables
  r = 50;
  x = width/2;
  y = r;
  //speed = 0;
  
 // initialize environment variables
  gravity = 0.6; 
  stopSpeed = 0.2;
  dissipation = .08;
}
// do not change this function
void draw() { 
 background(0,255,255);
 displayBall();
 if( mousePressed && mouseOnBall() ){
 holdBall();
 }else{
 moveBall();
 updateSpeed();
 }
}

void displayBall(){
 //constrains make ball stay within window
 y=constrain(y,r,height-r);
 x=constrain(x,r,width-r);
 
 //draws red ball
 fill(255,0,0);
 noStroke();
 ellipse(x,y,2*r,2*r);
}

void holdBall(){
 //sets x & y to mousex & mouseY
 x=mouseX;
 y=mouseY;
 //sets speed to pmouseX & pmouseY
 Xspeed=x-pmouseX;
 Yspeed=y-pmouseY;
}
void moveBall(){
 //changes position of the ball by adding xspeed and yspeed
 x+=Xspeed;
 y+=Yspeed;
}
void updateSpeed(){
 //changes xspeed and yspeed to dissapate energy
 if(abs(Xspeed) < stopSpeed) {
   Xspeed=0.0;
  }
 else if (x > width-r) {
   Xspeed *= -(1-dissipation);
 }
 else if (x < r) {
   Xspeed *= -(1-dissipation);
 }
 if (abs(Yspeed) < stopSpeed) {
   Yspeed = 0.0;
 }
 else if (y > height - r) {
   Yspeed *= -(1-dissipation);
 }
 else if (y < r) {
   Yspeed *= -(1-dissipation);
 }
 
 Yspeed = Yspeed + gravity; //adds the element of gravity so the ball isnt bouncing forever
}

boolean mouseOnBall() {
 //this boolean is true if and only if the distance of the mouse is r=50px within the center of the ball
 return(dist(x,y,mouseX,mouseY)<r);
}
