import controlP5.*; //library
import processing.serial.*; //library
Serial port; //do not change
ControlP5 cp5; //create ControlP5 object
PFont font;
boolean serialIn = false;

void setup() {

  size(600, 600); //window size, (width, height)
  printArray(Serial.list());
  port = new Serial(this, Serial.list()[1], 115200);
  cp5 = new ControlP5(this); //do not change
  int buttonSizeX = 110;
  int buttonSizeY = 50;
  
     font = createFont("calibri", 15);    // custom fonts for buttons and title
  
     cp5.addButton("Play").setPosition(10, 10).setSize(buttonSizeX, buttonSizeY).setFont(font);
     cp5.addButton("Stop").setPosition(130, 10).setSize(buttonSizeX, buttonSizeY).setFont(font);
     cp5.addButton("Clk_On_Off").setPosition(250, 10).setSize(buttonSizeX, buttonSizeY).setFont(font);
     cp5.addButton("Clear_all").setPosition(370, 10).setSize(buttonSizeX, buttonSizeY).setFont(font);   
     cp5.addButton("back").setPosition(10, 70).setSize(buttonSizeX, buttonSizeY).setFont(font);
     cp5.addButton("rec").setPosition(130, 70).setSize(buttonSizeX, buttonSizeY).setFont(font);
     cp5.addButton("max1").setPosition(10, 130).setSize(buttonSizeY, buttonSizeY).setFont(font);
     cp5.addButton("max2").setPosition(70, 130).setSize(buttonSizeY, buttonSizeY).setFont(font);
     cp5.addButton("max3").setPosition(130, 130).setSize(buttonSizeY, buttonSizeY).setFont(font);
     cp5.addButton("max4").setPosition(190, 130).setSize(buttonSizeY, buttonSizeY).setFont(font);
     cp5.addButton("max5").setPosition(250, 130).setSize(buttonSizeY, buttonSizeY).setFont(font); 
     cp5.addButton("inst1").setPosition(10, 190).setSize(buttonSizeY, buttonSizeY).setFont(font);
     cp5.addButton("inst2").setPosition(70, 190).setSize(buttonSizeY, buttonSizeY).setFont(font);
     cp5.addButton("inst3").setPosition(130, 190).setSize(buttonSizeY, buttonSizeY).setFont(font);
     cp5.addButton("inst4").setPosition(190, 190).setSize(buttonSizeY, buttonSizeY).setFont(font);   
     cp5.addButton("inst5").setPosition(250, 190).setSize(buttonSizeY, buttonSizeY).setFont(font);
     cp5.addButton("inst6").setPosition(310, 190).setSize(buttonSizeY, buttonSizeY).setFont(font);
     cp5.addButton("inst7").setPosition(10, 250).setSize(buttonSizeY, buttonSizeY).setFont(font);
     cp5.addButton("inst8").setPosition(70, 250).setSize(buttonSizeY, buttonSizeY).setFont(font);
     cp5.addButton("inst9").setPosition(130, 250).setSize(buttonSizeY, buttonSizeY).setFont(font);
     cp5.addButton("insta").setPosition(190, 250).setSize(buttonSizeY, buttonSizeY).setFont(font);
     cp5.addButton("instb").setPosition(250, 250).setSize(buttonSizeY, buttonSizeY).setFont(font);
     cp5.addButton("instc").setPosition(310, 250).setSize(buttonSizeY, buttonSizeY).setFont(font);  

     cp5.addSlider("tempo").setPosition(10, 350).setSize(30, 150).setRange(0, 127).setValue(50).setColorBackground(color(0, 0, 255))
     .setColorForeground(color(0, 255, 0)).setColorValue(color(255, 255, 255)).setColorActive(color(255, 0, 0));
     cp5.addSlider("shuffle").setPosition(60, 350).setSize(30, 150).setRange(0, 127).setValue(0).setColorBackground(color(0, 0, 255))
     .setColorForeground(color(0, 255, 0)).setColorValue(color(255, 255, 255)).setColorActive(color(255, 0, 0));     
     cp5.addSlider("cutoff").setPosition(110, 350).setSize(30, 150).setRange(0, 127).setValue(127).setColorBackground(color(0, 0, 255))
     .setColorForeground(color(0, 255, 0)).setColorValue(color(255, 255, 255)).setColorActive(color(255, 0, 0));
     cp5.addSlider("reso").setPosition(160, 350).setSize(30, 150).setRange(0, 127).setValue(50).setColorBackground(color(0, 0, 255))
     .setColorForeground(color(0, 255, 0)).setColorValue(color(255, 255, 255)).setColorActive(color(255, 0, 0));     
     cp5.addSlider("crusher").setPosition(210, 350).setSize(30, 150).setRange(0, 127).setValue(0).setColorBackground(color(0, 0, 255))
     .setColorForeground(color(0, 255, 0)).setColorValue(color(255, 255, 255)).setColorActive(color(255, 0, 0));
     cp5.addSlider("pitch").setPosition(260, 350).setSize(30, 150).setRange(0, 127).setValue(0).setColorBackground(color(0, 0, 255))
     .setColorForeground(color(0, 255, 0)).setColorValue(color(255, 255, 255)).setColorActive(color(255, 0, 0));     

}

