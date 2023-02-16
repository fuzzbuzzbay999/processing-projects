float x = 0;
float y = 0;
int red = 0;
int blue =0;
int green = 0;
int start = 0;
int start2 = 0;
void setup() {
  fullScreen();
  frameRate(200);
  rectMode (CENTER);
  noStroke();
}

void draw () { 
  println(blue);
  translate(width/2, height/2);
  rotate(x);
  fill(red,green,blue);
  //stroke(x*100);
  rect(0, 0, x*-100, x*-1);
  if (start == 0) {
    red++;
   }
  if (red == 255){
  green++;
  start = 1;
  
  }
  if (green == 255) {
    blue ++;
    red--;
  }
  if (blue == 255) {
    green--;
    red = 0;
    start ++;
  }
  if(start == 256) {
    red ++;
    blue++;
    start2++;
  }

 if (start2 == 255) {
    red = 0;
    green = 0;
    blue = 0;
    red = 0;
    start = 0;
    start2 = 0;
 }
 
  
  if ( y == 0) {
  if (x < 18.860336) {
  x += 0.01;
  }else{
    y = 1;
   }
  }
  
  if (y == 1) {
    x -= 0.01;
  if (x < 18.860336) {
  x -= 0.01;
  if (x == 0.9999993){
    y = 0;
    
   } 
  }
 }
}
