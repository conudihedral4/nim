class Game {
  int minItems;            // size of top row
  int maxItems;            // size of bottom row
  int[] table;             // current number of items in each row
  int numRows;             // number of rows
  int iconDim;             // side-length of a single (square) icon
  Item[][] itemMatrix;      // the items in each row

  /* constructs a default 3/5 heap */
  Game() {
    this.minItems = 3;
    this.maxItems = 5;
    table = new int[3];
  }

  /* constructs a heap with specified min/max row sizes */
  Game(int minItems, int maxItems) {
    if (maxItems <= minItems) {
      throw new IllegalArgumentException("Invalid row sizes: HEAP()");
    }
    if (maxItems - minItems > 5) {
      throw new IllegalArgumentException("Number of rows cannot exceed 6");
    }
    this.minItems = minItems;
    this.maxItems = maxItems;
    this.numRows = maxItems - minItems + 1;
    table = new int[numRows];
    this.iconDim = 100;
    if (this.iconDim*1.5*maxItems > 1200) {
      this.iconDim = 800/maxItems;
    }
  }

  Item[][] createMatrix() {
    Item[][] matrix = new Item[numRows][maxItems];
    
    for (int i = numRows - 1; i >= 0; --i) {
      if (table[i] % 2 == 1) {
        matrix[i][0].display();
      }
    }
    return matrix;
  }

  void display() {
    int bufferDist = iconDim / 8;   // buffer distance on either side of item
  }

}
