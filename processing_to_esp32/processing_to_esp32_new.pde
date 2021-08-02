// libraries
import processing.serial.*;

boolean overButton = false;
boolean serialIn = false;

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
       instc,
       seqmax1,
       seqmax2,
       seqmax3,
       seqmax4,
       seqmax5; 

int value = 0;

void setup() {
  size (570, 350);
  smooth();
  port = new Serial(this, Serial.list()[1], 115200);
  // create the button object
  play_button = new Button("Play", 10, 10, 110, 50);
  stop_button = new Button("Stop", 130, 10, 110, 50);
  on_button = new Button("Click on/off", 250, 10, 110, 50);
  cl_button = new Button("Clear all", 370, 10, 110, 50);
  back_button = new Button("back", 10, 70, 110, 50);
  rec_button = new Button("rec", 130, 70, 110, 50);  
  inst1 = new Button("1",10,190,50,50);
  inst2 = new Button("2",70,190,50,50); 
  inst3 = new Button("3",130,190,50,50);
  inst4 = new Button("4",190,190,50,50); 
  inst5 = new Button("5",250,190,50,50);
  inst6 = new Button("6",310,190,50,50); 
  inst7 = new Button("7",10,250,50,50);
  inst8 = new Button("8",70,250,50,50);   
  inst9 = new Button("9",130,250,50,50);
  insta = new Button("A",190,250,50,50); 
  instb = new Button("B",250,250,50,50);
  instc = new Button("C",310,250,50,50); 
  seqmax1 = new Button("seq1",10,130,50,50);   
  seqmax2 = new Button("seq2",70,130,50,50);
  seqmax3 = new Button("seq3",130,130,50,50); 
  seqmax4 = new Button("seq4",190,130,50,50);
  seqmax5 = new Button("seq5",250,130,50,50); 
}

