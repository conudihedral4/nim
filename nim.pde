int x = 0;
Game g;

void setup() {
  g = new Game();
  size(1200, 900);
  background(0);
  noStroke();
  fill(102);
}

void draw() {
  g.itemMatrix[0][0].display();
}
