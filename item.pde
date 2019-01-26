class Item {
  PImage icon;     // image object
  int x;           // x-coordinate
  int y;           // y-coordinate
  int width;       // display width
  int height;      // display height
  boolean visible; // is item visible?

  /* Create new icon with specified png file */
  Item(String filename, int x, int y, int width, int height) {
    icon = loadImage(filename);
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.visible = true;
  }

  /* Use default png file */
  Item(int x, int y, int width, int height) {
    icon = loadImage("test.png");
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.visible = true;
  }

  /* Construct item with all default values */
  Item() {
    icon = loadImage("test.png");
    this.x = 100;
    this.y = 100;
    this.width = 100;
    this.height = 100;
    this.visible = true;
  }

  void draw() {
    image(icon, x, y, width, height);
  }
}
