class Binary {
  int bitStrLen;
  int nimSum;
  int[] table;
  int numRows;
  int minItems;

  Binary(Game g) {
    minItems = g.minItems;
    table = g.table;
    numRows = g.numRows;
    nimSum = getNimSum();
  }

  int getNimSum() {
    int acc = table[0];
    for (int i=1; i<numRows; ++i) {
      acc = acc ^ table[i];
    }
    return acc;
  }

  int[] normalMove() {
    int[] xorTable = new int[numRows];
    int[] retTable = new int[2];

    /* fill XOR table */
    for (int i=0; i<numRows; ++i) {
      xorTable[i] = nimSum ^ table[i];
    }

    int correctRow = -1;
    for (int i=0; i<numRows; ++i) {
      if (xorTable[i] < nimSum) {
        correctRow = i;
        break;
      }
    }
    if (correctRow == -1) {
      retTable[0] = 0;
      for (int i=0; i<numRows; ++i) {
        if (table[i] != 0) {
          retTable[0] = i;
          break;
        }
      }
      retTable[1] = 1;
    } else {
      retTable[0] = correctRow;
      retTable[1] = nimSum - xorTable[correctRow];
    }

    return retTable;
  }
}

