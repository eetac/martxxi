import controlP5.*;

int theNumber;

ControlP5 cp5;
Textlabel myTextlabel;
Textlabel myTextLabelGreaterThan;
Textlabel myTextLabelLessThan;
Textlabel myTextLabelEqualsThan;

void setup()
{
  size(800,800);
  background(0);
  
  theNumber = (int)random(50);
  println("theNumber: "+theNumber);

  cp5 = new ControlP5(this);
  
  myTextlabel = cp5.addTextlabel("label1")
                    .setText("Quin número que creus que tinc amagat?")
                    .setPosition(90,10)
                    .setColorValue(0xffffff00)
                    .setFont(createFont("Georgia",20));
                    
  myTextLabelGreaterThan = cp5.addTextlabel("label2")
                    .setText("És MÉS GRAN!!!!!!!")
                    .setPosition(500,750)
                    .setColorValue(0xffffff00)
                    .setFont(createFont("Georgia",20))
                    .setVisible(false);
               

  myTextLabelEqualsThan = cp5.addTextlabel("label3")
                    .setText("HAS ENCERTAT!!!!")
                    .setPosition(300,750)
                    .setColorValue(0xffffff00)
                    .setFont(createFont("Georgia",20))
                    .setVisible(false);;
                 
                    
  myTextLabelLessThan = cp5.addTextlabel("label4")
                    .setText("És MÉS PETIT!!!")
                    .setPosition(90,750)
                    .setColorValue(0xffffff00)
                    .setFont(createFont("Georgia",20))
                    .setVisible(false);


  int posX = 100;
  int posY = 50;
  
  /*
  
  for (int i = 0; i<50; i++) {
    
    if (i % 10==0) {
       posX = 100;
       posY = posY+100;
    }
    
    cp5.addButton(""+i)
     .setCaptionLabel(""+i) 
     .setValue(i)
     .setPosition(posX, posY)
     .setOff()
     .updateSize();
     
     posX = posX + 50;
  }
*/
  
      cp5.addButton("start")
     .setCaptionLabel("start") 
     .setValue(500)
     .setPosition(700, 77)
     .setOff()
     .updateSize();

  //noLoop();

}

void draw()
{
} 
  
public void controlEvent(ControlEvent theEvent) {
  
  Button theButton = (Button)theEvent.getController();
  
  int v = int(theButton.getValue());
  
  if (theButton.isOn()) {
      
      if (v == 500) {
        theNumber = (int)random(50);
        println("***********START, nou VALOR: "+theNumber); 
      }
      else if (theNumber == v  ) {
         println("HAS ENCERTAT!!!");
         myTextLabelGreaterThan.setColorValue(0);
         myTextLabelLessThan.setColorValue(0);
         myTextLabelEqualsThan.setVisible(true);
         myTextLabelEqualsThan.setColorValue(color(220,20,60));
         myTextLabelEqualsThan.setColorBackground(0);
      }
      else if (theNumber > v) {
         myTextLabelLessThan.setColorValue(0);
         myTextLabelEqualsThan.setColorValue(0);
         myTextLabelGreaterThan.setVisible(true);
         myTextLabelGreaterThan.setColorValue(0xffffff00);
         myTextLabelGreaterThan.setColorBackground(0);
    
         println("ES MES GRAN!!!!");
         println("theNumber: "+theNumber);
         println("v: "+v);
      }
      else {
        myTextLabelGreaterThan.setColorValue(0);
        myTextLabelEqualsThan.setColorValue(0);
        myTextLabelLessThan.setVisible(true);
        myTextLabelLessThan.setColorValue(0xffffff00);
        myTextLabelLessThan.setColorBackground(0);
        println("ES MES PETIT!!!!");
        println("theNumber: "+theNumber);
        println("v: "+v);
      }
        
  }
   
}


 
