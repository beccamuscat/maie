/*

Welcome to Group 3's Interactive Poster!

We were inspired by the 'Ordinary Lives of Women' exhibition to put our ordinary mothers on the same pedestal as other famous empowering women, emphasising the ordinary.
The design of the images with the gradient map overlay were also inspired by the same exhibition.


Instructions:
You may click to scroll through images (this will be replaced by the push button sensor)
You may hold down and gradually press each number(1-9) to progressively morph between our mothers and their role models (this will be replaced by the temperature sensor)
You may hold down either 'o' or 'h' to display kinetic text that shows the words 'ordinary' and 'hereos' 

*/





//initializing variables in preparation

PImage jk;
PImage fiona;
PImage karen;
PImage alex; 
PImage debbie;
PImage kate;
PImage maya;
PImage lisa;

int c=4;
boolean clicked = false;
boolean pressed = false;
int num =-1;
int t=0;
int inputs;


//setup

PFont font;
PGraphics pg;

String[] words = {"ordinary", "heroes"};
String input = "";

// Mapping of characters to their corresponding indices
HashMap<Character, Integer> charIndexMap;


void setup(){
  size(400,1000);
  background(252, 209, 116);
  
  //loading the images of mothers 
  
  fiona = loadImage("fiona.png");
  debbie = loadImage("debbie.png");
  karen= loadImage("karen.png");
  lisa = loadImage("lisa.png");
  
  //loading the images of the women
  
  jk = loadImage("jk.png");
  kate = loadImage("kate.png");
  alex = loadImage("alex.png");
  maya = loadImage("maya.png"); 
  
  
  
  //setup kinetic text
   
    font = createFont("RobotoCondensed-Bold.ttf", 100);
  size(400, 1000, P2D);
  pg = createGraphics(400, 1000, P2D);
  
  // Initialize the character-index mapping
  charIndexMap = new HashMap<Character, Integer>();
  
  // Populate the character-index mapping
  for (int i = 0; i < words.length; i++) {
    String word = words[i];
    char firstChar = Character.toLowerCase(word.charAt(0));
    charIndexMap.put(firstChar, i);
  }
}



void draw(){
background(252, 209, 116);
// plot according to amount of times clicked

//calling the pattern method to display mother images
 pattern(c);
  
  //border
  noStroke();
  fill(224, 103, 63,80);
  rect(0,0,75,1000);
  rect(325,0,75,1000);
  
  
//mouse pressed function to enable scrolling 
//instead of this would be the push button sensor 
  if(clicked == true){
    c++;
    if(c==5){
      c=1;
    }
    clicked = false; 
  }

  if(keyPressed == true){
    pressed=true;
    inputs=key-48;
  }
  if(pressed == true){
       opacity(inputs);
  }
  pressed = false;
  

//code for kinetic text
  
   // PGraphics
  pg.beginDraw();
  pg.background(0, 0); // Transparent background
  pg.fill(236, 88, 0); // ORANGE text
  pg.textFont(font);
  pg.textSize(75);
  pg.pushMatrix();
  pg.translate(width/2, height/2-215);
  pg.textAlign(CENTER, CENTER);
  
  // Display the word corresponding to each letter
  for (int i = 0; i < input.length(); i++) {
    char letter = Character.toLowerCase(input.charAt(i));
    if (charIndexMap.containsKey(letter)) {
      int index = charIndexMap.get(letter);
      if (words[index].equals("ordinary")) {
        pg.text(words[index], i * 70, 0);  // Display "ordinary" at the original y-coordinate
      } else if (words[index].equals("heroes")) {
        pg.text(words[index], i * 70, 150);  // Display "heroes" lower by changing the y-coordinate
      }
    }
  }
  
  pg.popMatrix();
  pg.endDraw();

  int tilesX = 16;
  int tilesY = 16;

  int tileW = int(width/tilesX);
  int tileH = int(height/tilesY);

  for (int y = 0; y < tilesY; y++) {
    for (int x = 0; x < tilesX; x++) {

      // WAVE
      float wave = sin(frameCount * 0.05 + (x + y * 0.1) * 0.2);
      int offsetY = int(wave * (tileH * 0.5));

      // SOURCE
      int sx = x*tileW;
      int sy = y*tileH + offsetY;
      int sw = tileW;
      int sh = tileH;

      // DESTINATION
      int dx = x*tileW;
      int dy = y*tileH;
      int dw = tileW;
      int dh = tileH;

      copy(pg, sx, sy, sw, sh, dx, dy, dw, dh);
    }
  }

  
}
  
       
//pattern calculator which takes the click variable as input
  void pattern(int c){
    if(c==4){
      //1st pattern 
        image(fiona,0,0,400,250);//1
        image(debbie,0,228,400,272);//2
        image(karen,-25,500,450,275);//3
        image(lisa,0,750,400,250);//4
    }
    else if(c==1){
        image(lisa,0,0,400,250);
        image(fiona,0,228,400,272);
        image(debbie,0,500,400,275);
        image(karen,-25,750,450,250);
    }else if(c==2){
        image(karen,-25,0,450,250);
        image(lisa,0,228,400,272);
        image(fiona,0,500,400,275);
        image(debbie,0,750,400,250);
    }else if(c==3){
        image(debbie,0,0,400,250);//1
        image(karen,0,228,400,272);//2
        image(lisa,-25,500,450,275);//3
        image(fiona,0,750,400,250);//4
    }
        
    }
    

//pattern calculator for the famous women which takes the click variable as input

void womenPattern(int c,int t){
  tint(255,t);
  if(c==4){
      //1st pattern 
        image(jk,0,0,400,250);//1
        image(kate,0,228,400,272);//2
        image(alex,-25,500,450,275);//3
        image(maya,0,750,400,250);//4
    }
    else if(c==1){
        image(maya,0,0,400,250);
        image(jk,0,228,400,272);
        image(kate,0,500,400,275);
        image(alex,-25,750,450,250);
    }else if(c==2){
        image(alex,-25,0,450,250);
        image(maya,0,228,400,272);
        image(jk,0,500,400,275);
        image(kate,0,750,400,250);
    }else if(c==3){
        image(kate,0,0,400,250);//1
        image(alex,0,228,400,272);//2
        image(maya,-25,500,450,275);//3
        image(jk,0,750,400,250);//4
    }
}
   
//gives the image overlay a different opacity based on the user input 
//runs women pattern based on the same counter used before and with the transparency user input
  void opacity(int num){
    for(int i=0;i<=9;i++){
      t=255;
     
      if(num == i){
        t= num*25;
         womenPattern(c,t); 
      }
      
       if(num == 9){
        t=255;
      t=0;
    }
    
  }
  }
 //changes boolean expression according to mouse input
  void mousePressed(){
    clicked = true;
  }
  
//converts input for the o and h keys  
  void keyPressed() {
  if (key != CODED) {
    input += Character.toLowerCase(key);
  }
}

void keyReleased() {
  if (key != CODED) {
    input = input.substring(0, input.length() - 1);
  }
}
