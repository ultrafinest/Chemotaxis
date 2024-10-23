Bacteria[] colony = new Bacteria[1];
int tracker = 0;
void setup()
{
  size(400, 400);
  background((int)(Math.random()*255), 0, (int)(Math.random()*255));
  for(int i = 0; i < colony.length; i++){
    colony[i] = new Bacteria();
  }
}

void draw(){
  for(int i = 0; i < colony.length; i++){
    colony[i].show();
    if(colony[i].bacX >= 190)
      colony[i].bacX = colony[i].bacX - (int)(Math.random()*4);
    if(colony[i].bacY >= 190)
      colony[i].bacY = colony[i].bacY - (int)(Math.random()*4);
    colony[i].walk(i);
    if(tracker < 255){
        colony[i].bacSize -= 0.05;
        tracker += 3;
     }
     if(tracker >= 255){
        colony[i].bacX = mouseX;
        colony[i].bacY = mouseY;
        colony[i].bacColor = (int)(Math.random()*255);
        colony[i].bacSize += 2;
     }
     if(colony[i].bacSize >= 50){
       tracker = 0;
     }
  }
}

void mouseClicked(){
  background((int)(Math.random()*255), 0, (int)(Math.random()*255));
  draw();
}
class Bacteria
{
  int bacX;
  int bacY;
  int bacSize;
  int bacColor;
  Bacteria(){
    bacColor = color(0, 0, 0);
    bacX = (int)(Math.random() * 400);
    bacY = (int)(Math.random() * 400);
    bacSize = 50;
  }
  void show(){
    fill((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    ellipse(bacX, bacY, bacSize, bacSize);
  }
  void walk(int moveTendency){
    bacX = bacX + (int)(Math.random()*4) - moveTendency;
    bacY = bacY + (int)(Math.random()*4) - moveTendency;
  }
}
