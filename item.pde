class Item {
  PImage icon;
  int xPos;
  int yPos;
  int xLen;
  int yLen;
  
  // Create new icon with specified svg file
  Item(String filename, int xPos, int yPos, int xLen, int yLen) {
    icon = loadImage(filename);
    this.xPos = xPos;
    this.yPos = yPos;
    this.xLen = xLen;
    this.yLen = yLen;
  }
  
  // Use default png file
  Item(int xPos, int yPos, int xLen, int yLen) {
    icon = loadImage("test.png");
    this.xPos = xPos;
    this.yPos = yPos;
    this.xLen = xLen;
    this.yLen = yLen;
  }
  
  // Construct item with all default values
  Item() {
    icon = loadImage("test.png");
    this.xPos = 100;
    this.yPos = 100;
    this.xLen = 100;
    this.yLen = 100;
  }
  
  void draw() {
    image(icon, xPos, yPos, xLen, yLen);
  }
}
