PImage obj1,obj2,obj3,obj4,obj5,obj6,plr;

float playerX = 300,playerY = 330;
float objX[] = {800,800,800,800,800,800};
boolean JumpUp = false,JumpDown = false, Jump = false;
int studs = 0;

public class Collision {
    float posX1;
    float posX2;
    float posY1;
    float posY2;

    float plrX;
    float plrY;

    // Proper constructor
    public Collision(float x, float y, float plrX, float plrY) {
        this.posX1 = x;
        this.posY1 = y;
        this.posX2 = x + 200;
        this.posY2 = y + 250;

        this.plrX = plrX;
        this.plrY = plrY;
    }

    public void hit() {
        if (plrX >= posX1 && plrX <= posX2 &&
            plrY >= posY1 && plrY <= posY2) {
            System.out.println("hit");
        } else {
            System.out.println("no hit");
        }
    }
}

void setup() {
  size(800,600);
  plr = loadImage("kid1.png");
  obj1 = loadImage("object.jpg");
  obj2 = loadImage("object.jpg");
  obj3 = loadImage("object.jpg");
  obj4 = loadImage("object.jpg");
  obj5 = loadImage("object.jpg");
  obj6 = loadImage("object.jpg");

}

void keyPressed() {
if (key == ' ' && Jump == false) {
JumpUp = true;
}

}

void draw() {
background(0);
image(obj1,objX[0]-=5,400,500,200);
image(obj2,objX[1]-=5,400,400,200);
image(obj3,objX[2]-=5,400,480,200);
image(obj4,objX[3]-=5,400,280,200);
image(obj5,objX[4]-=5,400,350,200);
image(obj6,objX[5]-=5,400,340,200);
image(plr,playerX,playerY,60,80); 

Collision collid = new Collision(objX[0],400,playerX,playerY);
collid.hit();
if (JumpUp) {
  Jump = true;
 image(plr,playerX,playerY-=5,60,80); 
if (playerY <= 200) { JumpUp = false; JumpDown = true; }
}

if (JumpDown) {
 image(plr,playerX,playerY+=5,60,80); 
if (playerY >= 330) { JumpDown = false; Jump = false; }
}


if (objX[0] <= -500) {
objX[0] = objX[5] + 600;
}

if (objX[1] <= -400) {
objX[1] = objX[0] + 600;
}

if (objX[2] <= -480) {
objX[2] = objX[1] + 600;
}

if (objX[3] <= -280) {
objX[3] = objX[2] + 600;
}

if (objX[4] <= -350) {
objX[4] = objX[3] + 600;
}

if (objX[5] <= -340) {
objX[5] = objX[4] + 600;
}

}
