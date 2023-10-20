PGraphics buffer;
int alpha = 255;

void setup() {
  fullScreen();
  frameRate(120);
  noCursor();
  buffer = createGraphics(width, height);
  buffer.beginDraw();
  buffer.background(0);
  buffer.endDraw();
}

void draw() {
  // Variables
  int sides = 5;
  float middleX = displayWidth / 2;
  float middleY = displayHeight / 2;

  buffer.beginDraw();
  buffer.stroke(255, alpha);
  buffer.line(mouseX, mouseY, pmouseX, pmouseY);
  buffer.endDraw();
  
  alpha -= 1;
  
  image(buffer, 0, 0);

  // Les 5 points du pentagone
  // Calcul de l'angle
  float angle = atan2(mouseY - middleY, mouseX - middleX);

  // Positionnement des points
  for (int i = 0; i < sides; i++) {
    float radius = dist(middleX, middleY, mouseX, mouseY);
    float x = middleX + cos(angle + TWO_PI / sides * i) * radius;
    float y = middleY + sin(angle + TWO_PI / sides * i) * radius;
    ellipse(x, y, 10, 10);
  }

  // Duplication inversée
  angle = atan2(mouseX - middleX, mouseY - middleY);

  for (int i = 0; i < sides; i++) {
    float radius = dist(middleX, middleY, mouseX, mouseY);
    float x = middleX + cos(angle + TWO_PI / sides * i) * radius;
    float y = middleY + sin(angle + TWO_PI / sides * i) * radius;
    ellipse(x, y, 10, 10);
  }
}
