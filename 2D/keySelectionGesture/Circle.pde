class Circle {
  float x;
  float y;
  int diameter;
  boolean isSelected = false;
  boolean isWithinReach = false;

  boolean placedAgain = false;

  Circle (float x, float y, int diameter) {
    this.x = x;
    this.y = y;
    this.diameter = diameter;
  }

  void render() {

    if (isWithinReach) {
      fill(255, 255, 0);
    } else if (isSelected) {
      fill(255, 0, 0);
    } else {
      fill(0);
    }

    noStroke();
    ellipse(x, y, diameter, diameter);
  }
}