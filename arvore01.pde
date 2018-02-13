/*
Programa de desenho com árvore e=recursiva
Monica Rizzolli - http://monicarizzolli.tumblr.com
Adaptado de <https://www.openprocessing.org/sketch/491144>

DOE: http://patreon.com/arteprog
*/

void setup() {
  size(800, 800);
  frameRate(10);
  //noLoop();
}

void draw() {
  background(255);
  arvore(width/2, height, random(-15, 15), 7);
  //saveFrame("arvoreB####.png"); 
  
}

void arvore(double x1, double y1, float angle_, float profun) {

  float angle = radians(angle_);

  // comprimento dos galhos
  double comp = 150 * Math.tanh(profun/4);

  // usar o ângulo para calcular o fim do galho
  double x2 = x1 - (comp * sin(angle));
  double y2 = y1 - (comp * cos(angle));

  // calcular strokeWeight e desenhar o galho
  stroke(0);  
  strokeWeight(3.8 * profun/2);
  line((float)x1, (float)y1, (float)x2, (float)y2);
  
  // folhas
  for (int i = 0; i < 35; i+=7) {
    for (int j = 0; j < 35; j+=7) {
      float x5 = (float)x2+random(i);
      float y5 = (float)y2+random(j);
      float x6 = (float)x2-random(i);
      float y6 = (float)y2-random(j);
      noFill();
      strokeWeight(1);
      curve(x5 + random(50, 80), y5 + random(50, 80), x5, y5, (float)x2, (float)y2, (float)x2 +random(50, 80), (float)y2 +random(50, 80));
      curve(x6 + random(50, 80), y6 + random(50, 80), x6, y6, (float)x2, (float)y2, (float)x2 +random(50, 80), (float)y2 +random(50, 80));
      fill(255); 
      ellipse(x5, y5, random(3, 10), random(3, 10));
      ellipse(x6, y6, random(3, 10), random(3, 10));
    }
  }

  // novos ângulos para árvores emergentes
  float angle1 = angle + 30 + random(-35, 35);
  float angle2 = angle - 30 + random(-35, 35);

  float a = random(.3, .5);
  float b = random(.2, .3);

  // mais partes da árvore
  double x3 = x1 - (a * comp * sin(angle));
  double y3 = y1 - (a * comp * cos(angle));

  double x4 = x1 - (b * comp * sin(angle));
  double y4 = y1 - (b * comp * cos(angle));

  // novas árvores - recursão
  if (profun > 1) {
    arvore(x2, y2, angle1, profun -1);
    arvore(x2, y2, angle2, profun -1);
    arvore(x3, y3, angle1, profun -1);
    arvore(x4, y4, angle2, profun -1);
  }
}
