class Robot {
  int MAX_LENGTH;

  // empty constructor
  Robot() {
    MAX_LENGTH = 5;
  }

  int[] misereMove(Game game) {
    int[] move = new int[2];
    int size = game.table.length;
    int[] input = new int[size];
    for (int i=0; i<size; i++) {
      //copy the game table to avoid modify it directly
      input[i] = game.table[i];
    }
    int[][] binGame = new int[input.length][];
    //a 2D array with first row number, second binary digits
    for (int l =0; l<input.length; l++) {
      //for all the rows
      binGame[l] = binaryArray(input[l]);
    }

    int[] binSum = new int[MAX_LENGTH];
    for (int m = 0; m< MAX_LENGTH; m++) {
      // that gives me the binary sum array
      binSum[m] = binarySum(m, binGame);
    }

    if (checkZero(binSum)) {

      //find row
      int row = findRow(binGame, binSum);
      move[0] = row;

      //find number
      int number = findNumber(binGame[row], binSum);
      move[1] = number;
    } else {
    }


    return move;
  }
///////////////Beginning of normal mode///////////
  int[] normalMove(Game game) {

    int[] move = new int[2];
    //will always be array of 2 int
    //format: [row to remove from, #elements to remove]
    int size = game.table.length;
    int[] input = new int[size];
    //will work from heap, not game.table directly

    for (int i=0; i<size; i++) {
      //copy the game table to avoid modify it directly
      input[i] = game.table[i];
    }
    int[][] binGame = new int[input.length][];
    //a 2D array with first row number, second binary digits
    for (int l =0; l<input.length; l++) {
      //for all the rows
      binGame[l] = binaryArray(input[l]);
    }

    int[] binSum = new int[MAX_LENGTH];
    for (int m = 0; m< MAX_LENGTH; m++) {
      // that gives me the binary sum array
      binSum[m] = binarySum(m, binGame);
    }
    if (!checkZero(binSum)) {

      //find row
      int row = findRow(binGame, binSum);
      move[0] = row;

      //find number
      int number = findNumber(binGame[row], binSum);
      move[1] = number;
    } 
    else {//random (If the nim-sum is equal to 0000)
      move[1] = 1; //The default move always remove one 
      for (int i=0; i<input.length; i++) {
        if(input[i] != 0){ 
          move[0] = input[i];
          break;
        }
      }
    }
        //In normal play, the winning strategy is to finish every move with a nim-sum of 0
        return move;
  }
///////////helper methods////////////
    boolean checkZero(int[] sum) {
      for (int i=0; i<MAX_LENGTH; i++) {
        if (sum[i] == 1) return false;
      }
      return true;
    }

    int findNumber(int[] heap, int[] nimSum) {
      int[] nSum = findNimSum(heap, nimSum);
      int niSum = toInt(nSum);
      return ((toInt(heap))-niSum);
    }

    int[] findNimSum(int[] X, int[] Y) {
      int[] Z = new int[MAX_LENGTH];
      for (int k=0; k< MAX_LENGTH; k++) {
        Z[k] = (X[k] + Y[k])%2;
      }
      return Z;
    }

    int findRow(int[][] rows, int[] binSum) {

      for (int k=0; k< rows.length; k++) {
        //for every heap k
        int[] sumK = new int[MAX_LENGTH];
        //sumK is the binary sum of heapK and binSum

        for (int i=0; i<MAX_LENGTH; i++) {
          //filling in the array for the sum for heapK+binSum
          sumK[i] = (rows[k][i]+binSum[i])%2;
        }

        //binary to integer
        int intSumK = toInt(sumK);
        int intBinSum = toInt(binSum);
        if (intSumK<intBinSum) return k;
      }
      return 0; //dummy variable
    }

    int toInt(int[] binary) {
      int integer = 0;
      for (int i=0; i<MAX_LENGTH; i++) {
        integer += (int)(binary[i]*Math.pow(2, (3-i)));
      }
      return integer;
    }

    int binarySum (int m, int[][] rows) {
      //this method returns either 0 or 1 for each sum
      int sum = 0;

      for (int i=0; i<rows.length; i++) {
        sum += rows[i][m];
      }
      return (sum%2);
    }

    int sum(int s, int[][] game) {
      return 0;
    }


    int[] binaryArray(int k) {
      //returns an array of size 4 with the binary positions 
      String binK = Integer.toBinaryString(k);
      int[] binArray = new int[MAX_LENGTH];
      //will always have size 4 since the largest number a row can have is 8

      //if the string is shorter than 4, I need all the first digits to be 0
      if (binK.length() < MAX_LENGTH) {
        int binLength = binK.length();
        for (int c = 0; c<(MAX_LENGTH-binLength); c++) {
          binArray[c] = 0;
        }
        //then enter the digits of the string
        int d = 0;
        for (int j = MAX_LENGTH-binLength; j<MAX_LENGTH; j++) {
          binArray[j] = Integer.parseInt(""+binK.charAt(d));
          d++;
        }
      }
      //put the digits in if there are 4 digits
      else {
        for (int i=0; i<binK.length(); i++) {
          binArray[i] = Integer.parseInt(""+binK.charAt(i));
        }
      }
      println(binArray);  //for debugging!!!!
      return binArray;
    }
  }
