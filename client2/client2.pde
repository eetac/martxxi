  
import processing.net.*; 

Client myClient; 
int dataIn; 
int theSize=20;

int offset=200;

PFont f; 

int xatY=100;
int[] theColor={255, 255, 0};
final int WHITE = 0;
final int RED = 1;
final int YELLOW = 2;
final int SIZE_INC = 3;
final int SIZE_DEC = 4;
 
void setup() { 
  size(800, 600); 
  fill(255,0,0);  
  f = createFont("Arial",16,true);
  background(0);
  // Connect to the local machine at port 5204.
  // This example will not run if you haven't
  // previously started a server on this port.
  myClient = new Client(this, "127.0.0.1", 5204); 
} 
 
void draw() { 
  strokeWeight(1);
  stroke(255);
  line(200,0, 200, 600);
  textFont(f,16); 

  if (myClient.available() > 0) { 
    String message = myClient.readString();
    if (message.indexOf("t:")==0) {
      text(message.substring(2),10,xatY);
      xatY=xatY+15;
    }
    else if (message.indexOf("c:")==0) {
      println("message: ["+message+"]");
      String sColor=message.substring(2);
      println("["+sColor+"]");
      String[] list = split(sColor, ',');

      theColor[0] = int(list[0]);
      theColor[1] = int(list[1]);
      theColor[2] = int(list[2]);
      
      //theColor =  int(message.substring(2));
    }
    else if (message.indexOf("s:")==0) {
        theSize=Integer.parseInt(message.substring(2));
    }
    else {
    int posicionEspacio = message.indexOf(" ");
    float miX = float(message.substring(1,posicionEspacio));
    float miY = float(message.substring(posicionEspacio));
    
    println("x"+miX);
    println("y"+miY);
    
    
    strokeWeight(theSize);
    stroke(theColor[0], theColor[1], theColor[2]);
    point(miX+offset, miY-offset);
    }    
  }

  String message="";
  if (mousePressed) {
      message  = "x"+mouseX+" "+mouseY;

      myClient.write(message);
      strokeWeight(theSize);
      stroke(255, 255, 255); 
      point(mouseX+200, mouseY);

  }
  
} 
