class Item {
  PShape icon;
  int xPos;
  int yPos;
  int xLen;
  int yLen;
  
  // Create new icon with specified svg file
  Item(String filename, int xPos, int yPos, int xLen, int yLen) {
    icon = loadShape(filename);
    this.xPos = xPos;
    this.yPos = yPos;
    this.xLen = xLen;
    this.yLen = yLen;
  }
  
  // Use default svg file
  Item(int xPos, int yPos, int xLen, int yLen) {
    icon = loadShape("/media/test.svg");
    this.xPos = xPos;
    this.yPos = yPos;
    this.xLen = xLen;
    this.yLen = yLen;
  }
  
  // Construct item with all default values
  Item() {
    icon = loadShape("/media/test.svg");
    this.xPos = 100;
    this.yPos = 100;
    this.xLen = 100;
    this.yLen = 100;
  }
  
  void draw() {
    shape(icon, xPos, yPos, xLen, yLen);
  }
}
