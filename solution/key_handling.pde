void keyPressed() {
  if (key == LEFT)       left = true;
  if (key == RIGHT)      right = true;
  if (key == UP)         up = true;
  if (key == RESET)      reset = true;
  if (key == PAUSE)      pause = true;
  if (key == START)      start = true;
}

void keyReleased() {
  if (key == LEFT)       left = false;
  if (key == RIGHT)      right = false;
  if (key == UP)         up = false;
  if (key == RESET)      reset = false;
  if (key == PAUSE)      pause = false;
  if (key == START)      start = false;
}