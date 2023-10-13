/* class Ball {
  float x;
  float y;
  float w;
  float h;
  float speedX;
  float speedY;

  Ball(float x, float y, float w, float h, float speedX, float speedY) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speedX = speedX;
    this.speedY = speedY;
  }

  void draw() {
  background(0);
  if (millis() % 5000 == 0) {
    spawnBall();
  }

  for (Ball ball : balls) {
    ball.draw();
    ball.move();
    ball.bounceOffWalls(width, height);
  }
}

void spawnBall() {
  float x = random(width);
  float y = random(height);
  float w = 50;
  float h = 50;
  float speedX = random(-5, 5);
  float speedY = random(-5, 5);

  Ball ball = new Ball(x, y, w, h, speedX, speedY);
  balls.add(ball);
}
  void move() {
    x += speedX;
    y += speedY;
  }

  void bounceOffWalls(float width, float height) {
    if (x > width - w / 2) {
      speedX = -speedX;
    } else if (x < 0 + w / 2) {
      speedX = -speedX;
    }

    if (y > height - h / 2) {
      speedY = -speedY;
    } else if (y < 0 + h / 2) {
      speedY = -speedY;
    }
  }
}
*/ 
