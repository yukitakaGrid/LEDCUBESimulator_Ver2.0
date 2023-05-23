//LEDCUBEのアニメーション制御プログラム

import controlP5.*;
import java.math.BigInteger;
import processing.serial.*;
import com.leapmotion.leap.*;               // LeapJava ライブラリを使う

//LEDCUBEのサイズを定義
final int GRID_ROW_MAX_NUM = 5;
final int GRID_COL_MAX_NUM = 5;
final int GRID_DEPTH_MAX_NUM = 5;
//LEDCUBEのシリアル通信の1フレームあたりの送信回数
final int TRANSMISSION_PER_FRAME = GRID_ROW_MAX_NUM;
final float SPHERE_RADIUS = 10.0f;
final int LED_RED = 100;
final int LED_BLUE = 100;
final int LED_GREEN = 240;
final int LED_ALPHA = 100;
final float LED_SIZE = 100.0f;

AnimationSystem as = new AnimationSystem();
AnimationData data;

public LEDCUBE cube;
int[][][] frameBuffer;
String[] frameBufferBytes;

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

String activeName = "ProcedualSetup";

Serial serialPort;

com.leapmotion.leap.Controller leap = new com.leapmotion.leap.Controller();
InteractionBox iBox;   

void setup(){
    size(1000, 1000, P3D);
    frameRate(10);

    //initButton();

    frameBuffer = new int[GRID_ROW_MAX_NUM][GRID_COL_MAX_NUM][GRID_DEPTH_MAX_NUM];
    frameBufferBytes = new String[TRANSMISSION_PER_FRAME];
    PVector pos = new PVector(width/2-200.0f, height/2-250.0f, -200.0f);
    as.LEDCUBEGenerator(pos);

    data = new AnimationData();
}

void draw(){
    background(40);

    as.play();
    //displayTitleText();
    displayFrameBufferBytes();

    printLedCube(frameBufferBytes);
}

void chaosBoundButton(){
    activeName = "ChaosBound";
    as.chaosBound = new ChaosBound();
    println(activeName);
}

void fountainButton(){
    activeName = "Fountain";
    as.fountain = new Fountain();
    println(activeName);
}

void snakeButton(){
    activeName = "Snake";
    as.snake = new Snake();
    println(activeName);
}

void laserButton(){
    activeName = "Laser";
    as.laser = new Laser();
    println(activeName);
}

void gridButton(){
    activeName = "Grid";
    as.grid = new Grid();
    println(activeName);
}

void shootingStarButton(){
    activeName = "ShootingStar";
    as.shootingStar = new ShootingStar();
    println(activeName);
}

void digitalRainButton(){
    activeName = "DigitalRain";
    as.digitalRain = new DigitalRain();
    println(activeName);
}

void spiderwebButton(){
    activeName = "Spiderweb";
    as.spiderweb = new Spiderweb();
    println(activeName);
}

void displayTitleText(){
    fill(255);
    textSize(70);
    textAlign(CENTER, CENTER);
    text(activeName, width/2.0f, height-height/10.0f);
}

void initButton(){
    cp5 = new ControlP5(this);

    // デプスバッファを無効化 (2D描画の準備)
    hint(DISABLE_DEPTH_TEST);

    // 2D座標系に変換
    pushMatrix();
    resetMatrix();
    
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

    // 座標系を復元し、デプスバッファを有効化
    popMatrix();
    hint(ENABLE_DEPTH_TEST);
}

//frameBufferBytesを文字列としてコンソールに表示させるメソッド
void displayFrameBufferBytes(){
    String frameBufferBytesString = "##############\n";
    for(int i = 0; i < GRID_ROW_MAX_NUM; i++){
        frameBufferBytesString += frameBufferBytes[i] + "\n";
    }
    frameBufferBytesString += "##############\n";
    println(frameBufferBytesString);
}

void printLedCube(String[] stringPattern){
    int[] pattern = new int[TRANSMISSION_PER_FRAME];
    for(int i = 0; i < TRANSMISSION_PER_FRAME; i++){
        long hexToInt = Long.parseLong(stringPattern[i], 16); // 16を指定して16進数として解釈する
        println(hexToInt); // 10進数の数値が出力されます
    }
}

