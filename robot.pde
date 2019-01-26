  int[] testing = binaryArray(4);

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
       int d = 0;
       for (int j = 4-binLength; j<4; j++){
         binArray[j] = Integer.parseInt(""+binK.charAt(d));
         d++;
       }
     }
     //put the digits in if there are 4 digits
     else{
       for(int i=0; i<binK.length(); i++){
          binArray[i] = Integer.parseInt(""+binK.charAt(i));
       }
     }
     println(binArray);
     return binArray;
  }
