import ddf.minim.*;

Minim minim;
AudioPlayer playerIntro;
AudioPlayer playerLoop;
boolean loopStarted;

// vertex constants
float VERTEX_SPACE = 20.0;
int NUM_VERTEX_W = 120;
int NUM_VERTEX_L = 40;

// main objects
Ground g;
Sky s;

// movement value
float movement;
float movementRate;

// camera values
float eyeX, eyeY, eyeZ;
float posX, posY, posZ;

void setup() {
  size(1200, 800, P3D);
  fill(204);
  
  minim = new Minim(this);
  
  // create ground
  g = new Ground(NUM_VERTEX_L, NUM_VERTEX_W, VERTEX_SPACE);
  
  // create sky
  s = new Sky(5000, 1500);
  
  // initialize movement value
  movement = 0.0;
  movementRate = 1.0;
  
  //setup sound file
  playerIntro = minim.loadFile("sine_ride_intro.wav");
  playerIntro.setGain(-20);
  playerIntro.play();
  
  playerLoop = minim.loadFile("sine_ride_loop.wav");
  playerLoop.setGain(-20);
}

void draw() {
  // check if audio is done playing, then start next one
  if (!playerIntro.isPlaying() && !loopStarted) {
    playerLoop.loop();
    loopStarted = true;
  }
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
  
  
  // draw stars
  translate(posX, posY, posZ);
  rotateX(-PI/12.0);
  rotateZ(-(millis() / 100000.0));
  s.drawStars();
  
  movement += movementRate;
}

void mouseWheel(MouseEvent event) {
  // float e = event.getCount();
  // g.ChangeScale(e);
}

void keyPressed(KeyEvent event) {
  if (keyCode == 'W') {
    movementRate += 1.0;
  } else if (keyCode == 'S'){
  movementRate -= 1.0;
  } else if (keyCode == 'A') {
    g.ChangeScale(g.getScale() + 25.0f);
  } else if (keyCode == 'D') {
    g.ChangeScale(g.getScale() - 25.0f);
  }
}
