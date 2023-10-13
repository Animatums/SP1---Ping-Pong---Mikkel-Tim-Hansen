float x, y, w, h, speedX, speedY;
int paddleXL, paddleYL, paddleW, paddleH, paddleS;
int paddleXR, paddleYR;
int scoreL = 0;
int scoreR = 0;
int winScore = 5;

boolean upL, downL;
boolean upR, downR;

color colorL = color(0,255,0);
color colorR = color(255,0,0);

// ArrayList<Ball> balls;

void setup(){
  size(850,850);
  background(0);
  
  x = width/2;
  y = height/2;
  w = 50;
  h = 50;
  speedX = 5.5;
  speedY = 5.5;
  
  textSize(50);
  textAlign(CENTER, CENTER);
  
  rectMode(CENTER);
  paddleXL = 25;
  paddleYL = height/2;
  
  paddleXR = width-25;
  paddleYR = height/2;
  
  paddleW = 25;
  paddleH = 80;
  paddleS = 7;
  
// balls = new ArrayList<Ball>();
  
}

void draw(){
  background(0);
 
drawCircle();
moveCircle();
bounceOffWalls();
 
drawPaddles();
movePaddle();
restrictPaddle();
contactPaddle();
scores();
gameOver();

}


void drawPaddles() {
  fill(colorL);
  rect(paddleXL, paddleYL, paddleW, paddleH);
  fill(colorR);
  rect(paddleXR, paddleYR, paddleW, paddleH);
}

void movePaddle() {
  if(upL == true){
    paddleYL = paddleYL - paddleS;
  }
  if(downL == true){
    paddleYL = paddleYL + paddleS;
  }
  if(upR == true){
    paddleYR = paddleYR - paddleS;
  }
  if(downR == true){
    paddleYR = paddleYR + paddleS;
  }
}

void restrictPaddle() {
  if(paddleYL - paddleH/2 < 0) {
    paddleYL = paddleYL + paddleS;
  }

  if(paddleYL + paddleH/2 > height) {
    paddleYL = paddleYL + paddleS;
  }

  if(paddleYR - paddleH/2 < 0) {
    paddleYR = paddleYR + paddleS;
  }

  if(paddleYR + paddleH/2 > height) {
    paddleYR = paddleYR + paddleS;
  }

  if (paddleYL < 0 + paddleH / 2) {
    paddleYL = 0 + paddleH / 2;
  }

  if (paddleYL > height - paddleH / 2) {
    paddleYL = height - paddleH / 2;
  }
    if (paddleYR < 0 + paddleH / 2) {
    paddleYR = 0 + paddleH / 2;
  }

  if (paddleYR > height - paddleH / 2) {
    paddleYR = height - paddleH / 2;
  }
}

void contactPaddle() {
  if(x - w/2 < paddleXL + paddleW/2 && y - h/2 < paddleYL + paddleH/2 && y + h/2 > paddleYL - paddleH/2) {
    if(speedX < 0) {
    speedX = -speedX;
  }
}
  else if(x + w/2 > paddleXR - paddleW/2 && y - h/2 < paddleYR + paddleH/2 && y + h/2 > paddleYR - paddleH/2) {
    if(speedX > 0) {
    speedX = -speedX;
    }
  }
}

void drawCircle() {
  fill(0,0,255);
  ellipse(x,y,w,h);
}

void moveCircle() {
  x = x + speedX;
  y = y + speedY;
}

void bounceOffWalls() {
    if( x > width - w/2 ) {
      setup();
        speedX = -speedX;
        scoreL = scoreL + 1;
}  
  
  else if ( x < 0 + w/2 ) {
    speedX = -speedX;
      setup();
       scoreR = scoreR + 1;
  }
  
  if( y > height - h/2 ) {
    speedY = -speedY;
  }
  else if ( y < 0 + h/2 ) {
    speedY = -speedY;
  }
}

void gameOver() {
if(scoreL == winScore) {
  gameOverPage("Tillykke, grøn er vinderen!", colorL);
}

if(scoreR == winScore) {
  gameOverPage("Tillykke, rød er vinderen!", colorR);
   }
}

void gameOverPage(String text, color c) {
  
   speedX = 0;
   speedY = 0;
   
   fill(255);
   text("↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓", width/2, height/3 - 60);
   text("↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑", width/2, height/3 - -60);
   text("Tryk for at genstarte", width/2, height/3 + 350);
   fill(c);
   text(text, width/2, height/3);
   
   if(mousePressed) {
     scoreR = 0;
     scoreL = 0;
     speedX = 3;
     speedY = 3;
   }
}

void scores() {
  fill(255);
  text(scoreL, 100, 50);
  text(scoreR, width -100, 50);
}

void keyPressed() {
  if(key == 'w' || key == 'W') {
    upL = true;
  }
  if(key == 's' || key == 'S') {
    downL = true;
  }
  
  if(keyCode == UP) {
    upR = true;
  }
  if(keyCode == DOWN) {
    downR = true;
  }
}

void keyReleased() {
   if(key == 'w' || key == 'W') {
    upL = false;
  }
  
   if(key == 's' || key == 'S') {
    downL = false;
  }
     if(keyCode == UP) {
    upR = false;
  }
  
   if(keyCode == DOWN) {
    downR = false;
  }
}
