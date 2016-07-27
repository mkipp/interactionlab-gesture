class TargetArea {
  float x;
  float widthSize;
  
  boolean objectIsInside = false;
  
  TargetArea(float x, float widthSize) {
    this.x = x;
    this.widthSize = widthSize;
  }
  
  void render() {
    if (objectIsInside) {
      fill(0, 255, 0);
    } else {
      fill(100);
    }
    
    rectMode(CORNER);
    rect(x, 0, widthSize, height);
  }
}