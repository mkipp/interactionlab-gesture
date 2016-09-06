class Gesture {
  boolean selectObject;

  Gesture() {
    selectObject = false;
  }

  void checkCircleGesture(Hand hand, Circle circle) {
    PVector selectionPos = getCentroidOfTriangle(hand.getIndexFinger().getPosition(), 
      hand.getThumb().getPosition(), hand.getMiddleFinger().getPosition());
      
    fill(0, 255, 255);
    ellipse(selectionPos.x, selectionPos.y, 10, 10);

    boolean circleIsWithinReach = dist(circle.x, circle.y, selectionPos.x, selectionPos.y) < circle.diameter / 2.0;

    if (keyPressed && key != ENTER) {
      selectObject = true;
    } else {
      selectObject = false;
    }

    if (circle.isSelected && selectObject) {
      //circle.isSelected = true;

      if (selectionPos.x + circle.diameter / 2.0 < width
        && selectionPos.x - circle.diameter / 2.0 > 0) {
        circle.x = selectionPos.x;
      }

      if (selectionPos.y + circle.diameter / 2.0 < height
        && selectionPos.y - circle.diameter / 2.0 > 0) {
        circle.y = selectionPos.y;
      }
      
    } else if (circle.isSelected && !selectObject) {
      circle.isSelected = false;
      circle.placedAgain = true;
    }

    if (circleIsWithinReach && selectObject) {
      circle.isSelected = true;
      circle.isWithinReach = false;
    } else if (circleIsWithinReach) {
      circle.isSelected = false;
      circle.isWithinReach = true;
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
