class Game {
  int minItems;            // size of top row
  int maxItems;            // size of bottom row
  int[] table;             // current number of items in each row
  int numRows;             // number of rows
  int iconDim;             // side-length of a single (square) icon
  Item[][] itemMatrix;     // the items in each row

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

    /* initialize table that counts items in each row */
    table = new int[numRows];
    for (int i=0; i<numRows; ++i) {
      table[i] = i+minItems;
    }

    /* determine size of icons */
    this.iconDim = 100;
    if (maxItems > 8) {
      this.iconDim = 960/maxItems;
    }

    /* fill matrix */
    itemMatrix = createMatrix();
  }

  /* create and fill matrix with items at correct places */
  Item[][] createMatrix() {
    /* buffer distance on either side of item */
    int bufferDist = iconDim / 8;
    Item[][] matrix = new Item[numRows][maxItems];

    /* start at bottom of screen */
    int y = 800 - (iconDim + bufferDist);

    /* loop through every row */
    for (int i=numRows-1; i>=0; --i) {
      int numItems = minItems + i;
      int x = (1200 - ((numItems*(iconDim + 2*bufferDist)))) / 2;
      /* loop through number of items in row */
      for (int j=0; j<numItems; ++j) {
        /* create new item with unique coordinates */
        matrix[i][j] = new Item(x + bufferDist, y, iconDim, iconDim);
        x += iconDim + 2*bufferDist;
      }
      y -= iconDim + bufferDist;
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
