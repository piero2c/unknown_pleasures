float scl = 1.1;
int w = int(ceil(800/scl + 1));
int h = int(ceil(500/scl + 1));
float xoff, yoff, zoff;
float proba;

void setup() {
  size(800, 700, P2D);
  background(0);
  stroke(200);
  fill(0);
  smooth();
  frameRate(1);
  colorMode(HSB);
}

void draw() {
  translate(150, 80);
  background(0);
  strokeWeight(0.2);
  for (int y = 40; y < w - 180; y += 8) {
    beginShape();
    for (int x = 0; x < h - 0; x+=1) {
      /* Intensidade do ruído dado um valor de x */
      proba = map(x, 20, h-21, -5, 5);
      proba += map(noise(yoff+0.1), 0, 1, -0.4, 0.4);
      proba = map(1/sqrt(TWO_PI)*exp(-0.5*proba*proba), 0, 1, 0.2, 2);
      
      /* Largura do traço */
      strokeWeight(1);

      /* Cor do traço */

      /* Branco com gradiente de intensidade */
      stroke(map(noise(zoff), 0, 1, 200, 255), 200, random(150, 255));

      /* Traço */
      vertex(x*scl, y*scl-20 + proba * random(1, 1.001) * map(noise(yoff), 0, 1, -120, 20) + random(0, 0.5));
      yoff += random(0.005, proba/50);
      vertex((x+1)*scl, y*scl-20 + proba * random(1, 1.001) * map(noise(yoff), 0, 1, -120, 20) + random(0, 0.5));
    }
    endShape(CLOSE);
    zoff += 0.01;
  }
}