class Heap {
  int minItems;            // size of top row
  int maxItems;            // size of bottom row
  int table[];             // current number of items in each row
  int numRows;             // number of rows
  Item item;               // items the rows are filled with
  Item[][] itemMatrix      // the items in each row

  /* constructs a default 3/5 heap */
  Heap(){
    this.minItems = 3;
    this.maxItems = 5;
    table[] = new table[3];
  }

  /* constructs a heap with specified min/max row sizes */
  Heap(int minItems, int maxItems) {
    if (maxItems <= minItems) {
      throw new IllegalArgumentException("Invalid row sizes: HEAP()");
    }
    if (maxItems - minItems > 5) {
      throw new IllegalArgumentException("Number of rows cannot exceed 6");
    }
    this.minItems = minItems;
    this.maxItems = maxItems;
    this.numRows = maxItems - minItems + 1;
    table[] = new table[numRows];
    int iconLen = 100;

    if (iconLen*1.5*maxItems > 1200) {
      iconLen = 800/maxItems;
    }
    item = new item(
  }

  void drawRows() {
    int bufferDist = iconLen / 8;   // buffer distance on either side of item

    for (int i = numRows - 1; i >= 0; --i) {
      if (table[i] % 2 == 1) {
        item.draw(
}
