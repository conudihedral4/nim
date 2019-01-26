/***********************************************************
 *                    THE GAME OF NIM                      *
 * Created by Rosie Zhao, Ran Tao, Yao Liu, and Marcel Goh *
 *                  of McGill University                   *
 *          for ConUHacks IV (26-27 January 2019)          *
 ***********************************************************
 */

/* GLOBAL VARIABLES */
Game g;
int chosenRow;         // restricts player to a specific row once chosen
boolean playersTurn;

PImage quit;
PImage reset;
PImage confirm;
PImage playerOn;
PImage playerOff;
PImage cpuOn;
PImage cpuOff;
PImage canvas;

void setup() {
  /* initialize game variables */
  chosenRow = -1;
  playersTurn = true;

  /* load images */
  quit = loadImage("quit.png");
  reset = loadImage("reset.png");
  confirm = loadImage("confirm.png");
  playerOn = loadImage("player_on.png");
  playerOff = loadImage("player_off.png");
  cpuOn = loadImage("cpu_on.png");
  cpuOff = loadImage("cpu_off.png");
  canvas = loadImage("background.png");

  g = new Game(3,8);
  size(1200, 900);
  background(0);
  noStroke();
  fill(102);
  noLoop();         // game does not automatically loop
}

void mousePressed() {
  /* check if any doughnuts are clicked */
  for (int i=0; i<g.numRows; ++i) {
    int numItems = g.minItems + i;
    for (int j=0; j<numItems; ++j) {
      Item currItem = g.itemMatrix[i][j];
      if ((mouseX >= currItem.x) && (mouseX < currItem.x + currItem.width) &&
          (mouseY >= currItem.y) && (mouseY < currItem.y + currItem.height)) {
        if (chosenRow == -1 || chosenRow == i) {
          currItem.clicked = true;
          --g.table[i];
          chosenRow = i;
        }
        break;
      }
    }
  }

  /* check if quit button clicked */
  if ((mouseX >= 1100) && (mouseX < 1200) && (mouseY >= 860) && (mouseY < 900)) {
    // TODO: ADD QUIT BEHAVIOUR
  }

  /* check if reset button clicked */
  if ((mouseX >= 1000) && (mouseX < 1100) && (mouseY >= 860) && (mouseY < 900)) {
    g = new Game(g.minItems,g.maxItems);
  }

  /* check if done button clicked */
  if ((mouseX >= 500) && (mouseX < 700) && (mouseY >= 820) && (mouseY < 900)) {
    chosenRow = -1;
  }

  /* update the screen */
  redraw();
}

void draw() {
  background(0);
  image(canvas, 0, 0, 1200, 900);
  /* draw doughnuts */
  g.display();

  /* draw buttons */
  image(quit, 1100, 860, 100, 40);  // quit button
  image(reset, 1000, 860, 100, 40);  // reset button
  image(confirm, 500, 820, 200, 80);   // done button

  /* draw player/CPU icons */
  if (playersTurn) {
    image(playerOn, 0, 0, 200, 80);
    image(cpuOff, 1000, 0, 200, 80);
  } else {
    image(playerOff, 0, 0, 200, 80);
    image(cpuOn, 1000, 0, 200, 80);
  }


  //TESTTTTTT
  for (int i=0; i<g.numRows; ++i) {
    print(g.table[i]+" ");
  }
  println();
  //ENDTESTTTTT

}
