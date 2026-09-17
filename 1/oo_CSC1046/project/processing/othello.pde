Piece[][] Board = new Piece[8][8];
float cellSize = 80;
float pieceColor = 0;
int whiteCount = 2;
int blackCount = 2;
void setup() {
  size(640, 700);
  ellipseMode(CORNER);
  drawStart();
}
void draw() {
  background(255);
  drawGrid();
  drawScore();


  int x = int(mouseX / cellSize);
  int y = int(mouseY / cellSize);
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < 640 && Board[x][y] == null) {
    drawPiece(pieceColor, x, y);
  }

  if (whiteCount < 1) {
    background(0);
    fill(255);
    text("Black wins!!", 260, 320);
  }
  if (blackCount < 1) {
    background(255);
    fill(0);
    text("White wins!!", 260, 320);
  }

  if ((whiteCount < 1 || blackCount < 1) || (whiteCount + blackCount >= 64)) {
    if (whiteCount < blackCount) {
      background(0);
      fill(255);
      text("Black wins!!", 260, 320);
    } else {
      background(255);
      fill(0);
      text("White wins!!", 260, 320);
    }
  }
}

void drawScore() {
  fill(255);
  ellipse(437, 651, 40, 40);
  fill(0);
  ellipse(5, 651, 40, 40);
  textSize(32);
  text("Score: "+blackCount, 58, 683);
  text("Score: "+whiteCount, 486, 683);
}

void drawStart() {

  Board[3][3] = new Piece(0);
  Board[3][4] = new Piece(255);
  Board[4][3] = new Piece(255);
  Board[4][4] = new Piece(0);
}
void drawGrid() {
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      fill(255);
      rect(i*cellSize, j*cellSize, cellSize, cellSize);
      if (Board[i][j] != null) {
        drawPiece(Board[i][j].Color, i, j);
      }
    }
  }
}

void mousePressed() {
  int x = int(mouseX / cellSize);
  int y = int(mouseY / cellSize);
  placePiece(x, y);
}


void drawPiece(float Color, float x, float y) {
  fill(Color);
  ellipse(x*cellSize, y*cellSize, cellSize, cellSize);
}

void placePiece(int  x, int y) {
  if (Board[x][y] == null) {
    if (findLines(x, y)) {
      drawPiece(pieceColor, x, y);
      Board[x][y] = new Piece(pieceColor);
      if (pieceColor == 0) {
        blackCount++;
        pieceColor = 255;
      } else {
        whiteCount++;
        pieceColor = 0;
      }
    }
  }
}
Boolean findLines(int x, int y) {
  Boolean found = false;
  for (int i = -1; i < 2; i++) {
    for (int j = -1; j < 2; j++) {
      if (i == j && j == 0) {
        continue;
      }
      found |= findLine(x+i, y+j, i, j, true);
    }
  }
  return found;
}
// x, y - coords of current cell
// dx, dy - coordinate deltas (direction of line)
Boolean findLine(int x, int y, int dx, int dy, boolean touching) {
  // baseCase wall
  if (x < 0 || y < 0 || x > 7 || y > 7) {
    return false;
  }
  // baseCase hole
  if (Board[x][y] == null) {
    return false;
  }
  // baseCase found
  if (Board[x][y].Color == pieceColor) {
    return true && !touching;
  }
  touching = false;
  if ( findLine(x+dx, y+dy, dx, dy, touching)) {
    Board[x][y].Color = pieceColor;
    if (pieceColor == 255) {
      whiteCount++;
      blackCount--;
    } else {
      whiteCount--;
      blackCount++;
    }
    return true;
  }
  return false;
}
