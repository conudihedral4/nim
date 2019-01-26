class Item {
  PImage icon;     // image object
  int x;           // x-coordinate
  int y;           // y-coordinate
  int width;       // display width
  int height;      // display height
  boolean clicked; // has item been clicked?

  /* Create new icon with specified png file */
  Item(String filename, int x, int y, int width, int height) {
    icon = loadImage(filename);
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.clicked = false;
  }

  /* Use default png file */
  Item(int x, int y, int width, int height) {
    icon = loadImage("donut_full.png");
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.clicked = false;
  }

  /* Construct item with all default values */
  Item() {
    icon = loadImage("donut_full.png");
    this.x = 100;
    this.y = 100;
    this.width = 100;
    this.height = 100;
    this.clicked = false;
  }

  void display() {
    image(icon, x, y, width, height);
  }
}
