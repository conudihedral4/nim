class Game {
  int minItems;            // size of top row
  int maxItems;            // size of bottom row
  int[] table;             // current number of items in each row
  int numRows;             // number of rows
  int iconDim;             // side-length of a single (square) icon
  Item[][] itemMatrix;     // the items in each row

  /* constructs a default 3/5 heap */
  Game() {
    this.minItems = 3;
    this.maxItems = 5;
    this.numRows = 3;
    table = new int[3];
    this.iconDim = 100;
    itemMatrix = createMatrix();
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
    itemMatrix = createMatrix();
  }

  /* create and fill matrix with items at correct places */
  Item[][] createMatrix() {
    int bufferDist = iconDim / 8;   // buffer distance on either side of item
    Item[][] matrix = new Item[numRows][maxItems];

    int y = 800-bufferDist;                    // start at bottom of screen
    /* loop through every row */
    for (int i=numRows-1; i>=0; --i) {
      int numItems = minItems + i;
      int x = (1200 - (numItems*(iconDim + 2*bufferDist))) / 2;
      /* loop through number of items in row */
      for (int j=0; j<numItems; ++j) {
        /* create new item with unique coordinates */
        matrix[i][j] = new Item(iconDim, iconDim, x++, y);
      }
      y -= iconDim + 2*bufferDist;
    }
    return matrix;
  }

  /* print item matrix to screen */
  void display() {
    for (int i=0; i<numRows; ++i) {
      int numItems = minItems + i;
      for (int j=0; j<numItems; ++j) {
        itemMatrix[i][j].display();
      }
    }
  }

}
