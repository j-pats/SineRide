class Sky {
  // attributes
  float r;
  int numStars;
  Star starPositions[];
  
  public Sky(float radius, int num) {
    this.r = radius;
    this.numStars = num;
    starPositions = new Star[num];
    generateStars();
  }
  
  private void generateStars() {
    // generate random star positions on sphere
    double x, y, z, n;
    for(int i = 0; i < this.numStars; i++) {
      // generate random x, y, z positions and normalize
      x = randomGaussian();
      y = randomGaussian();
      z = randomGaussian();
      n = (1 / Math.sqrt((Math.pow(x,2.0) + Math.pow(y,2) + Math.pow(z,2))));
      x = (x * n) * this.r;
      y = Math.abs((y * n) * this.r) * -1;
      z = (z * n) * this.r;
      starPositions[i] = new Star((float)x, (float)y, (float)z, random(45, 255));
      println("X:" + x + " Y:" + y + " Z:" + z);
    }
  }
  
  private void drawStars(float x, float y, float z) {
    for (int i = 0; i < this.numStars; i++) {
      starPositions[i].drawStar(x, y, z);
    }
  }

}
