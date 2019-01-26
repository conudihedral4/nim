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
    
    
    
 
    
    
    //In normal play, the winning strategy is to finish every move with a nim-sum of 0
    
    
    
    
    return move; 
  }
  
  int[] binarySum (int[][] rows){
    int[] sumArray = new int[rows.length];
    for (int i=0; i< 4;i++){
      
    }
    return sumArray;
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
