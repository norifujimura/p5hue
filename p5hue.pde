//Noriyuki Fujimura, nori_fujimura@me.com www.norifujimura.com
//Jan 20th 2014
//HueHub and HueLight class is from 
//https://github.com/jvandewiel/hue

private static final String KEY = "newdeveloper"; // "secret" key/hash
private static final String IP = "10.0.1.10"; // ip address of the hub
HUE[] HUEs;
int HUEsNum=6;

void setup() {
  size(HUEsNum*105+5,310);

    colorMode( HSB, 360, 255, 255);
    ellipseMode(RADIUS);

  HUEs=new HUE[HUEsNum+1];
  for (int i=1;i<HUEsNum+1;i++) {
    HUEs[i]=new HUE(KEY,IP,i, (i-1)*105+5, 5);
  }
}

void draw() {
  noStroke();
  background(127); 
  for (int i =1;i<HUEs.length; i++) {
    HUEs[i].draw();
  }
}

private void set(int id,int hue, int sat, int bri, int time) {
  HUEs[id].set(hue, sat, bri,time);
}

void mouseDragged() {
   for (int i =1;i<HUEs.length; i++) {
     if(HUEs[i].x<mouseX && mouseX<(HUEs[i].x+HUEs[i].w)){
       if(HUEs[i].y<mouseY && mouseY<(HUEs[i].y+HUEs[i].h)){
         HUEs[i].onMouseDrag(mouseX-HUEs[i].x,mouseY-HUEs[i].y);
       }
     }
  }
}


