  
import processing.net.*;
import controlP5.*;

ControlP5 cp5;

Server myServer;
int val = 0;
int[] theColor={255, 255, 0};
final int WHITE = 0;
final int RED = 1;
final int YELLOW = 2;

void setup() {
  size(600, 800);
  
  cp5 = new ControlP5(this);
  cp5.addTextfield("text").setPosition(10,10).setSize(100,50).setAutoClear(false);
  cp5.addBang("Submit").setPosition(110,10).setSize(100, 50);
    
  cp5.addButton("White")
    .setValue(WHITE)
    .setColorLabel(color(255,255,255))
    .setPosition(500, 15)
        .updateSize();

  cp5.addButton("Yellow")
    .setValue(YELLOW)
    .setColorLabel(color(242,186,73))
    .setPosition(500, 35)
        .updateSize();

  cp5.addButton("Red")
    .setValue(RED)
    .setPosition(500, 55)
    .setColorLabel(color(220,20,60))
    .updateSize();


  // Starts a myServer on port 5204
  myServer = new Server(this, 5204); 
}

void Submit() {
  
  String text = cp5.get(Textfield.class, "text").getText();
  println(text);
  myServer.write("t:"+text);

}

public void controlEvent(ControlEvent theEvent) {
  
  Button theButton=null;
  if (theEvent.getController() instanceof Button) theButton = (Button)theEvent.getController();
  int v = int(theEvent.getValue());
  
  if (theButton!=null && theButton.isOn()) {
      if (v == RED ) {
        println ("RED");
        myServer.write("c:220,20,60");
        theColor[0]=220;
        theColor[1]=20;
        theColor[2]=60;

      }
      else if (v == YELLOW) {
          println("YELLOW");
          theColor[0]=242;
          theColor[1]=186;
          theColor[2]=73;
         myServer.write("c:242,186,73");
      }
      else {
          theColor[0]=255;
          theColor[1]=255;
          theColor[2]=255;
          myServer.write("c:255,255,255");
          println("WHITE!!");

      }
  }
}


void draw() {
  strokeWeight(1);
  stroke(255);
  line(0,200, 600, 200);

  String message="";
   if(mousePressed)
   {
          //Enviem una cadena de caracters amb el seguent format "xposicioX posicioY"
          //Comen�a amb el caracter X
          message  = "x"+mouseX+" "+mouseY;
      if (mouseY>200 && mouseX>0) {
        strokeWeight(20);
        stroke(theColor[0], theColor[1], theColor[2]); 
        point(mouseX, mouseY);
       
        myServer.write(message);
      }
   }
   
   Client thisClient = myServer.available();
  // If the client is not null, and says something, display what it said
  if (thisClient !=null) {
    String whatClientSaid = thisClient.readString();
    if (whatClientSaid != null) {
      println(thisClient.ip() + "\t" + whatClientSaid);
      int posicionEspacio = whatClientSaid.indexOf(" ");
      float miX = float(whatClientSaid.substring(1,posicionEspacio));
      float miY = float(whatClientSaid.substring(posicionEspacio));    
    
      println("miX "+miX);
      println("miy "+miY);
      
    
      strokeWeight(20);
      stroke(0, 0, 0); 
      point(miX, miY+200);
    
    } 
  } 
}
