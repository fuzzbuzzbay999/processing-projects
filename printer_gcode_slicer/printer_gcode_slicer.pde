public class LOC {
  public int x;
  public int y;
  public int wide;
  public int tall;
  public String adress;
}


//vars for iamge transformation;
int difx, dify, pdifx, pdify;
boolean RUN;
int selection=-1;

LOC img;

PGraphics UI;

PGraphics pa;
PGraphics pr;

PGraphics grayscales;
PGraphics lineDetect;
File file = null;
PImage PrintImage = null;
PImage Image = null;
ArrayList<String> images = new ArrayList<String>();
ArrayList<LOC> imageLOC = new ArrayList<LOC>();

LOC imgSelected = null;

void setup() {
  //size(2000,1000);
  size(1200, 700);
  pa = createGraphics(width, height);
  pr = createGraphics(width, height);
  
  UI=createGraphics(width,height);
}

void draw() {
  //its needed
  image(UI,0,0);
}

void keyPressed() {
  if (key=='f') {
    selectInput("select Image:", "ImageSelected", file);

    println("ye");
  }
  if (key == 'r') {
    println("why");
    drawImages();
  }
  if (key==' ') {
    grayScale();
  }
}

void ImageSelected(File selection) {
  try {
    //makes a new instance of location
    imageLOC.add(new LOC());
    PrintImage=loadImage(selection.getAbsolutePath());
    images.add(selection.getAbsolutePath());
    //sets the x y width and height of location to the image dementions
    imageLOC.get(imageLOC.size()-1).x = int(random(0, width-100));
    imageLOC.get(imageLOC.size()-1).y = int(random(0, height-100));
    imageLOC.get(imageLOC.size()-1).wide = PrintImage.width;
    imageLOC.get(imageLOC.size()-1).tall = PrintImage.height;
    imageLOC.get(imageLOC.size()-1).adress =   selection.getAbsolutePath();
    //prints the dementions of the image
    println(imageLOC.get(0).x+" "+imageLOC.get(0).y+" "+imageLOC.get(0).wide+" "+imageLOC.get(0).tall);
    println(imageLOC.get(0).adress);
  }
  catch(Exception e) {
    //e.printStackTrace();
    System.err.println("oops woopsy, make sure its an image. you dumb fuck");
    imageLOC.remove(imageLOC.size()-1);
  }
  //println(RUN);
  delay(1000);
  drawImages();
}

void drawImages() {
  println("maybe");
  pa.beginDraw();
  pa.background(0);
  for (LOC img : imageLOC) {
    PrintImage = loadImage(img.adress);
    pa.image(PrintImage, img.x, img.y, img.wide/10, img.tall/10);
  }
  pa.endDraw();
  println("almost");
  fill(30);
  image(pa, 0, 0);
  image(pr, 0, 0);
  println("yes");
}

void mouseReleased() {
  drawImages();
}

void  mousePressed() {
  for (int i=0; i<imageLOC.size(); i++) {
    img=imageLOC.get(i);
    if (mouseX>img.x && mouseX<img.x+img.wide/10 && mouseY>img.y && mouseY<img.y+img.tall/10) {
      imgSelected=imageLOC.get(i);
      println(imgSelected.adress);
    }
  }
  println("whakdfjabf");
  if (imgSelected!=null) {
    println(imgSelected.adress);
    pr.beginDraw();
    pr.clear();
    pr.noFill();
    pr.strokeWeight(5);
    pr.stroke(0, 0, 255);
    pr.rect(imgSelected.x, imgSelected.y, imgSelected.wide/10, imgSelected.tall/10);
    pr.endDraw();
    drawImages();
  }
}


void mouseDragged() {
  if (imgSelected!=null) {
    difx = imgSelected.x-mouseX;
    dify = imgSelected.y-mouseY;
    //previous differences from image top left corner and mouse pos
    pdifx = imgSelected.x-pmouseX;
    pdify = imgSelected.y-pmouseY;
    //adds or subtracts the total difference from the image x and y
    imgSelected.x+=pdifx-difx;
    imgSelected.y+=pdify-dify;
  }
}

void grayScale() {

  Image = loadImage(imgSelected.adress);
  grayscales = createGraphics(Image.width, Image.height);
  lineDetect = createGraphics(Image.width*4, Image.height*4);
  Image.loadPixels();
  grayscales.beginDraw();
  for (int x =0; x<Image.width; x++) {
    for (int y=0; y<Image.height; y++) {

      grayscales.stroke(red(int(map(Image.get(x, y), 0, 255, 0, 255))), 255/3);
      grayscales.rect(x, y, 1, 1);
      grayscales.stroke(green(int(map(Image.get(x, y), 0, 255, 0, 255))), 255/3);
      grayscales.rect(x, y, 1, 1);
      grayscales.stroke(blue(int(map(Image.get(x, y), 0, 255, 0, 255))), 255/3);
      grayscales.rect(x, y, 1, 1);
    }
  }
  grayscales.endDraw();
  image(grayscales, 0, 0);
  grayscales.loadPixels();
  println(grayscales.width);
  println(grayscales.height);
  lineDetect.beginDraw();
  lineDetect.stroke(0);
  for (int x=0; x<6; x++) {
    for (int y=0; y<6; y++) {
      lineDetect.fill(grayscales.get(x, y));
      lineDetect.rect(x*10, y*10, 10, 10);
    }
  }
  lineDetect.endDraw();
  image(lineDetect, grayscales.width+100, 0);
}
void mouseMoved() {
  //background(100);
  text("X: "+floor(mouseX/10),20,20);
  text("Y: "+floor(mouseY/10),20,50);
}
