class RobotMisere {
  int[] nextMove(int[] heaps, String gameType) {
    
    assert heaps != null;
    
    boolean is_misere = (gameType.equalsIgnoreCase("misere"));
    int[] move = new int[2];
    
    //general strategy is identical for misere and normal play, until endgame state
    //endgame is defined as if there are about to be only heaps of size one left
    boolean endgame = false;
    
    //count number of heaps that have strictly more than one items left
    int moreThanOne = 0;
    for (int i=0; i<heaps.length; i++) {
      if (heaps[i] > 1) {
        moreThanOne++;
      }
    }
    
    //endgame occurs if we have only 1 or 0 heaps with strictly more than one items
    endgame = (moreThanOne <= 1);
    
    //in a misere game and endgame state
    //make a move that will end with an odd number of heaps all containing 1
    if (is_misere && endgame) {
      
      //count number of nonempty heaps
      int moves_left=0;
      for (int i=0; i<heaps.length; i++) {
        if (heaps[i] != 0) {
          moves_left++;
        }
      }
      
      //checks if we have an odd number of nonempty heaps
      //and the max number of items out of all of the heaps
      boolean odd_heaps = (moves_left % 2 == 1);
      int max_items = findMax(heaps);
      
      //if maximum number of items is 1, i.e. we only have heaps of size 1 left
      //and there are an odd number of such heaps
      //robot doesn't have a winning move, therefore leave random move
      if (max_items == 1 && odd_heaps) {
        return randomMove();
      }
      
      //we want to remove from the row that has 1 item
      //results in an odd number of heaps of size 1
      int index_of_max = findIndex(heaps, max_items);
      move[0] = index_of_max;
      
      int boolInt = (odd_heaps) ? 1 : 0;
      move[1] = max_items - boolInt;
      
      return move;
    }
    
    //if we aren't in misere or endgame, then the gameplay is the same!
    //find nimsum and try to make it 0:
    int nimSum = calcNimSum(heaps);
    
    if (nimSum == 0){
      //no winning move if nimsum is 0
      return randomMove();
    }
    
    //nimSum doesn't equal 0 so the bot has a winning move
    for (int i=0; i<heaps.length; i++) {
      int target_size = heaps[i] ^ nimSum;
      if (target_size < heaps[i]) {
        move[0]= i;
        move[1]= heaps[i] - target_size;
        return move;
      }
    }
    move[0] = 0;
    move[1] = 0;
    return move;
  }
  
  //helper methods!
  
  //max of int array
  int findMax(int[] arr) {
    //assume max is first entry
    int max = arr[0];
    for (int i = 0; i<arr.length; i++) {
      if (arr[i] > max) {
        max = arr[i];
      }
    }
    return max;
  }
  
  //index of max
  int findIndex(int[] arr, int max) {
    for (int i=0; i<arr.length; i++) {
      if (arr[i] == max) {
        return i;
      }
    }
    //dummy return
    return 0;
  }
  
  //generates a random move if robot can't win
  int[] randomMove() {
    int[] dummy = new int[2];
    return dummy;
  }
  
  //calculates nimsum
  int calcNimSum(int[] heaps) {
    int toReturn = heaps[0];
    
    for (int i=1; i<heaps.length; i++) {
      toReturn = toReturn ^ heaps[i];
    }
    return toReturn;
  }
  
}
