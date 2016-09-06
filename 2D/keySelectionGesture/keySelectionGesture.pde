import de.voidplus.leapmotion.*;

LeapMotion leap;

Environment env;
Gesture gesture;

DataPrinter dataPrinter;

void setup() {
  size(800, 500, OPENGL);
  leap = new LeapMotion(this);
  env = new Environment();
  gesture = new Gesture();
  dataPrinter = new DataPrinter("data.txt");
}

void draw() {
  background(255);
  env.update(dataPrinter);
  
  for (Hand hand : leap.getHands()) {
    hand.draw();
    
    gesture.checkCircleGesture(hand, env.circle);
  }
}


void keyPressed() {
  if (keyCode == ENTER) {
    env.reset();
  } 
}

public void exit() {
  println("Exit");
  dataPrinter.saveData();
  super.exit();
}