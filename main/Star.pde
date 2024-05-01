class Star extends Vertex {
  // attributes
  float o;
  
  public Star(float xn, float yn, float zn, float op) {
    super(xn, yn, zn);
    this.o = op;
  }
  
  public void drawStar(float camX, float camY, float camZ){
    stroke(this.o);
    point(this.x + camX, this.y + camY, this.z+ camZ);
  }

}
