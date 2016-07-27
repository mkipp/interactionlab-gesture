class Environment {
  Circle circle;
  TargetArea targetArea;
  GUI gui;
  
  float xCircleInitial = width / 4.0;
  float yCircleInitial = height / 2.0;
  int diaCircleInitial = 100;
  float xAreaInitial = 2.5 * width / 4.0;
  float widthAreaInitial = width / 6.0;

  Environment() {
    circle = new Circle(xCircleInitial, yCircleInitial, diaCircleInitial);
    targetArea = new TargetArea(xAreaInitial, widthAreaInitial);
    gui = new GUI();
  }

  void update(DataPrinter dataPrinter) {
    targetArea.render();
    circle.render();
    gui.update();
    
    checkCircleIsInsideTargetArea();
    
    if (circle.placedAgain) {
      gui.stopTime(targetArea.objectIsInside, dataPrinter);
    }
  }
  
  void reset() {
    circle.x = xCircleInitial;
    circle.y = yCircleInitial;
    circle.diameter = diaCircleInitial;
    circle.placedAgain = false;
    targetArea.x = xAreaInitial;
    targetArea.widthSize = widthAreaInitial;
    
    gui.reset();
  }

  void checkCircleIsInsideTargetArea() {
    if (circle.x >= targetArea.x 
      && circle.x <= targetArea.x + targetArea.widthSize) {
      targetArea.objectIsInside = true;
    } else {
      targetArea.objectIsInside = false;
    }
  }
}