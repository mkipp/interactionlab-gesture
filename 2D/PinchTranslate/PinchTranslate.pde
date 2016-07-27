import de.voidplus.leapmotion.*;

LeapMotion leap;

Environment env;
Pinch pinch = new Pinch();

DataPrinter dataPrinter;

void setup() {
  size(800, 500, OPENGL);
  leap = new LeapMotion(this);
  env = new Environment();
  dataPrinter = new DataPrinter("data.txt");  
}

void draw() {
  background(255);
  env.update(dataPrinter);
  
  for (Hand hand : leap.getHands()) {
    hand.draw();
    
    pinch.checkCircleGesture(hand, env.circle);
  }
}

void keyPressed() {
  if (key == ' ') {
    env.reset();
  }
}

public void exit() {
  println("Exit");
  dataPrinter.saveData();
  super.exit();
}