import de.voidplus.leapmotion.*;

LeapMotion leap;  

boolean showHands = false;

void setup() {
  size(800, 500, OPENGL);
  leap = new LeapMotion(this);
}

void draw() {
  background(255);
  fill(0);
  text("Press any key to show/hide hand/s", 20,20);
  for (Hand hand : leap.getHands ()) {
    PVector indexTip = hand.getIndexFinger().getPositionOfJointTip();
    noStroke();
    fill(255, 0, 0, 150);
    ellipse(indexTip.x, indexTip.y, 20, 20);

    if (showHands) {
      hand.draw();
    }
  }
}

void keyPressed() {
  showHands = !showHands;
}