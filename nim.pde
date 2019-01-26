int x = 0;
Item i;

void setup() {
  i = new Item();
  size(1200, 900);
  background(0);
  noStroke();
  fill(102);
}

void draw() {
  i.display();
  x += 1;
}
