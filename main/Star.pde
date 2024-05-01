class Star extends Vertex {
  // attributes
  float o;
  
  public Star(float xn, float yn, float zn, float op) {
    super(xn, yn, zn);
    this.o = op;
  }
  
  public void drawStar(){
    stroke(this.o);
    point(this.x, this.y, this.z);
  }

}
