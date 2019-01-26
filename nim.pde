int x = 0;
Item i;

void setup() {
  i = new Item();
  size(1024, 768);
  background(0);
  noStroke();
  fill(102);
}

void draw() {
  i.draw();
  x += 1;
}
