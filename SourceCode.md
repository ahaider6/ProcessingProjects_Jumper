//Declaring the variables
PImage obj1, obj2, obj3, obj4, obj5, obj6, plr, Sky;

float playerX = 100, playerY = 330;
float objX[] = {100, 800, 800, 800, 800, 800};
boolean JumpUp = false, JumpDown = false, Jump = false;
boolean fall = false;
int attempt = 0;
int score = 0;
//Using a class to detect the collision
public class Collision {
  public float plrX;
  public float objY;
  public Collision(float plrX,float objY) {
  this.plrX = plrX;
  this.objY = objY;
}

public void hit(float x,float plrY,float boxWidth, float boxHeight) {
float posX1 = x;
float posX2 = x + boxWidth;
float posY1 = this.objY;
float posY2 = this.objY + boxHeight;

if (!Jump) {
    if (plrX >= posX1 && plrX <= posX2 && plrY >= posY1 && plrY <= posY2) {
      
      playerY = 330;
      fall = false;
    } else {
      
      fall = true;
    }
}

}

}

void setup() {
  size(800, 600);
  Sky = loadImage("Sky.jpg");
  plr = loadImage("kid1.png");
  obj1 = loadImage("object.jpg");
  obj2 = loadImage("object.jpg");
  obj3 = loadImage("object.jpg");
  obj4 = loadImage("object.jpg");
  obj5 = loadImage("object.jpg");
  obj6 = loadImage("object.jpg");
  
  
}

void keyPressed() {
  if (key == ' ' && !Jump) {
    JumpUp = true;
    Jump = true;   
    fall = false;
  }
}

void draw() {
  background(Sky);
  fill(255,0,0);
  textSize(25);
  text("Attempt: " + attempt,20,50);
  text("Score: " + score,20,80);
  //Moving the objects from right to left
  image(obj1, objX[0] -= 5, 400, 500, 200);
  image(obj2, objX[1] -= 5, 400, 400, 200);
  image(obj3, objX[2] -= 5, 400, 480, 200);
  image(obj4, objX[3] -= 5, 400, 280, 200);
  image(obj5, objX[4] -= 5, 400, 350, 200);
  image(obj6, objX[5] -= 5, 400, 340, 200);

  score++;
  image(plr, playerX, playerY, 60, 80);
  
//Setting up the collision variables
Collision collid1 = new Collision(playerX,200);
Collision collid2 = new Collision(playerX,200);
Collision collid3 = new Collision(playerX,200);
Collision collid4 = new Collision(playerX,200);
Collision collid5 = new Collision(playerX,200);
Collision collid6 = new Collision(playerX,200);

 collid1.hit(objX[0],playerY,500,200);
 collid2.hit(objX[1],playerY,400,200);
 collid3.hit(objX[2],playerY,480,200);
 collid4.hit(objX[3],playerY,280,200);
 collid5.hit(objX[4],playerY,350,200);
 collid6.hit(objX[5],playerY,340,200);
 //Making the player fall until is reaches 550 on the Y axis and reseting
  if (fall) {
    playerY += 10;
    if (playerY >= 550) {
      delay(1000);
      playerY = 330;
      attempt++;
      score = 0;
      
      objX[0] = 100;
      objX[1] = 800;
      objX[2] = 800;
      objX[3] = 800;
      objX[4] = 800;
      objX[5] = 800;
      fall = false;
    }
  }

  //controlling the players jump
  if (JumpUp) {
    playerY -= 5;
    if (playerY <= 200) {
      JumpUp = false;
      JumpDown = true;
    }
  }

  if (JumpDown) {
    playerY += 5;
    if (playerY >= 330) {
      JumpDown = false;
      Jump = false;
    }
  }

  //Using an if statement to move the object back when it is off of the screen and add spacing
  if (objX[0] <= -500) objX[0] = objX[5] + 700;
  if (objX[1] <= -400) objX[1] = objX[0] + 700;
  if (objX[2] <= -480) objX[2] = objX[1] + 700;
  if (objX[3] <= -280) objX[3] = objX[2] + 700;
  if (objX[4] <= -350) objX[4] = objX[3] + 700;
  if (objX[5] <= -340) objX[5] = objX[4] + 700;
}
