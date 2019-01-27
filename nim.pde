Game g;

void setup() {
  g = new Game(3,8);
  size(1200, 900);
  background(0);
  noStroke();
  fill(102);
  frameRate(2);
  noLoop();  // game does not automatically loop
}

void mousePressed() {
  for (int i=0; i<g.numRows; ++i) {
    int numItems = g.minItems + i;
    for (int j=0; j<numItems; ++j) {
      Item currItem = g.itemMatrix[i][j];
      if ((mouseX >= currItem.x) && (mouseX < currItem.x + currItem.width) &&
          (mouseY >= currItem.y) && (mouseY < currItem.y + currItem.height)) {
        currItem.animate();
      }
    }
  }
}

void draw() {
  background(0);
  println("Redraw: " + hour() + ":" + minute() + ":" + second());
  for (int i=0; i<12; ++i) {
    (new Item(i*100,800,100,100)).display();
  }
  g.display();
  line(600,0,600,900);
  stroke(0,255,0);
  line(601,0,601,900);
  stroke(0,255,0);
  line(0,800,1200,800);
  stroke(0,255,0);
}
