// GLOBAL VARIABLES
  float x = 0; // initial position for x coordinate
  float y = 0; // initia; position for y coordinate
  float yH = 300; // initial position for y height coordinate
  
// COLOUR DEFINITIONS ///
  // environment colours
  color sky = #336b7f;
  color sea = #3cafa6;
  color sand = #f7b452;
  
  // bright colours
  color yellow = #cc9933;
  color green = #009966;
  color red = #cc3333;
  color blue = #006666;
  color[] bright = {yellow, green, red, blue};
  
  // subtle colours
  color subtleYellow = #cca766;
  color subtleGreen = #4d997d;
  color subtleRed = #cc6666;
  color subtleBlue = #3d7774;
  color subtleBrown = #6c6c6b;
  color subtleGrey = #6c6c6b;
  color[] subtle = {subtleYellow, subtleGreen, subtleRed, subtleBlue};
  
  
// SETUP
void setup() {
  size(800, 800);
  background(#cccccc); 

}

// DRAW
void draw() {
  noStroke();
  drawEnv(); // drawing environment (sky, sea and sand)
  drawWatermelon(width/2, height/3, width*0.9, height*0.9, 0.9); // drawing watermelon
}

void drawEnv() { 
  // sets no looping for current function  
  noLoop();
  
  // drawing sky
  fill(sky);
  rect(x, y, width, yH); 
  
  // drawing sea
  y = yH;
  yH += 200;
  fill(sea);
  rect(x, y, width, yH);  
  
  // drawing sand
  y = yH;
  yH += 300;
  fill(sand);
  rect(x, y, width, yH);    

}

void drawWatermelon(float xStart, float yStart, float w, float h, float transformationRatio) {
    // outer melon
      fill(bright[1]);
      arc(xStart, yStart, w, h, 0, 3.14); 
      
    // inner melon
      fill(bright[2]);
      arc(xStart, yStart, w*transformationRatio, h*transformationRatio, 0, 3.14);  
}
