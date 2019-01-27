class Game {
  int minItems;            // size of top row
  int maxItems;            // size of bottom row
  int[] table;             // current number of items in each row
  int numRows;             // number of rows
  int iconDim;             // side-length of a single (square) icon
  Item[][] itemMatrix;     // the items in each row
  RobotMisere ran;

  /* constructs a heap with specified min/max row sizes */
  Game(int minItems, int maxItems) {
    ran = new RobotMisere();

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
    this.iconDim = 50;
    if (maxItems > 8) {
      this.iconDim = 480/maxItems;
    }

    /* fill matrix */
    itemMatrix = createMatrix();
  }

  /* the computer plays a turn */
  void cpuNormalMove() {
    String mode = misere ? "misere" : "normal";
    int[] move = ran.nextMove(this.table, mode);
    println("sdfsdfsd: "+move[0]+" "+move[1]);
    int left = move[1];
    int correctRow = move[0];
    for (int i=0; i<minItems+correctRow; ++i) {
      if (!itemMatrix[correctRow][i].clicked) {
        itemMatrix[correctRow][i].clicked = true;
        --left;
      }
      if (left == 0) {
        break;
      }
    }
    table[correctRow] -= move[1];
    boolean won = true;
    for (int i=0; i<numRows; ++i) {
      if (table[i] != 0) {
        won = false;
        break;
      }
    }
    if (won) {
      winLose = misere ? 1 : -1;
    }
  }

  /* create and fill matrix with items at correct places */
  Item[][] createMatrix() {
    /* buffer distance on either side of item */
    int bufferDist = iconDim / 8;
    Item[][] matrix = new Item[numRows][maxItems];

    /* start at bottom of screen */
    int y = 400 - (iconDim + bufferDist);

    /* loop through every row */
    for (int i=numRows-1; i>=0; --i) {
      int numItems = minItems + i;
      int x = (600 - ((numItems*(iconDim + 2*bufferDist)))) / 2;
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
