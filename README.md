-Declaring variables
//Declaring the cliff objects
PImage obj1, obj2, obj3, obj4, obj5, obj6, plr, Sky;
//Setting the players x and y position
float playerX = 100, playerY = 330;
//Setting the cliff objects start x position using a float array
float objX[] = {100, 800, 800, 800, 800, 800};
//Using a boolean to control the players jump
boolean JumpUp = false, JumpDown = false, Jump = false;
//Using the fall boolean to reset the game when the player falls off the cliff
boolean fall = false;
int attempt = 0;
int score = 0;

- Using a class to detect the collision
public class Collision {
//plrX stores the players X position
float plrX;
//ObjY stores the objects y position
float ObjY;

void Collision(float plrX,float ObjY) {
this.plrX = plrX;
this.ObjY = ObjY;
}

public void hit(float plrY,float ObjX) {

}

}
void checkCollision(float x, float y, float boxWidth, float boxHeight, float plrX, float plrY) {
  float posX1 = x;
  float posX2 = x + boxWidth;
  float posY1 = y;
  float posY2 = y + boxHeight;

  if (!Jump) {
    if (plrX >= posX1 && plrX <= posX2 && plrY >= posY1 && plrY <= posY2) {
      println("hit");
      playerY = 330;
      fall = false;
    } else {
      println("no hit");
      fall = true;
    }
  }
}
