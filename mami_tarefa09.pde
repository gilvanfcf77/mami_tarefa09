String s;
int bolaX = 400;
int bolaY = 10;
int dX = 5;
int dY = 5;
int bastao1Y = 0;
int bastao2Y = 0;

int pontos1 = 0, pontos2 = 0;

void setup() {
  size(800, 600);
  //frameRate(300);
}
void draw() {
  if (pontos1==10 || pontos2==10) {
    gameOver();
  } else {
    s = pontos1 + " x " + pontos2;
    background(0);
    textSize(32);
    text(s, 360,30);    
    
    fill(255,0,0);
    stroke(126);
    line(400, 0, 400, 600);
    println(pontos1, pontos2);
    ellipse(bolaX, bolaY, 20, 20);
    bolaX+=dX;
    bolaY+=dY;  
    if (bolaY >= height -10 || bolaY <= 10 ) {
      dY = -dY;
    }
    if (bolaX <= 10) {
      dX = -dX;
    }


    if (bolaX <= 30) {
      if (bolaY>bastao1Y && bolaY<bastao1Y+100) {
        println("Bateu");
        dX = -dX;
      } else if (bolaX <=10)
      {
        println("Ponto do player 2");
        pontos2+=1;
        bolaX = 400;
        bolaY = 15;
      }
    }

    if (bolaX >= 770) {
      if (bolaY>bastao2Y && bolaY<bastao2Y+100) {
        println("Bateu");
        dX = -dX;
      } else if (bolaX >=790)
      {
        println("Ponto do player 1");
        pontos1+=1;
        bolaX = 400;
        bolaY = 15;
        dX = -dX;
        dY = -dY;
      }
    }

    rect(10, bastao1Y, 20, 100);
    if (keyPressed) {
      if (key == 'w' && bastao1Y>=0) {
        bastao1Y= bastao1Y-7;
      }
      if (key == 's' && bastao1Y<=500) {
        bastao1Y= bastao1Y+7;
      }
    }

    rect(770, bastao2Y, 20, 100);
    if (keyPressed) {
      if (keyCode== DOWN && bastao2Y<=500) {
        bastao2Y= bastao2Y+7;
      }
      if (keyCode== UP && bastao2Y>=0) {
        bastao2Y= bastao2Y-7;
      }
    }
  }
}


void gameOver() {
  if (pontos1 > pontos2) {
    background(0);
    textSize(32);
    text("PARABÉNS JOGADOR 1!!!", 200, 200);
  } else
  {
    background(0);
    textSize(32);
    text("PARABÉNS JOGADOR 2!!!", 200, 200);
  }
}