void draw() {
background(10);
line(mouseX, 20, pmouseX, 80); 
println(mouseX + " : " + pmouseX);
fill(0);
rect(500,39,60,255);
fill(100,0,0);
rect(500,39+255+value,60,20);
  // draw the button in the window
  if(play_button.mousePressed()) play_button.Draw(100);
  else play_button.Draw(200);
  if(stop_button.mousePressed()) stop_button.Draw(100);
  else stop_button.Draw(200);
  if(on_button.mousePressed()) on_button.Draw(100);
  else on_button.Draw(200);
  if(cl_button.mousePressed()) cl_button.Draw(100);
  else cl_button.Draw(200);  
  if(back_button.mousePressed()) back_button.Draw(100);
  else back_button.Draw(200);
  if(rec_button.mousePressed()) rec_button.Draw(100);
  else rec_button.Draw(200);
  if(inst1.mousePressed()) inst1.Draw(100);
  else inst1.Draw(200);
  if(inst2.mousePressed()) inst2.Draw(100);
  else inst2.Draw(200);    
  if(inst3.mousePressed()) inst3.Draw(100);
  else inst3.Draw(200);
  if(inst4.mousePressed()) inst4.Draw(100);
  else inst4.Draw(200);
  if(inst5.mousePressed()) inst5.Draw(100);
  else inst5.Draw(200);
  if(inst6.mousePressed()) inst6.Draw(100);
  else inst6.Draw(200);  
  if(inst7.mousePressed()) inst7.Draw(100);
  else inst7.Draw(200);
  if(inst8.mousePressed()) inst8.Draw(100);
  else inst8.Draw(200);
  if(inst9.mousePressed()) inst9.Draw(100);
  else inst9.Draw(200);
  if(insta.mousePressed()) insta.Draw(100);
  else insta.Draw(200);    
  if(instb.mousePressed()) instb.Draw(100);
  else instb.Draw(200);
  if(instc.mousePressed()) instc.Draw(100);
  else instc.Draw(200);  
  if(seqmax1.mousePressed()) seqmax1.Draw(100);
  else seqmax1.Draw(200);
  if(seqmax2.mousePressed()) seqmax2.Draw(100);
  else seqmax2.Draw(200);
  if(seqmax3.mousePressed()) seqmax3.Draw(100);
  else seqmax3.Draw(200);    
  if(seqmax4.mousePressed()) seqmax4.Draw(100);
  else seqmax4.Draw(200);
  if(seqmax5.mousePressed()) seqmax5.Draw(100);
  else seqmax5.Draw(200);    
  if(serialIn){
    fill(255,0,0);
    rect(390, 230, 30, 30);
  }else{
    fill(50);
    rect(390, 230, 30, 30);  
  }
}
void mouseDragged(){
value = pmouseY-39-255;
println(pmouseX);
}
// mouse button clicked
void mousePressed()
{
  if (play_button.mousePressed()) {
    port.write(0xb0);
    port.write(0x02);
    port.write(0x01);
    }
  if (stop_button.mousePressed()) {
    port.write(0xb0);
    port.write(0x01);
    port.write(0x01);
    }    
  if (on_button.mousePressed()) {
    port.write(0xb0);
    port.write(0x50);
    port.write(0x01);
    }
  if (cl_button.mousePressed()) {
    port.write(0xb1);
    port.write(0x50);
    port.write(0x01);
    } 
  if (back_button.mousePressed()) {
    port.write(0xb8);
    port.write(0x52);
    port.write(0x01);
    }
  if (rec_button.mousePressed()) {
    port.write(0xba);
    port.write(0x52);
    port.write(0x01);
    }        
  if (inst1.mousePressed()) {
    port.write(0x90);
    port.write(0x30);
    port.write(0x7f);
  }
  if (inst2.mousePressed()) {
    port.write(0x90);
    port.write(0x31);
    port.write(0x7f);
  }  
  if (inst3.mousePressed()) {
    port.write(0x90);
    port.write(0x32);
    port.write(0x7f);
  }
  if (inst4.mousePressed()) {
    port.write(0x90);
    port.write(0x33);
    port.write(0x7f);
  }
  if (inst5.mousePressed()) {
    port.write(0x90);
    port.write(0x34);
    port.write(0x7f);
  }
  if (inst6.mousePressed()) {
    port.write(0x90);
    port.write(0x35);
    port.write(0x7f);
  }  
  if (inst7.mousePressed()) {
    port.write(0x90);
    port.write(0x36);
    port.write(0x7f);
  }
  if (inst8.mousePressed()) {
    port.write(0x90);
    port.write(0x37);
    port.write(0x7f);
  }      
  if (inst9.mousePressed()) {
    port.write(0x90);
    port.write(0x38);
    port.write(0x7f);
  }
  if (insta.mousePressed()) {
    port.write(0x90);
    port.write(0x39);
    port.write(0x7f);
  }  
  if (instb.mousePressed()) {
    port.write(0x90);
    port.write(0x3a);
    port.write(0x7f);
  }
  if (instc.mousePressed()) {
    port.write(0x90);
    port.write(0x3b);
    port.write(0x7f);
  }    
  if (seqmax1.mousePressed()) {
    port.write(0xb4);
    port.write(0x50);
    port.write(0x01);
    }
  if (seqmax2.mousePressed()) {
    port.write(0xb5);
    port.write(0x50);
    port.write(0x01);
    }    
  if (seqmax3.mousePressed()) {
    port.write(0xb6);
    port.write(0x50);
    port.write(0x01);
    }
  if (seqmax4.mousePressed()) {
    port.write(0xb7);
    port.write(0x50);
    port.write(0x01);
    } 
  if (seqmax5.mousePressed()) {
    port.write(0xb8);
    port.write(0x52);
    port.write(0x01);
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
  
  void Draw(float colorB) {
    fill(colorB);
    stroke(141);
    rect(x, y, w, h, 10);
    textAlign(CENTER, CENTER);
    fill(0);
    text(label, x + (w / 2), y + (h / 2));
  }
  
boolean mousePressed() {
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
      char c = message.charAt(1);
      {
      switch(c)
      {
        case 'b':
        serialIn = true;
        break;
        case 'n':
        serialIn = false;
        break;
      } 
     }  
  }  
  }
  catch (Exception e) {
  }
}
