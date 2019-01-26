//for game of type normal: player that selects the last item wins
//robot will play optimal move to win 

class Robot{

  int[] optimalMove(Game game){
    
    int[] move = new int[2];
    //will always be array of 2 int
    //format: [row to remove from, #elements to remove]
    int size = game.table.length;
    int[] input = new int[size];
    //will work from heap, not game.table directly
    
    for(int i=0; i<size; i++){
      //copy the heap table to avoid modify it directly
      input[i] = game.table[i];
    }
    int[][] binGame = new int[input.length][];
    //a 2D array with first row number, second binary digits
    for (int l =0; l<input.length; l++){
      //for all the rows
     binGame[l] = binaryArray(input[l]);
    }
    
    int[] binSum = new int[4];
    for (int m = 0; m< 4; m++){
      // that gives me the binary sum array
    binSum[m] = binarySum(m, binGame);
    }
    
    //find row
    int row = findRow(binGame, binSum);
    move[0] = row;
    
    
    
 
    
    
    //In normal play, the winning strategy is to finish every move with a nim-sum of 0
    
    
    
    
    return move; 
  }
  
  int findRow(int[][] rows, int[] binSum){
    
   for (int k=0; k< rows.length; k++){
     //for every heap k
     int[] sumK = new int[4];
     //sumK is the binary sum of heapK and binSum
     
   for (int i=0; i<4; i++){
     //filling in the array for the sum for heapK+binSum
   sumK[i] = (rows[k][i]+binSum[i])%2;
   }
   
   //binary to integer
   int intSumK = toInt(sumK);
   int intBinSum = toInt(binSum);
   if (intSumK<intBinSum) return k;
   }
  }
   
   
 

  }
  
  int toInt(int[] binary){
    int integer = 0;
    for (int i=0; i<4, i++){
      integer += (int)(binary[i]*Math.pow(2,(3-i)));
      
  }
  return integer;
  }
  
  int binarySum (int m, int[][] rows){
    //this method returns either 0 or 1 for each sum
    int sum = 0;
    
    for (int i=0; i<rows.length; i++){
      sum += rows[i][m];
    }
    return (sum%2);
  
  }
  
  int sum(int s, int[][] game){
    return 0;
  }
  
  
  
  int[] binaryArray(int k){
    //returns an array of size 4 with the binary positions 
   String binK = Integer.toBinaryString(k);
   int[] binArray = new int[4];
   //will always have size 4 since the largest number a row can have is 8
   
   //if the string is shorter than 4, I need all the first digits to be 0
   if (binK.length() < 4) {
     int binLength = binK.length();
     for(int c = 0; c<(4-binLength); c++){
       binArray[c] = 0;
     }
     //then enter the digits of the string
     for (int j = 0; j<binLength; j++){
     binArray[j] = binK.charAt(j);
     j++;
     }
   }
  
  //put the digits in if there are 4 digits
  for(int i=0; i< binK.length(); i++){
    binArray[i] = binK.charAt(i);
  }
  
  return binArray;
  }}
