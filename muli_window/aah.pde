import processing.core.*;
 
public class Foo extends PApplet {
 
  private final int w, h;
 
  public Foo() {
    w = 200;
    h = 200;
  }
 
  //public Foo(int w, int h) {
  //  this.w = w;
  //  this.h = h;
  //}
 
  public void settings() {
    size(w, h);
  }
 
  public void draw() {
    background(255);
    fill(0);
    ellipse(100, 50, 10, 10);
  }
}
