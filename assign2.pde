
PImage bg1Img;
PImage bg2Img;
PImage end1Img;
PImage end2Img;
PImage enemyImg;
PImage fighterImg;
PImage hpImg;
PImage start1Img;
PImage start2Img;
PImage treasureImg;

final int GAME_START = 0;
final int GAME_PLAYING = 1;
final int GAME_WIN = 2;
final int GAME_LOSE = 3;

int gameState = 0;

int health = 0;

int c;
int a, b, e, f;
{a=floor(random(420));
 b=floor(random(400));
 e=floor(random(420));
 f=floor(random(400));}
int d = 40;

int bg;

float x;
float y;
float speed = 5;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

void setup () {
  gameState = GAME_START;
  size(640, 480) ;
  c = 0;
  bg = 0;
  x = width/2;
  y = height/2;
  bg1Img = loadImage("img/bg1.png");
  bg2Img = loadImage("img/bg2.png");
  end1Img = loadImage("img/end1.png");
  end2Img = loadImage("img/end2.png");
  enemyImg = loadImage("img/enemy.png");
  fighterImg = loadImage("img/fighter.png");
  hpImg = loadImage("img/hp.png");
  start1Img = loadImage("img/start1.png");
  start2Img = loadImage("img/start2.png");
  treasureImg = loadImage("img/treasure.png");
}

void draw() {
  image (start1Img, bg, 0);
  switch (gameState) {
  case GAME_START:
    if (mouseX > 200 && mouseX < 440 && mouseY > 370 && mouseY < 420) {
      if (mousePressed) {
        image (start2Img, bg, 0);
        gameState = GAME_PLAYING;
      } else {
        noStroke();
        fill(255, 255, 0, 100);
        rect(210, 380, 240, 30);
      }
    }
    break;

  case GAME_PLAYING:
    //do something
    image(bg1Img, bg, 0);
    image(bg2Img, bg-bg1Img.width, 0);
    image(bg1Img, bg-bg1Img.width-bg2Img.width, 0);
    bg +=1;
    bg %=(bg1Img.width+bg2Img.width);

    image(treasureImg, a, b);
    
    stroke(0);
    fill(255, 0, 0);
    rect(20, 15, d, 15);
    if (d >= 0 && d<10){
      gameState = GAME_LOSE;
      d = 40;
    }
    
    image(hpImg, 10, 10);

    image(enemyImg, c, 150);
    c +=4;
    c %=640;

    image(fighterImg, x, y);
    if (upPressed) {
      y -= speed;
    }
    if (downPressed) {
      y += speed;
    }
    if (leftPressed) {
      x -= speed;
    }
    if (rightPressed) {
      x += speed;
    }

    // boundary detection
    if (x > width) {
      x = 0;
    }
    if (x < 0) {
      x = width;
    }
    if (y > height) {
      y = 0;
    }
    if (y < 0) {
      y = height;
    }
    if (x >= a-30 &&  x<= a+30 && y >= b-30 && y <=b+30){
      d = d+20;
      a=floor(random(420));
      b=floor(random(400));
    }
    
    if (d >=200){
      d =200;
    }
    
    if (x >= c-50 &&  x<= c+50 && y >= 100 && y <=200){ 
      x = width/2;
      y = height/2;
      d = d-40;
      c = 0;
    }
     
  case GAME_WIN:
  break;
  
  case GAME_LOSE:
    image(end1Img, 0, 0);
    if (mouseX >200 && mouseX <440 && mouseY >300 && mouseY < 350) {
      if (mousePressed) {
        image(end2Img, 0, 0);
        gameState = GAME_PLAYING;
      } else {
        noStroke();
        fill(255, 255, 0, 100);
        rect(210, 315, 225, 30);
      } 
    }
    break;
  }
}
  void keyPressed() {
    if (key == CODED) {
      switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
      }
    }
  }
  void keyReleased() {
    if (key == CODED) {
      switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
      }
    }
  }
