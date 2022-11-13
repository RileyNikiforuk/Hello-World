//Global Variables
int appWidth, appHeight;
float centerX, centerY, xStart, yStart, widthRect, heightRect;
color blackNightMode=#000000, orange=#FF8512, white=#FFFFFF, red=#FF0000, black=#000000; //Hexidecimal
color orangeNightMode=#FF8500, redNightMode=#FF0000, whiteNightMode=#FFFF00;
float thin, normal, thick;
Boolean nightMode=false, randomBackground=false;
Boolean greyScale=false, backgroundColor=false;
int LrectY = 350; //initial Left paddle position
int RrectY = 350;
float ellX = width / 2; // initial ellipse position in the middle
float ellY = height / 2;
boolean moveRight = true; //this means moving left is false
boolean moveDown = true; //this means moving up is false
float speedSide = 3; //speed in X direction, higher value is greater speed
float speedVertical = 4; //speed in Y direction
int countR = 0; //score for right side
int countL = 0; //score for left side
PFont font; //font used for scoring
float wBrokenLine1, wBrokenLine2, wBrokenLine3, wBrokenLine4, wBrokenLine5, wBrokenLine6, wBrokenLine7;
float hBrokenLine1, hBrokenLine2, hBrokenLine3, hBrokenLine4, hBrokenLine5, hBrokenLine6, hBrokenLine7;
float textX, textY, LcounterX, LcounterY, RcounterX, RcounterY, LpaddleX, LpaddleY;
//
void setup() {
  //Declaring Display Geometry: landscape, square, portrait
  size(800, 800); //Able to deploy with fullScreen();
  //fullScreen();
  appWidth = width;
  appHeight = height;
  //Concatenation: , or + (i.e space)
  println("\t\tWidth="+width, "\t\tHeight="+height);
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
  wBrokenLine1 = appWidth * 3.5/7;
  wBrokenLine2 = appWidth * 3.5/7;
  wBrokenLine3 = appWidth * 3.5/7; 
  wBrokenLine4 = appWidth * 3.5/7;
  wBrokenLine5 = appWidth * 3.5/7;
  wBrokenLine6 = appWidth * 3.5/7;
  wBrokenLine7 = appWidth * 3.5/7;
  hBrokenLine1 = appHeight * 0.5/7;
  hBrokenLine2 = appHeight * 1.5/7;
  hBrokenLine3 = appHeight * 2.5/7;
  hBrokenLine4 = appHeight * 3.5/7;
  hBrokenLine5 = appHeight * 4.5/7;
  hBrokenLine6 = appHeight * 5.5/7;
  hBrokenLine7 = appHeight * 6.5/7;
  textX = appWidth * 3/7;
  textY = appHeight * 0.4/7;
  LcounterX = appWidth * 2.5/7;
  LcounterY = appHeight * 0.4/7;
  RcounterX = appWidth * 4.25/7;
  RcounterY = appHeight * 0.4/7;
  LpaddleX = appWidth * 0.5/7;
  LpaddleX = appHeight * 3.5/7;
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
  //if ( nightMode == true ) 
//{
  //background( blackNightMode );
  //stroke( orangeNightMode );
  //fill(redNightMode);
//} //else 
//{
  //stroke( orange );
  //fill( red );
//}
  //rect(xStart, yStart, widthRect, heightRect);
  //fill(white); //default reset
  //stroke( blackNightMode ); //default reset
  //strokeWeight(1); //default reset
  //circle(50, 100, 60);
  //circle(130, 100, 60);
  //circle(90, 110, 60);
  //circle(90, 75, 60);
  if ( nightMode == true ) 
{
  fill( whiteNightMode );
} else 
{
  fill( white );
}
  background(black);
  textFont(font); //introduce the font
  ellipse(ellX, ellY, 25, 25);
  text("Pong", textX, textY);
  rect(LpaddleX, LrectY, 15, 115);
  text(countL, LcounterX, LcounterY); //score for left side
  rect(665, RrectY, 15, 115);
  text(countR, RcounterX, RcounterY); //score for right side
  rect(wBrokenLine1, hBrokenLine1, 5, 50);
  rect(wBrokenLine2, hBrokenLine2, 5, 50);
  rect(wBrokenLine3, hBrokenLine3, 5, 50);
  rect(wBrokenLine4, hBrokenLine4, 5, 50);
  rect(wBrokenLine5, hBrokenLine5, 5, 50);
  rect(wBrokenLine6, hBrokenLine6, 5, 50);
  rect(wBrokenLine7, hBrokenLine7, 5, 50);
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
  speedSide = random(3, 6); //random number between 3-6, speed changes
}
if ( ellY >= 690 ) { //creates border at bottom, so circle will move up
  moveDown = false;
  speedSide = random(3, 15); //random number between 3-6, speed changes
}
if ( ellX >= 690 ) { //creates border at right that resets the ball and adds to score
  countL++;
  ellX = width / 2;
  ellY = height / 2;
  speedSide = random(3, 8); //random number between 3-8, speed changes
}
if ( ellX <= 10 ) { //creates border at left that resets the ball and adds to score
  countR++;
  ellX = width / 2;
  ellY = height / 2;
  speedSide = random(3, 8); //random number between 3-8, speed changes
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
