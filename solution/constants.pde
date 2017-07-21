int displayWidth=600, displayHeight=1000;
int gameState = 0;

float PLAYER_HORIZ_VELOCITY = 20;
float PLAYER_VERT_VELOCITY = 35;
float MAX_VERT_VELOCITY = 35;

float gravity = 1.0;

float lastHeight = 0;

float T = PLAYER_VERT_VELOCITY/gravity;
float diffLimit = 0.15*gravity*T*T;

color bgColor = color(255,253,231);

float playerX, playerY;
float playerVx = 10, playerVy = 10;
float playerRadius = 20;
color playerColor = color(179,157,219);

int lenPlatforms = 40;
int numPlatforms = 8;
float platforms[][] = new float [lenPlatforms][2];
int platformIndex = 0;
float platformLength = 50, platformHeight = 10;
float platformRadius = platformHeight*0.5;
color platformColor = color(139,195,74);

float restitutionCoeff = 0.95;
float dragCoeff = 0.03;

int score;
float scoreX = displayWidth*0.8, scoreY = 0.03*displayHeight;
int scoreSize = 30;
color scoreColor = color(198,40,40);

int startSize = 100;
color startColor = color(93,64,55);

int loseSize = 50;
color loseColor = color(93,64,55);

char LEFT = 'j', RIGHT = 'l', UP = 'w';
char RESET = 'r', PAUSE = 'p', START = 's';

boolean left, right, up, reset, pause, start;

boolean keys[] = new boolean [10];