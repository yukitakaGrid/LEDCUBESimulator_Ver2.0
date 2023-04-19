//LEDCUBEのアニメーション制御プログラム

import controlP5.*;

//LEDCUBEのサイズを定義
final int GRID_ROW_MAX_NUM = 5;
final int GRID_COL_MAX_NUM = 5;
final int GRID_DEPTH_MAX_NUM = 5;
//LEDCUBEのシリアル通信の1フレームあたりの送信回数
final int TRANSMISSION_PER_FRAME = GRID_ROW_MAX_NUM * GRID_COL_MAX_NUM;
private final float SPHERE_RADIUS = 10;
private final int LED_RED = 100;
private final int LED_BLUE = 100;
private final int LED_GREEN = 240;
private final int LED_ALPHA = 100;
private final float LED_SIZE = 100;

AnimationSystem as = new AnimationSystem();
PhysicsSystem phySystem = new PhysicsSystem();

public LEDCUBE cube;
int[][][] frameBuffer;
byte[] frameBufferBytes;

//GUIの設定
ControlP5 cp5;
Button chaosBoundButton;
Button fountainButton;
Button snakeButton;
Button laserButton;
Button gridButton;
Button shootingStarButton;
Button digitalRainButton;
Button spiderwebButton;

String activeName = "Default";
byte[] frameBufferBytes = new byte[TRANSMISSION_PER_FRAME];

void setup(){
    size(1000, 1000, P3D);
    frameRate(60);

    initButton();

    initFrameBuffer = new int[GRID_ROW_MAX_NUM][GRID_COL_MAX_NUM][GRID_DEPTH_MAX_NUM];
    frameBufferBytes = new byte[TRANSMISSION_PER_FRAME];
    PVector pos = new PVector(width/2-200, height/2-250, -200);
    as.LEDCUBEGenerator(pos, GRID_ROW_MAX_NUM, GRID_COL_MAX_NUM, GRID_DEPTH_MAX_NUM);
}

void draw(){
    background(40);

    displayTitleText();
    as.setActiveName(activeName);
    as.play();
    cube
    displayFrameBufferBytes();
}

void chaosBoundButton(){
    activeName = "ChaosBound";
    println(activeName);
}

void fountainButton(){
    activeName = "Fountain";
    println(activeName);
}

void snakeButton(){
    activeName = "Snake";
    println(activeName);
}

void laserButton(){
    activeName = "Laser";
    println(activeName);
}

void gridButton(){
    activeName = "Grid";
    println(activeName);
}

void shootingStarButton(){
    activeName = "ShootingStar";
    println(activeName);
}

void digitalRainButton(){
    activeName = "DigitalRain";
    println(activeName);
}

void spiderwebButton(){
    activeName = "Spiderweb";
    println(activeName);
}

void displayTitleText(){
    fill(255);
    textSize(70);
    textAlign(CENTER, CENTER);
    text(activeName, width/2, height-height/10);
}

void initButton(){
    cp5 = new ControlP5(this);
    cp5.addButton("chaosBoundButton")
        .setPosition(10, 10)
        .setSize(100, 20)
        .setLabel("ChaosBound");
    cp5.addButton("fountainButton")
        .setPosition(10, 40)
        .setSize(100, 20)
        .setLabel("Fountain");
    cp5.addButton("snakeButton")
        .setPosition(10, 70)
        .setSize(100, 20)
        .setLabel("Snake");
    cp5.addButton("laserButton")
        .setPosition(10, 100)
        .setSize(100, 20)
        .setLabel("Laser");
    cp5.addButton("gridButton")
        .setPosition(10, 130)
        .setSize(100, 20)
        .setLabel("Grid");
    cp5.addButton("shootingStarButton")
        .setPosition(10, 160)
        .setSize(100, 20)
        .setLabel("ShootingStar");
    cp5.addButton("digitalRainButton")
        .setPosition(10, 190)
        .setSize(100, 20)
        .setLabel("DigitalRain");
    cp5.addButton("spiderwebButton")
        .setPosition(10, 220)
        .setSize(100, 20)
        .setLabel("Spiderweb");
}

//frameBufferBytesを文字列としてコンソールに表示させるメソッド
void displayFrameBufferBytes(){
    String frameBufferBytesString = "##############\r\n";
    for(int i = 0; i < GRID_ROW_MAX_NUM; i++){
        for(int j = 0; j < GRID_COL_MAX_NUM; j++){
            frameBufferBytesString += frameBufferBytes[i*GRID_COL_MAX_NUM + j] + "\r\n";
        }
        frameBufferBytesString += "\r\n\r\n\r\n";
    }
    frameBufferBytesString = "##############\r\n";
    println(frameBufferBytesString);
}

