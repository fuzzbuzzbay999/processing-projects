import processing.video.*;

PrintWriter notes;

Movie m;
PImage mS;
int vScale = 2;
int mW;
int mH;
boolean gotDim = false;

int newFrame = 500;

int pr=0; 

void setup() {
  size(800,360);
  m = new Movie(this, "test.mov"); 
  m.loop();
  m.speed(1);
  m.frameRate(29.97);
 // m.jump(14.614);


}

void draw() {  
background(100); 
text(m.time()*1000,width-100,height-100);
text(m.time(),width-100,height-50);
text(newFrame,width-100,height-150);
stroke(255,255,0);
text(pr,width-100,height-25);
  if (!gotDim) {
    if (mW == 0 && mH == 0) {
      mW = m.width; 
      mH = m.height;
    } else if (mW > 0 && mH > 0) {
      gotDim = true;
      println("width: " + mW +" " + "Height: " + mH);
    }
  }

  if (gotDim) {
    mS = m.get(); 
    mS.resize(mW/vScale, mH/vScale);  
    image(mS, 0, 0);

  }
if(m.available()){
m.read();
}

}

void keyPressed() {
    if (keyCode == LEFT)if (0 < newFrame) newFrame--; 
    if (keyCode == RIGHT)if (newFrame < getLength() - 1) newFrame++;
    
  
    if(key == ' ')println("- StartTime: "+(int)(m.time()*1000) + "\n" + "  Lane: 4" + "\n" + "  KeySounds: []");
 

  setFrame(newFrame);  
}
  
int getFrame() {    
  return ceil(m.time() * 30) - 1;
}

void setFrame(int n) {
  m.play();
    
  // The duration of a single frame:
  float frameDuration = 1.0 / m.frameRate;
    
  // We move to the middle of the frame by adding 0.5:
  float where = (n + 0.5) * frameDuration; 
    
  // Taking into account border effects:
  float diff = m.duration() - where;
  if (diff < 0) {
    where += diff - 0.25 * frameDuration;
  } 
    
  m.jump(where);
  m.pause();  
}  

int getLength() {
  return int(m.duration() * m.frameRate);
}
