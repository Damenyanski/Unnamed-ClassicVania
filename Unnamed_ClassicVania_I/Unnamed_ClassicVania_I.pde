//Unnamed ClassicVania

//global VAR
float PlayerHealth = 20;
float PlayerArmour = 70;
float EnemyHealth = 20;
float EnemyArmour = 70;
//
boolean PlayerHit;
boolean PlayerMiss;
boolean PlayerCrit;
boolean EnemyHit;
boolean EnemyMiss;
boolean EnemyCrit;
boolean PlayerTurn;
boolean EnemyTurn;

PImage [] RImageMvm;
PImage [] LImageMvm;
PImage [] RImageAtk;
PImage [] LImageAtk;
PImage [] RImageJmp;
PImage [] LImageJmp;
//
boolean Pause;
boolean Play;
//
float appWidth;
float appHeight;
float PaperWidth;
float PaperHeight;
int step;
//
int PlayerX = 0;
int PlayerY = 0;
//
int EnemyX;
int EnemyY;
//
//
boolean Pright=true;
boolean Pleft;
boolean Eright;
boolean Eleft=true;
//
float TextDivX=0*appWidth/PaperWidth;
float TextDivY=0*appHeight/PaperHeight;
float TextDivWidth=63.5*appWidth/PaperWidth;
float TextDivHeight=215.5*appHeight/PaperHeight;
//
PImage ImageI;
PImage ImageII;
PImage ImageIII;
PImage ImageIV;
PImage ImageV;
PImage ImageVI;
//
String[] fontList;
float fontSize;
PFont Parchment;
color blackInk = #000000;
color whiteInk = #FFFFFF;
color resetInk = whiteInk;

int PlayerRollValue;

void setup() {
  RImageMvm = new int[2];
  LImageMvm = new int[2];
  RImageAtk = new int[2];
  LImageAtk = new int[2];
  RImageJmp = new int[0];
  LImageJmp = new int[0];
  fullScreen();
  frameRate(12);
  EnemyX = 20;
  EnemyY = 11;
  if (frameCount == 1) {
    println("Start of Console");
    fontList =PFont.list();
    printArray(fontList);
    fontSize = 40;
    PFont parchment = createFont("Parchment", fontSize);
    blackInk = #000000;
    textFont(parchment, fontSize);
    color whiteInk = #FFFFFF;
    resetInk = whiteInk;
  }
  rect(TextDivX, TextDivY, TextDivWidth, TextDivHeight);
  fill(255, 255, 255);
  fontSize = 40;
  PFont parchment = createFont("Parchment", fontSize);
  blackInk = #000000;
  textFont(parchment, fontSize);
  color whiteInk = #FFFFFF;
  resetInk = whiteInk;
  //String UnnamedTacticalGameCode = "Unnamed_Tactical_Game_Code_Proper";
  String UpArrow = "..";
  String ImagesFolder = "Image";
  String ImageNameI = "Unnamed ClassicVania Sprite I (Right)";
  String ImageNameII = "Unnamed ClassicVania Sprite II (Right)";
  String ImageNameIII = "Unnamed ClassicVania Sprite III (Right)";
  String ImageNameIV = "Unnamed ClassicVania Sprite I (Left)";
  String ImageNameV = "Unnamed ClassicVania Sprite II (Left)";
  String ImageNameVI = "Unnamed ClassicVania Sprite III (Left)";
  String FEImage = ".png";
  String open = "/";
  String ImageDirectory = UpArrow+open+ImagesFolder;
  String IpathwayI = ImageDirectory + open + ImageNameI + FEImage;
  String IpathwayII = ImageDirectory + open + ImageNameII + FEImage;
  String IpathwayIII = ImageDirectory + open + ImageNameIII + FEImage;
  String IpathwayIV = ImageDirectory + open + ImageNameIV + FEImage;
  String IpathwayV = ImageDirectory + open + ImageNameV + FEImage;
  String IpathwayVI = ImageDirectory + open + ImageNameVI + FEImage;
  background(255);
  ImageI = loadImage(IpathwayI);
  ImageII = loadImage(IpathwayII);
  ImageIII = loadImage(IpathwayIII);
  ImageIV = loadImage(IpathwayIV);
  ImageV = loadImage(IpathwayV);
  ImageVI = loadImage(IpathwayVI);
  PaperWidth = 279;
  PaperHeight = 215.5;
  appWidth = displayWidth;
  appHeight = displayHeight;
  TextDivX = 0 * appWidth/PaperWidth;
  TextDivY = 0 * appHeight/PaperHeight;
  TextDivWidth = 63.5 * appWidth/PaperWidth;
  TextDivHeight = 215.5 * appHeight/PaperHeight;
  step = 128;
}
void draw() {
  image(ImageI, PlayerX, PlayerY, step, step);
}
void keyPressed() {
  if (key==CODED) {
    if (keyCode == RIGHT) {
      PlayerX=PlayerX+step/6-3;
    }
  }
  if (key==CODED) {
    if (keyCode == LEFT) {
      Pleft=true;
      PlayerX=PlayerX-step/6+3;
    }
  }
}
void keyReleased() {
  if (key == 'z'|| key == 'Z') {
    println("Player Health:", PlayerHealth);
    println("Enemy Health:", EnemyHealth);
    PlayerRollValue = floor(random(1, 100));
    if (PlayerRollValue >= EnemyArmour && PlayerRollValue <95 && EnemyHealth>0) {
      EnemyHealth=EnemyHealth - floor(random(1, 4));
      println("Player Hit");
      //playsound.play();
      PlayerHit = true;
      PlayerMiss = false;
      PlayerCrit = false;
    }
    if (PlayerRollValue >= 95 && EnemyHealth>0) {
      text("Player Turn", TextDivX, TextDivY+70, TextDivWidth, TextDivHeight);
      EnemyHealth=EnemyHealth-floor(random(1, 4)*2);
      println("Player Crit");
      //playsound.play();
      PlayerCrit = true;
      PlayerMiss = false;
      PlayerHit = false;
    }

    if (PlayerRollValue < EnemyArmour) {
      text("Player Turn", TextDivX, TextDivY+70, TextDivWidth, TextDivHeight);
      EnemyHealth=EnemyHealth;
      println("Player Miss");
      PlayerMiss = true;
      PlayerHit = false;
      PlayerCrit = false;
    }
  }
}
