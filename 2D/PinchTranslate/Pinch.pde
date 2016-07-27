class Pinch {
  PVector selectionPos;
  float gestureStrength;

  void checkCircleGesture(Hand hand, Circle circle) {
    //selectionPos = hand.getIndexFinger().getPosition();
    selectionPos = getCentroidOfTriangle(hand.getIndexFinger().getPosition(), 
    hand.getThumb().getPosition(), hand.getMiddleFinger().getPosition());
    gestureStrength = hand.getPinchStrength();
    
    fill(0, 255, 255);
    ellipse(selectionPos.x, selectionPos.y, 10,10);

    boolean circleIsWithinReach = dist(circle.x, circle.y, selectionPos.x, selectionPos.y) < circle.diameter / 2.0;

    if (circle.isSelected && gestureStrength > 0.8) {
      circle.isSelected = true;

      if (selectionPos.x + circle.diameter / 2.0 < width
        && selectionPos.x - circle.diameter / 2.0 > 0) {
        circle.x = selectionPos.x;
      }


      if (selectionPos.y + circle.diameter / 2.0 < height
        && selectionPos.y - circle.diameter / 2.0 > 0) {
        circle.y = selectionPos.y;
      }
    } else if (circle.isSelected && gestureStrength <= 0.8) {
      circle.isSelected = false;
      circle.placedAgain = true;
    } else if (circleIsWithinReach && gestureStrength > 0.8) {
      circle.isSelected = true;
      circle.isWithinReach = false;
    } else if (circleIsWithinReach && gestureStrength <= 0.8) {
      circle.isSelected = false;
      circle.isWithinReach = true;
    } else {
      circle.isSelected = false;
      circle.isWithinReach = false;
    }
  }
  
  PVector getCentroidOfTriangle(PVector a, PVector b, PVector c) {
    PVector centroid = new PVector();
    
    centroid.x = 1/3.0 * (a.x + b.x + c.x);
    centroid.y = 1/3.0 * (a.y + b.y + c.y);
    centroid.z = 1/3.0 * (a.z + b.z + c.z);
    
    return centroid;
    
  }
}