void draw() {
   background(100); // background color of window (r, g, b)
//  textFont(font);
//  text("SFL CONTROL", 300, 30);
  if(serialIn){
    fill(255,0,0);
    rect(390, 230, 30, 30);
  }else{
    fill(50);
    rect(390, 230, 30, 30);  
  }
}
void tempo(int tempo){port.write(0xb0);port.write(0x0f);port.write(tempo);}
void shuffle(int shuffle){port.write(0xb1);port.write(0x0f);port.write(shuffle);}
void cutoff(int cutoff){port.write(0xb0);port.write(0x07);port.write(cutoff);}
void reso(int reso){port.write(0xb1);port.write(0x07);port.write(reso);}
void crusher(int crusher){port.write(0xb2);port.write(0x07);port.write(crusher);}
void pitch(int pitch){port.write(0xb4);port.write(0x07);port.write(pitch);}
void Play(){port.write(0xb0);port.write(0x02);port.write(0x01);}
void Stop(){port.write(0xb0);port.write(0x01);port.write(0x01);}
void Clk_On_Off(){port.write(0xb0);port.write(0x50);port.write(0x01);}
void Clear_all(){port.write(0xb1);port.write(0x50);port.write(0x01);}
void back(){port.write(0xb8);port.write(0x52);port.write(0x01);}
void rec(){port.write(0xba);port.write(0x52);port.write(0x01);}
void max1(){port.write(0xb4);port.write(0x50);port.write(0x01);}
void max2(){port.write(0xb5);port.write(0x50);port.write(0x01);}
void max3(){port.write(0xb6);port.write(0x50);port.write(0x01);}
void max4(){port.write(0xb7);port.write(0x50);port.write(0x01);}
void max5(){port.write(0xb0);port.write(0x53);port.write(0x01);}
void inst1(){port.write(0x90);port.write(0x30);port.write(0x7f);}
void inst2(){port.write(0x90);port.write(0x31);port.write(0x7f);}  
void inst3(){port.write(0x90);port.write(0x32);port.write(0x7f);}
void inst4(){port.write(0x90);port.write(0x33);port.write(0x7f);}
void inst5(){port.write(0x90);port.write(0x34);port.write(0x7f);}
void inst6(){port.write(0x90);port.write(0x35);port.write(0x7f);}  
void inst7(){port.write(0x90);port.write(0x36);port.write(0x7f);}
void inst8(){port.write(0x90);port.write(0x37);port.write(0x7f);}      
void inst9(){port.write(0x90);port.write(0x38);port.write(0x7f);}
void insta(){port.write(0x90);port.write(0x39);port.write(0x7f);}  
void instb(){port.write(0x90);port.write(0x3a);port.write(0x7f);}
void instc(){port.write(0x90);port.write(0x3b);port.write(0x7f);
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
