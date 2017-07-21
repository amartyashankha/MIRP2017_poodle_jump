void setup() {
  size(displayWidth, displayHeight);
  resetGame();
  textFont(createFont("Arial Bold", 50));
}

void draw() {
  if (reset)
    gameState = 0;
  if (gameState == 0) {
    drawStartScreen();
  }
  if (gameState == 1) {
    drawGameScreen();
  }
  if (gameState == 2) {
    drawLoseScreen();
  }
}

void drawStartScreen() {
  background(bgColor);
  textAlign(CENTER);
  textSize(startSize);
  fill(startColor);
  text("S to start", displayWidth/2, displayHeight/2);
  if (start){
    gameState = 1;
    resetGame();
  }
}

void drawLoseScreen() {
  background(bgColor);
  textAlign(CENTER);
  textSize(loseSize);
  fill(loseColor);
  text("Your score: "+str(score), displayWidth/2, displayHeight/3);
  text("R to reset", displayWidth/2, displayHeight*2/3);
  if (reset)
    gameState = 0;
}

void drawGameScreen() {
  // codes of game screen
  background(bgColor);
  if (!pause) {
    updatePlayerVelocity();
    updatePlayerPosition();
    updatePositions();
    resolveCollisions();
  }
  displayScore();
  drawPlatforms();
  drawPlayer();
}

void drawPlayer() {
  fill(playerColor);
  ellipse(playerX, playerY, 2*playerRadius, 2*playerRadius);
}

void drawPlatforms() {
  for(int i = 0 ; i < lenPlatforms ; ++i) {
    if (platforms[i][1] < displayHeight) {
      fill(platformColor);
      rectMode(RADIUS);
      rect(platforms[i][0], platforms[i][1], platformLength, platformHeight, platformRadius);
    }
  }
}

void resetGame(){
  playerX = displayWidth/2;
  playerY = displayHeight/2;
  playerVx = 0;
  playerVy = 0;
  score = 0;
  initializePlatforms();
  redraw();
  delay(1000);
}

void initializePlatforms() {
  for (int i = 0 ; i < numPlatforms ; ++i) {
    platforms[i][0] = random(platformLength, displayWidth-platformLength);
    platforms[i][1] = random(displayHeight);
    lastHeight = min(lastHeight, platforms[i][1]);
  }
  platformIndex = numPlatforms;
}

void displayScore() {
  textAlign(CENTER);
  textSize(scoreSize);
  fill(scoreColor);
  text("Score: "+score, scoreX, scoreY);
}