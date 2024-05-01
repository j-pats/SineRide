import java.util.ArrayList;

// vertex constants
float VERTEX_SPACE = 20.0;
int NUM_VERTEX_W = 120;
int NUM_VERTEX_L = 40;

// main objects
Ground g;

// movement value
float movement;
float movementRate;

// camera values
float eyeX, eyeY, eyeZ;
float posX, posY, posZ;

void setup() {
  size(1200, 800, P3D);
  fill(204);
  
  // create ground
  g = new Ground(NUM_VERTEX_L, NUM_VERTEX_W, VERTEX_SPACE);
  
  // initialize movement value
  movement = 0.0;
  movementRate = 1.0;
}

void draw() {
  lights();
  background(0);
  
  // draw orientation arrows
  // X = RED
  stroke(255,0,0);
  line(0,0,0,50,0,0);
  // Y = GREEN
  stroke(0,255,0);
  line(0,0,0,0,50,0);
  // Z = BLUE
  stroke(0,0,255);
  line(0,0,0,0,0,50);
  
  // set camera values
  eyeX = (mouseX - width/2) + movement;
  eyeY = -mouseY + 100;
  eyeZ = (NUM_VERTEX_W * VERTEX_SPACE) / 2;
  posX = (8 * VERTEX_SPACE) + movement;
  posY = 0.0;
  posZ = (NUM_VERTEX_W * VERTEX_SPACE) / 2;
  
  // set camera position
  camera(eyeX, eyeY, eyeZ, posX, posY, posZ, 0.0, 1.0, 0.0);

  // update land with new camera position
  g.updateLandscapePoints(posX);
  
  // draw landscape
  stroke(255);
  g.drawGround();
  
  movement += movementRate;
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  g.ChangeScale(e);
}

void keyPressed(KeyEvent event) {
  if (keyCode == 'W') {
    movementRate += 1.0;
  } else if (keyCode == 'S'){
  movementRate -= 1.0;
  }
}
