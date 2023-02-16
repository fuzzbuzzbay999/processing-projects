void settings(){
  size(600, 200);  
}
 
void setup() {
  String[] args = {"--location=0,0", "Foo"};
  Foo sa = new Foo(/*32, 20*/);
  PApplet.runSketch(args, sa);
    Foo s = new Foo(2000,100);
    PApplet.runSketch(args, s);
}
 
void draw() {
  background(0);
  ellipse(50, 50, 10, 10);
  
    
}     
