import ddf.minim.*;
import ddf.minim.analysis.*;
 
Minim minim;
//AudioPlayer player;
AudioMetaData[count]meta;
BeatDetect beat;
int  r = 225;
float rad = 170;
boolean mode = true;
boolean meme = false;
FFT fft; 
int bufferSize = 8; 
int fftSize = floor(bufferSize*.9)+1; 
AudioPlayer[] player = new AudioPlayer[4]; 
int count = 0;
void setup()
{
  size(displayWidth, displayHeight);
  beat = new BeatDetect();
  //player[count].play();
  //fft=new FFT(player[count].bufferSize(), player[count].sampleRate()); 

  minim = new Minim(this); 
  player[0] = minim.loadFile("4U.mp3"); 
  player[1] = minim.loadFile("ADawn.mp3"); 
  player[2] = minim.loadFile("TakeOff.mp3"); 
  player[3] = minim.loadFile("TrapKing.mp3"); 


  player[count].play(); 

  fft=new FFT(player[count].bufferSize(), player[count].sampleRate()); 
} 

void draw() 
{ 
  if(!player[count].isPlaying()) 
  { 
    count++; 
    if(count>3)count=0; 
    player[count].play();    
  } 
    
  fft.forward(player[count].mix); 
  /*background(255); 

  for (int i = 0; i < fftSize; i++) 
  { 
    float band = fft.getBand(i); 
    float control,afactor=10; 
    control=band*afactor; 
    if(control>1023)control=1023; 
      }  */
    
    if(mouseX> -583 && mouseX< - 566 && mouseY> -275 && mouseY< -255){
   meme = true;
   }
  
   if (mousePressed == true && meme == true){
 {
   println("meme00");
    if ( !player[count].isPlaying() )
  {
    player[count].pause();
    mode = false;
  } else
  {
    player[count].play();
    mode = true;
  }
  }
   }
  
  
  
  beat.detect(player[count].mix);
  fill(#5b849f, 20);
  noStroke();
  rect(0, 0, width, height);
  translate(width/2, height/2);
  noFill();
  fill(#9b2c42);
  if (beat.isOnset()) rad = rad*0.9;
  else rad = 70;
  ellipse(0, 0, 2*rad, 2*rad);
  stroke(-100, 50);
  strokeWeight(20);
  int bsize = player[count].bufferSize();

  rotate(PI/2);
  beginShape();
  //noFill();
  stroke(-100, 50);
  for (int i = 0; i < bsize; i+=30)
  {
    //float x2 = (r + player.left.get(i)*100)*cos(i*2*PI/bsize);
    //float y2 = (r + player.left.get(i)*100)*sin(i*2*PI/bsize);
    //float x3 = (r + player.left.get(i)*100)*cos(i*PI/bsize);
    //float y3 = (r + player.left.get(i)*100)*sin(i*PI/bsize);
    //float x4 = (-r + player.left.get(i)*100)*cos(i*PI/bsize);
    //float y4 = (-r + player.left.get(i)*100)*sin(i*PI/bsize);
    float x5 = (r + player[count].left.get(i)*100)*cos(i*PI/bsize);
    float y5 = (r + player[count].left.get(i)*100)*sin(i*PI/bsize);
    fill(-100, 50);
    stroke(-100, 50);
    //vertex(x2, y2);
    // GOOD ONE vertex(x3, y3);
    
    vertex(y5,x5);
    //stroke(-1);
    stroke(#9b2c42);
    strokeWeight(20);
    //stroke(-100, 50);
    //point(x2, y2);
    //stroke(#9b2c42);
    //point(y4, x4);
    //vertex(y4, x4);
  }
  endShape();
  
  
  beginShape();
  //noFill();
  stroke(-100, 50);
  for (int i = 0; i < bsize; i+=30)
  {
    //float x2 = (r + player.left.get(i)*100)*cos(i*2*PI/bsize);
    //float y2 = (r + player.left.get(i)*100)*sin(i*2*PI/bsize);
    //float x3 = (r + player.left.get(i)*100)*cos(i*PI/bsize);
    //float y3 = (r + player.left.get(i)*100)*sin(i*PI/bsize);
    float x4 = (-r + player[count].left.get(i)*100)*cos(i*PI/bsize);
    float y4 = (-r + player[count].left.get(i)*100)*sin(i*PI/bsize);
    //float x5 = (r + player.left.get(i)*100)*cos(i*PI/bsize);
    //float y5 = (r + player.left.get(i)*100)*sin(i*PI/bsize);
    //fill(-100, 50);
    noFill();
    stroke(-100, 50);
    //vertex(x2, y2);
    // GOOD ONE vertex(x3, y3);
    
    //vertex(y5,x5);
    //stroke(-1);
    stroke(#9b2c42);
    strokeWeight(20);
    //stroke(-100, 50);
    //point(x2, y2);
    //stroke(#9b2c42);
    //point(y4, x4);
    vertex(y4, x4);
  }
  endShape();
  
  
  rotate(-PI/2);
  
   boolean flag =true;
   //if (flag) showMeta();
   
    strokeWeight(0);
    fill(-100, 50);
    stroke(-100, 50);
    if (mode == false)
    {
      triangle(-260, -220, -260, -190, -230, -205);
      
    }

    if (mode == true)
    {
      
      //pause
      rect(-573, -275, 7, 20);
      rect(-583, -275, 7, 20);
      //forward
      triangle(-553, -275, -553, -255, -533, -265);
      rect(-533, -275, 3, 20);
      //back
      triangle(-596, -275, -596, -255, -616, -265);
      rect(-619, -275, 3, 20);
    }

} 

/*void showMeta() {
  int time =  meta.length();
  textSize(50);
  textAlign(CENTER);
  text( (int)(time/1000-millis()/1000)/60 + ":"+ (time/1000-millis()/1000)%60, -575, -300);
}*/

/*void stop() 
{ 
  //player.close(); 
  //minim.stop(); 
 // super.stop(); 
}   */ 