////// GLOBAL VARIABLES //////
int opacity = 152; // initial value for opacity

////// COLOUR DEFINITIONS //////
// environment colours
color sky = #336b7f;
color sea = #3cafa6;
color sand = #f7b452;

// bright colours
color yellow = #cc9933;
color green = #009966;
color red = #cc3333;
color blue = #006666;
color[] bright = {
  yellow, green, red, blue
};

// subtle colours
color subtleYellow = #cca766;
color subtleGreen = #4d997d;
color subtleRed = #cc6666;
color subtleBlue = #3d7774;
color[] subtle = {
  subtleYellow, subtleGreen, subtleRed, subtleBlue
};
color subtleBrown = #736357;
color subtleGrey = #6c6c6b;  

void setup() {
  size(800, 800);
}

void draw() {
  noStroke();
  noLoop();
  drawEnv(); 
  drawWatermelon(width / 2, height / 3, width * 0.9, 0.9, 15, 25);
  drawLollipop(210, 210, 300);
  renderTitle("Lollipop & Watermelon", 48);
}

void drawEnv() {  
  float x = 0;
  float y = 0;
  float yH = 300; // definies height of the environment sections

  // sky  
  fill(sky);
  rect(x, y, width, yH); 

  // sea
  y = yH;
  yH += 200;
  fill(sea);
  rect(x, y, width, yH);  

  // sand
  y = yH;
  yH += 300;
  fill(sand);
  rect(x, y, width, yH);
}

void drawWatermelon(float melonCentreX, float melonCentreY, float diameter, float transformationRatio, float seedDiameterX, float seedDiameterY) {
  // generates a green part of the watermelon
  fill(bright[1]);
  arc(melonCentreX, melonCentreY, diameter, diameter, 0, PI); 

  // generates a red part of the watermelon
  fill(bright[2]);
  arc(melonCentreX, melonCentreY, diameter * transformationRatio, diameter * transformationRatio, 0, PI);  

  // generates seeds within a red part of the watermelon
  fill(#000000, opacity);  
  int seedCount = 0;
  while (seedCount < 15 ) {
    // sets watermelon box boundary where the seeds will occur
    float melonBox = ((diameter - seedDiameterY * 4) * transformationRatio) / 2;
    // sets random X and Y position for the seed
    float seedX = random(melonCentreX - melonBox, melonCentreX + melonBox);
    float seedY = random(melonCentreY + seedDiameterY, melonCentreY + seedDiameterY + melonBox);          
    // sets a seed distance from the centre of the watermelon
    float distanceFromCentre = sqrt(pow(abs(melonCentreX - seedX), 2) + pow(abs(melonCentreY - seedY), 2)); // using Pythagorean theorem
    if (distanceFromCentre < melonBox) {
      ellipse(seedX, seedY, seedDiameterX, seedDiameterY);
      seedCount++;
    }
  }
}

void drawLollipop(float circleCentreX, float circleCentreY, float innerCircleDiameter) {
  float section = 2 * PI / 8; // 1/8 of a circle (the lollipop is going to have 8 parts)
  float rad1 = section * 0.5; // setting starting angle
  float rad2 = rad1 + section;
  float outerCircleDiameter = innerCircleDiameter * 1.3;

  // generates a lollipop stick
  stroke(subtleBrown);
  strokeWeight(10);
  line(circleCentreX, circleCentreY, circleCentreX, (circleCentreY + outerCircleDiameter) * 1.1);

  // generates a circle with colourful sections
  for (int i = 0; i < 8; i++) {   
    // creates and colours a 1/8 of a lollipop
    noStroke();
    fill(subtle[i % subtle.length]);
    arc(circleCentreX, circleCentreY, outerCircleDiameter, outerCircleDiameter, rad1, rad2 );  
    fill(bright[i % bright.length]);
    arc(circleCentreX, circleCentreY, innerCircleDiameter, innerCircleDiameter, rad1, rad2 );  
    
    // divides colourful sections  
    float lineEndPointX = circleCentreX + (outerCircleDiameter / 2 * cos(rad1));
    float lineEndPointY = circleCentreY + (outerCircleDiameter / 2 * sin(rad1));
    stroke(#ffffff, opacity * 0.2);
    strokeWeight(15);
    line(circleCentreX, circleCentreY, lineEndPointX, lineEndPointY); 

    // increments radians
    rad1 = rad2;
    rad2 += section;
  }

  // generates two inner centres of the lollipop
  fill(#ffffff, opacity * 1.1);
  ellipse(circleCentreX, circleCentreY, innerCircleDiameter * 0.15, innerCircleDiameter * 0.15);   
  noStroke();
  fill(subtleGrey);
  ellipse(circleCentreX, circleCentreY, innerCircleDiameter * 0.1, innerCircleDiameter * 0.1);
}

// renders name of the artwork
void renderTitle(String title, int fontSize) {
  PFont abeezee = loadFont("abeezee.vlw");  
  textFont(abeezee);
  fill(#ffffff, opacity * 0.4);
  textAlign(CENTER);
  textSize(fontSize);
  text(title, width / 2, height * 0.95);
}

