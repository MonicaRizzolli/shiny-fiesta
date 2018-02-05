//Monica Rizzolli

Linhas [] linha;
static final int NUM_LINHAS = 20;

void setup() {
  size(600, 600);
  linha = new Linhas[NUM_LINHAS];
  for (int i = 0; i < NUM_LINHAS; i++) {
    linha[i] = new Linhas(i, 0);
  }
}

void draw() {
  background(255);
  for (int i = 0; i < NUM_LINHAS; i++) {
  linha[i].desenho();
  }
}

class Linhas {

  float a; // parâmetro
  float dist; // distancia entre as linhas
  color cor;

  Linhas(float dist_, color cor_) {
    dist = dist_;
    cor = cor_;
  } 

  float x1(float a) {
    return sin(a/10)*200+sin(a)*2;
  }

  float y1(float a) {
    return cos(a/10)*200;
  }

  float x2(float a) {
    return cos(a/15)*300+cos(a)*5;
  }

  float y2(float a) {
    return sin(a/20)*200+sin(a/12)*20;
  }

  void desenho() {
    stroke(cor);
    strokeWeight(2);
    pushMatrix();
    translate(width/2, height/2);
    line(x1(a+dist), y1(a+dist), x2(a+dist), y2(a+dist));
    point(x1(a+dist), y1(a+dist));
    point(x2(a+dist), y2(a+dist));
    popMatrix();
    a+=0.5;
  }
}
