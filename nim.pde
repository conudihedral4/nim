int x = 0;
Item i = new Item();

void setup() {
  size(1024, 768);
  background(0);
  noStroke();
  fill(102);
}

void draw() {
  i.draw();
  x += 1;
}
