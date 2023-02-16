import java.awt.Robot;
import java.awt.event.KeyEvent;
//import java.awt.Color;
Robot rbt;
 
void setup() {
  size(100, 100);
 
  try {
    rbt = new Robot();
  } catch(Exception e) {
    e.printStackTrace();
  }
}
 void draw(){
   //if(keyPressed)exit(); that doesnt work when the bot is using the keyboard
   if(key == ESC)exit();
   rbt.keyPress(KeyEvent.VK_SHIFT);
   rbt.keyPress(KeyEvent.VK_AT);
   delay(1);
   rbt.keyRelease(KeyEvent.VK_SHIFT);
   rbt.keyRelease(KeyEvent.VK_AT);
   delay(50);
   rbt.keyPress(KeyEvent.VK_H);
   delay(1);
   rbt.keyRelease(KeyEvent.VK_H);
   delay(50);   
   rbt.keyPress(KeyEvent.VK_E);
   delay(1);
   rbt.keyRelease(KeyEvent.VK_E);
   delay(50);   
   rbt.keyPress(KeyEvent.VK_R);
   delay(1);
   rbt.keyRelease(KeyEvent.VK_R);
   delay(50);
   rbt.keyPress(KeyEvent.VK_E);
   delay(1);
   rbt.keyRelease(KeyEvent.VK_E);
   delay(50);
   rbt.keyPress(KeyEvent.VK_ENTER);
   delay(1);
   rbt.keyRelease(KeyEvent.VK_ENTER);
   delay(50);


 }
 
