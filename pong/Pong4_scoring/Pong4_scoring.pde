//Global Variables
int appWidth, appHeight;
float centerX, centerY, xStart, yStart, widthRect, heightRect;
color blackNightMode=#000000, orange=#FF8512, white=#FFFFFF, red=#FF0000; //Hexidecimal
color orangeNightMode=#FF8500, redNightMode=#FF0000;
float thin, normal, thick;
Boolean nightMode=false, randomBackground=false;
Boolean greyScale=false, backgroundColor=false;
int LrectY = 350; //initial Left paddle position
int RrectY = 350;
int ellX = width / 2; // initial ellipse position in the middle
int ellY = height / 2;
boolean moveRight = true; //this means moving left is false
boolean moveDown = true; //this means moving up is false
int speedSide = 3; //speed in X direction, higher value is greater speed
int speedVertical = 4; //speed in Y direction
int countR = 0; //score for right side
int countL = 0; //score for left side
PFont font; //font used for scoring
//
void setup() {
  //Declaring Display Geometry: landscape, square, portrait
  size(700, 700); //Able to deploy with fullScreen();
  //fullScreen();
  appWidth = width;
  appHeight = height;
  //Concatenation: , or + (i.e space)
  println("\t\t\tWidth="+width, "\tHeight="+height);
  println("Display Monitor:", "\twidth:"+displayWidth, "\theight:"+displayHeight);
  //
  String ls="Landscape or Square", p="portrait", DO="Display Orientation", instruct="Bru, turn your phun";
  //
  if ( appWidth < appHeight ) { //Declaring Landscape & square
    println(instruct);
  } else {
    println("Display: Good to Go");
    if ( appWidth > displayWidth ) { //Fitting CANVAS into Monitor Display
      appWidth=0;
      appHeight=0;
      println("STOP, is broken");
    } else {
      //Empty ELSE
    }
  }
  //Population
  centerX = appWidth * 1/2;
  centerY = height * 1/2;
  xStart = centerX - ( appWidth * 1/4 );
  yStart  = centerY - ( height * 1/4 );
  widthRect = appWidth * 1/2;
  heightRect = height * 1/2;
  thin = appWidth / appWidth; //1
  normal = appWidth * 1/70;
  thick = appWidth * 1/35;
  font = loadFont("Algerian-48.vlw"); // fontfor score is Arial, under tools
} //End setup
//
void draw() {
  // New Background Function "covers" old grey scale background
  // Night Mode means background cannot have blue // change randome for night mode, hard code "0"
  //if ( greyScale == true ) background(100); //grey scale (0-255) & Blue Issue for night mode
  //
  //Casting reminder
  //if ( backgroundColor == true ) background( color( random(0 , 255), random(0 , 255), random(0 , 255) ) ); // Color without blue
  //
  //strokeWeight( thick );
  if ( nightMode == true ) 
{
  //background( blackNightMode );
  //stroke( orangeNightMode );
  //fill(redNightMode);
} else 
{
  //stroke( orange );
  //fill( red );
}
  //rect(xStart, yStart, widthRect, heightRect);
  //fill(white); //default reset
  //stroke( blackNightMode ); //default reset
  //strokeWeight(1); //default reset
  //circle(50, 100, 60);
  //circle(130, 100, 60);
  //circle(90, 110, 60);
  //circle(90, 75, 60);
  background(0);
  textFont(font); //introduce the font
  fill(255, 255,255);
  ellipse(ellX, ellY, 25, 25);
  text("Pong", 300, 40);
  fill(255, 255, 255);
  rect(20, LrectY, 15, 115);
  text(countL, 200, 50); //score for left side
  fill(255, 255, 255);
  rect(665, RrectY, 15, 115);
  text(countR, 500, 50); //score for right side
  if ( keyPressed == true && key == 'w' ) 
  { //Y value decreases, allows left paddle to move up
    LrectY = LrectY - 6;
  } 
  if ( keyPressed == true && key == 's' ) 
  { //Y value increases, allows left paddle to move down
    LrectY = LrectY + 6;
  }
  if ( keyPressed == true && key == 'o' ) 
  { //Y value decreases, allows right paddle to move up
    RrectY = RrectY - 6;
  }
  if ( keyPressed == true && key == 'l' ) 
  { //Y value increases, allows right paddle to move down
    RrectY = RrectY + 6;
  }
  if ( moveRight == true ) 
{ //establishes circle moving in right direction, speed can be modified
  ellX = ellX + speedSide;
} 
else {
  ellX = ellX - speedSide; //establishes circle movingin left direction, speed can be modified
}
  if ( moveDown == true ) 
{ //establishes circle moving in down direction, speed can be modified
  ellY = ellY + speedVertical;
} 
else {
  ellY = ellY - speedVertical; //establishes circle moving in up direction, speed can be modified
}
if ( ellY <= 10 ) { //creates border at top, so circle will move down
  moveDown = true;
}
if ( ellY >= 690 ) { //creates border at bottom, so circle will move up
  moveDown = false;
}
if ( ellX >= 690 ) { //creates border at right that resets the ball and adds to score
  countL++;
  ellX = width / 2;
  ellY = height / 2;
}
if ( ellX <= 10 ) { //creates border at left that resets the ball and adds to score
  countR++;
  ellX = width / 2;
  ellY = height / 2;
}
if ( ellX >= 650 && ellY > RrectY && ellY < (RrectY + 100) ) { // creates right paddle boundary so circle will bounce off
  moveRight = false;
}
if ( ellX <= 50 && ellY > LrectY && ellY < (LrectY + 100) ) { // creates left paddle boundray so circle will bounce off
  moveRight = true;
}
} //End draw
//
void keyPressed() {
  greyScale = false;
  backgroundColor = false;
  if ( key == 'G' || key == 'g' ) greyScale = true;
  if ( key == 'B' || key == 'b' ) backgroundColor = true;
} //End keyPressed
//
void mousePressed() {
  if ( mouseButton == LEFT ) nightMode = true;
  if ( mouseButton == RIGHT ) nightMode = false;
} //End mousePressed
//
// End Main Program
