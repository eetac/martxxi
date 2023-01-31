  
import processing.net.*; 

Client myClient; 
int dataIn; 

int offset=200;

PFont f; 

int xatY=100;
 
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
    println(message);
    println(message.indexOf("t:"));
    if (message.indexOf("t:")==0) {
      text(message.substring(2),10,xatY);
      xatY=xatY+15;
    }
    else {
    int posicionEspacio = message.indexOf(" ");
    float miX = float(message.substring(1,posicionEspacio));
    float miY = float(message.substring(posicionEspacio));
    
    println("x"+miX);
    println("y"+miY);
    
    
    strokeWeight(20);
    stroke(255,255,0);
    point(miX+offset, miY-offset);
    }    
  } 
  
} 
