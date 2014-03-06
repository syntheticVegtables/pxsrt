
import controlP5.*;
ControlP5 cp5;
int threshold;
int Value = 100;
int maxValue = 100;
int sliderTicks2 = 100;
int sliderTicks3 = 100;
int R = 100;
int G = 100;
int B = 100;
int D = 100;
int E = 100;
int R1 = 100;
int G1 = 100;
int B1 = 100;
int F =100;
int H = 100;
int R2 = 100;
int G2 = 100;
int B2 = 100;
int I = 100;
int J = 100;
Slider abc;

PImage m;

void setup() {

  m = loadImage("f.png");
 m.resize(800,800);
  
  size(m.width, m.height);
  frameRate(60);
 
  cp5 = new ControlP5(this); 
  cp5.addSlider("Value")
    .setPosition(50, 30)
    .setWidth(400)
      .setValue(0)
        .setRange(0, 1000)
          ;
  cp5.addSlider("maxValue")
    .setPosition(50, 40)
    .setWidth(400)
      .setValue(0)
        .setRange(0, 200)
          ;
  cp5.addSlider("R")
    .setPosition(50, 80)
      .setWidth(150)
        .setRange(6, -6) 
          .setValue(0)
            .setNumberOfTickMarks(13)
              .setSliderMode(Slider.FLEXIBLE)
                ;
  cp5.addSlider("G")
    .setPosition(50, 90)
      .setWidth(150)
        .setRange(6, -6) 
          .setValue(0)
            .setNumberOfTickMarks(13)
              .setSliderMode(Slider.FLEXIBLE)
                ;
  cp5.addSlider("B")
    .setPosition(50, 100)
      .setWidth(150)
        .setRange(6, -6) 
          .setValue(0)
            .setNumberOfTickMarks(13)
              .setSliderMode(Slider.FLEXIBLE)
              ;
  cp5.addSlider("D")
    .setPosition(400, 80)
    .setWidth(100)
      .setValue(1)
        .setRange(1, -1)
        ;
 cp5.addSlider("E")
    .setPosition(400, 90)
    .setWidth(100)
      .setValue(1)
        .setRange(1, -1)
                ;
   cp5.addSlider("R1")
    .setPosition(50, 120)
      .setWidth(150)
        .setRange(5, -5) 
          .setValue(0)
            .setNumberOfTickMarks(22)
              .setSliderMode(Slider.FLEXIBLE)
                ;
  cp5.addSlider("G1")
    .setPosition(50, 130)
      .setWidth(150)
        .setRange(5, -5) 
          .setValue(0)
            .setNumberOfTickMarks(22)
              .setSliderMode(Slider.FLEXIBLE)
                ;
  cp5.addSlider("B1")
    .setPosition(50, 140)
      .setWidth(150)
        .setRange(5, -5) 
          .setValue(0)
            .setNumberOfTickMarks(22)
              .setSliderMode(Slider.FLEXIBLE)
              ;
cp5.addSlider("F")
    .setPosition(400, 120)
    .setWidth(100)
      .setValue(1)
        .setRange(1, -1)
                ;
 cp5.addSlider("H")
    .setPosition(400, 130)
    .setWidth(100)
      .setValue(1)
        .setRange(1, -1)
                ;
   cp5.addSlider("R2")
    .setPosition(50, 160)
      .setWidth(150)
        .setRange(5, -5) 
          .setValue(0)
            .setNumberOfTickMarks(22)
              .setSliderMode(Slider.FLEXIBLE)
                ;
  cp5.addSlider("G2")
    .setPosition(50, 170)
      .setWidth(150)
        .setRange(5, -5) 
          .setValue(0)
            .setNumberOfTickMarks(22)
              .setSliderMode(Slider.FLEXIBLE)
                ;
               
  cp5.addSlider("B2")
    .setPosition(50, 180)
      .setWidth(150)
        .setRange(5, -5) 
          .setValue(0)
            .setNumberOfTickMarks(22)
              .setSliderMode(Slider.FLEXIBLE)
                ;
   cp5.addSlider("I")
    .setPosition(400, 160)
    .setWidth(100)
      .setValue(1)
        .setRange(1, -1)
        ;
 cp5.addSlider("J")
    .setPosition(400, 170)
    .setWidth(100)
      .setValue(1)
        .setRange(1, -1)
        ;
  threshold = maxValue;
}

void draw() {
  m.loadPixels();
  if(m !=null)
  for (int k=width; k<height*width-height; k++) {
    if (threshold < Value) {
      if (saturation(m.pixels[k+width]) > threshold) {
        m.pixels[k+1] = color(
        int(red(m.pixels[k-R])), 
        int(green(m.pixels[k-G])), 
        int(blue(m.pixels[k-B])));
      }
      else
        if (brightness(m.pixels[k-1]) > threshold) {
          m.pixels[k+width] = color(
          int(red(m.pixels[k-R1])), 
          int(green(m.pixels[k-G1])), 
          int(blue(m.pixels[k-B1])));
        } 
        else 
          if (hue(m.pixels[k-1]) > threshold) {
          m.pixels[k-width] = color(
          int(red(m.pixels[k-R2])), 
          int(green(m.pixels[k-G2])), 
          int(blue(m.pixels[k-B2])));
        } 
         
        
      threshold = threshold+1;
    } 
    else {
      threshold = 0;
    }
  }
  
  m.updatePixels();
  image(m, 0, 0);
}


void keyPressed() {
  if (key == 's') {
    save("normal.png");
 
  }
}
 
void saveHiRes(int scaleFactor) {
  PGraphics hires = createGraphics(width*scaleFactor, height*scaleFactor, JAVA2D);
  beginRecord(hires);
  hires.scale(scaleFactor);
  draw();
  endRecord();
  hires.save("hires.png");
}
