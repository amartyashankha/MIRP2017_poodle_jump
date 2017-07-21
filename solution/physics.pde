void updatePlayerVelocity() {
  float dragY = -dragCoeff*playerVy;
  float dragX = -dragCoeff*playerVx;
  int mult = 20;
  if (left)
    playerVx = (mult*playerVx-PLAYER_HORIZ_VELOCITY)/(mult+1);
  if (right)
    playerVx = (mult*playerVx+PLAYER_HORIZ_VELOCITY)/(mult+1);
  if (up)
    playerVy = -PLAYER_VERT_VELOCITY;
  playerVx += dragX;
  playerVy += gravity + dragY;
}

void updatePlayerPosition() {
  playerX += playerVx;
  playerY += playerVy;
  if (playerX < 0 || playerX >= displayWidth)
    playerX = (playerX+displayWidth) % displayWidth;
  if (playerY > displayHeight)
    playerLose();
}

void updatePositions() {
  if (playerY < displayHeight/2){
    float delta = 2*MAX_VERT_VELOCITY*(displayHeight/2 - playerY)/displayHeight;
    score += delta;
    playerY += delta;
    lastHeight += delta;
    println(lastHeight, diffLimit);
    for(int i = 0 ; i < lenPlatforms ; ++i)
      platforms[i][1] += delta;
    if (lastHeight > diffLimit || random(1.0/numPlatforms) < delta/displayHeight){
      platforms[platformIndex][0] = random(platformLength, displayWidth-platformLength);
      platforms[platformIndex][1] = 0;
      lastHeight = 0;
      platformIndex += 1;
      platformIndex %= lenPlatforms;
    }
  }
}

void resolveCollisions() {
  if (playerVy >= 0){
    println("Resolving Collisions");
    for(int i = 0 ; i < lenPlatforms ; ++i){
      if (platforms[i][1] < displayHeight)
        if (playerY < platforms[i][1] && playerY > platforms[i][1]-platformHeight-playerRadius)
          if (playerX < platforms[i][0]+platformLength && playerX > platforms[i][0]-platformLength){
            playerY = platforms[i][1]-platformHeight-playerRadius;
            playerVy = -PLAYER_VERT_VELOCITY;
          }
      }
  }
}