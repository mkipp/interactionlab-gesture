class GUI {
  int initialTime;
  float interval;
  boolean updateTime;
  String currentTime;

  int xpos;
  int ypos;

  GUI() {
    initialTime = millis();
    interval = 1000;
    updateTime = false;
    currentTime = "0";

    xpos = 30;
    ypos = 30;
  }

  void update() {
    if (updateTime) {
      currentTime = nf( (millis() - initialTime) / interval, 1, 1);
    } else {
      textSize(20);
      textAlign(CENTER, CENTER);
      fill(0);
      text("Press Enter", width/2, 50);
    }

    textSize(10);
    fill(0);
    text(currentTime, xpos, ypos);
  }

  void stopTime(boolean circleInsideTarget, DataPrinter dataPrinter) {
    if (updateTime) {
      updateTime = false;
      println(currentTime + " " + circleInsideTarget);
      dataPrinter.printData(currentTime + " " + (circleInsideTarget ? "Inside" : "Not Inside"));
    }
  }

  void reset() {
    updateTime = true;
    initialTime = millis();
  }
}