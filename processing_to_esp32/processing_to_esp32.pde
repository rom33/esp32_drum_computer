// libraries
import processing.serial.*;
// serial connection
Serial port;

Button on_button, 
       cl_button, 
       play_button, 
       stop_button, 
       back_button,
       rec_button,
       inst1, 
       inst2, 
       inst3, 
       inst4, 
       inst5, 
       inst6, 
       inst7, 
       inst8, 
       inst9, 
       insta,
       instb, 
       instc; 

int clk = 1;       // number of times the button is clicked

void setup() {
  size (490, 350);
  smooth();
  port = new Serial(this, Serial.list()[1], 115200);
  // create the button object
  play_button = new Button("Play", 10, 10, 110, 50);
  stop_button = new Button("Stop", 130, 10, 110, 50);
  on_button = new Button("Click on/off", 250, 10, 110, 50);
  cl_button = new Button("Clear all", 370, 10, 110, 50);
  back_button = new Button("back", 10, 70, 110, 50);
  rec_button = new Button("rec", 130, 70, 110, 50);  
  inst1 = new Button("1",10,130,50,50);
  inst2 = new Button("2",70,130,50,50); 
  inst3 = new Button("3",130,130,50,50);
  inst4 = new Button("4",190,130,50,50); 
  inst5 = new Button("5",250,130,50,50);
  inst6 = new Button("6",310,130,50,50); 
  inst7 = new Button("7",10,190,50,50);
  inst8 = new Button("8",70,190,50,50);   
  inst9 = new Button("9",130,190,50,50);
  insta = new Button("A",190,190,50,50); 
  instb = new Button("B",250,190,50,50);
  instc = new Button("C",310,190,50,50); 
}

void draw() {
  // draw the button in the window
  play_button.Draw();
  stop_button.Draw();
  on_button.Draw();
  cl_button.Draw();
  back_button.Draw();
  rec_button.Draw();
  inst1.Draw();
  inst2.Draw();
  inst3.Draw();
  inst4.Draw(); 
  inst5.Draw();
  inst6.Draw();
  inst7.Draw();
  inst8.Draw(); 
  inst9.Draw();
  insta.Draw();
  instb.Draw();
  instc.Draw();      
}
// mouse button clicked
void mousePressed()
{
  if (play_button.MouseIsOver()) {
    port.write(0xb0);
    port.write(0x02);
    port.write(0x01);
    }
  if (stop_button.MouseIsOver()) {
    port.write(0xb0);
    port.write(0x01);
    port.write(0x01);
    }    
  if (on_button.MouseIsOver()) {
    port.write(0xb0);
    port.write(0x50);
    port.write(0x01);
    }
  if (cl_button.MouseIsOver()) {
    port.write(0xb1);
    port.write(0x50);
    port.write(0x01);
    } 
  if (back_button.MouseIsOver()) {
    port.write(0xb8);
    port.write(0x52);
    port.write(0x01);
    }
  if (rec_button.MouseIsOver()) {
    port.write(0xba);
    port.write(0x52);
    port.write(0x01);
    }        
  if (inst1.MouseIsOver()) {
    port.write(0x90);
    port.write(0x30);
    port.write(0x7f);
  }
  if (inst2.MouseIsOver()) {
    port.write(0x90);
    port.write(0x31);
    port.write(0x7f);
  }  
  if (inst3.MouseIsOver()) {
    port.write(0x90);
    port.write(0x32);
    port.write(0x7f);
  }
  if (inst4.MouseIsOver()) {
    port.write(0x90);
    port.write(0x33);
    port.write(0x7f);
  }
  if (inst5.MouseIsOver()) {
    port.write(0x90);
    port.write(0x34);
    port.write(0x7f);
  }
  if (inst6.MouseIsOver()) {
    port.write(0x90);
    port.write(0x35);
    port.write(0x7f);
  }  
  if (inst7.MouseIsOver()) {
    port.write(0x90);
    port.write(0x36);
    port.write(0x7f);
  }
  if (inst8.MouseIsOver()) {
    port.write(0x90);
    port.write(0x37);
    port.write(0x7f);
  }      
  if (inst9.MouseIsOver()) {
    port.write(0x90);
    port.write(0x38);
    port.write(0x7f);
  }
  if (insta.MouseIsOver()) {
    port.write(0x90);
    port.write(0x39);
    port.write(0x7f);
  }  
  if (instb.MouseIsOver()) {
    port.write(0x90);
    port.write(0x3a);
    port.write(0x7f);
  }
  if (instc.MouseIsOver()) {
    port.write(0x90);
    port.write(0x3b);
    port.write(0x7f);
  }    
}

// the Button class
class Button {
  String label; // button label
  float x;      // top left corner x position
  float y;      // top left corner y position
  float w;      // width of button
  float h;      // height of button
  
  // constructor
  Button(String labelB, float xpos, float ypos, float widthB, float heightB) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
  }
  
  void Draw() {
    fill(218);
    stroke(141);
    rect(x, y, w, h, 10);
    textAlign(CENTER, CENTER);
    fill(0);
    text(label, x + (w / 2), y + (h / 2));
  }
  
  boolean MouseIsOver() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      return true;
    }
    return false;
  }
}
// this part is executed, when serial-data is received
void serialEvent(Serial p) {
  try {
    // get message till line break (ASCII > 13)
    String message = p.readStringUntil(13);
    // just if there is data
    if (message != null) {
      println("message received: "+trim(message));
    }
  }
  catch (Exception e) {
  }
}
