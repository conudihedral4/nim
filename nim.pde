int x = 0;
Game g;

void setup() {
  g = new Game(3,8);
  size(1200, 900);
  background(0);
  noStroke();
  fill(102);
  noLoop();        // game does not automatically loop
}

void draw() {
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
