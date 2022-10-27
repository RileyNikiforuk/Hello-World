//Global Variables
int appWidth, appHeight;
float centerX, centerY, xStart, yStart, widthRect, heightRect;
color blackNightMode=#000000, orange=#FF8512, white=#FFFFFF, red=#FF0000; //Hexidecimal
color orangeNightMode=#FF8500, redNightMode=#FF0000;
float thin, normal, thick;
Boolean nightMode=false, randomBackground=false;
//
void setup() {
  //Declaring Display Geometry: landscape, square, portrait
  size(700, 400); //Able to deploy with fullScreen();
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
} //End setup
//
void draw() {
  // New Background Function "covers" old grey scale background
  // Night Mode means background cannot have blue // change randome for night mode, hard code "0"
  background(100); //grey scale (0-255) & Blue Issue for night mode
  //
  //Casting reminder
  background( color( random(0 , 255), random(0 , 255), random(0 , 255) ) ); // Color without blue
  //
  //background( blackNightMode );
  strokeWeight( thick );
  stroke( orange ); //orangeNightMode
  fill(red); //redNightMode
  rect(xStart, yStart, widthRect, heightRect);
  fill(white); //default reset
  stroke( blackNightMode ); //default reset
  strokeWeight(1); //default reset
} //End draw
//
void keyPressed() {
} //End keyPressed
//
void mousePressed() {
} //End mousePressed
//
// End Main Program
