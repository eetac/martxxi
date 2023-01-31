  
import processing.net.*;
import controlP5.*;

ControlP5 cp5;

Server myServer;
int val = 0;

void setup() {
  size(600, 800);
  
  cp5 = new ControlP5(this);
  cp5.addTextfield("text").setPosition(10,10).setSize(100,50).setAutoClear(false);
  cp5.addBang("Submit").setPosition(110,10).setSize(100, 50);
  
  // Starts a myServer on port 5204
  myServer = new Server(this, 5204); 
}

void Submit() {
  
  String text = cp5.get(Textfield.class, "text").getText();
  println(text);
  myServer.write("t:"+text);

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
 }
  if (mouseY>200 && mouseX>0) myServer.write(message);
}
