public class AnimationSystem{
    private boolean isCurrentProcedualAnimation; //これはおそらく使わない

    //アニメーションオブジェクトのインスタンス化
    public ProcedualSetup procedualSetup;
    public ChaosBound chaosBound;
    public Fountain fountain;
    public Snake snake;
    public Laser laser;
    public Grid grid;
    public ShootingStar shootingStar;
    public DigitalRain digitalRain;
    public Spiderweb spiderweb;

    private int choice;
    private float time;

    AnimationSystem(){
        isCurrentProcedualAnimation = false;
        choice = 1;
        time = -200;
    }

    public void LEDCUBEGenerator(PVector position){
        cube = new LEDCUBE(position);
        cube.initFrameBuffer();
        cube.writeFrameBufferToLED();

        //cubeのバッファが作成されたので、アニメーションオブジェクトのインスタンス化をしてバッファの共有をする
        procedualSetup = new ProcedualSetup();

        chaosBound = new ChaosBound();
        fountain = new Fountain();
        snake = new Snake();
        laser = new Laser();
        grid = new Grid();
        shootingStar = new ShootingStar();
        digitalRain = new DigitalRain();
        spiderweb = new Spiderweb();
    }

    public void play(){
        cube.clearPreviosFrameBuffer();
        //アニメーションが設定されていない場合は何もしない
        if(activeName == "Default"){
            cube.render();
            return;
        }

        this.choice = leapmotionLevel();

        /*if(choice==1){
            println("チョキを認識しました");
            timeline();
        }

        else if(choice==0){
            println("グーを認識しました。");
            activeName="Spiderweb";
        }

        else if(choice==2){
            println("パーを認識しました。");

            if(activeName=="Spiderweb" && spiderweb.getAnimationCurrentNum()==0){
                spiderweb.clearSpiderweb();
                spiderweb.setAnimationCurrentNum(1);   
            }
        }*/

        //LeapMotionなしの場合の処理
        //animator();
        timeline();

        //フレームバッファをLEDに書き込む
        cube.writeFrameBufferToLED();

        cube.render();
        cube.convertFrameBufferToBytes();
    }

    private void animator(){
        if(activeName == "ProcedualSetup"){
            if(procedualSetup.getCurrentAnimNum() == 0){
                procedualSetup.animator1();
            }
            else if(procedualSetup.getCurrentAnimNum() == 1){
                procedualSetup.animator2();
            }
        }
        else if(activeName == "ChaosBound"){
            chaosBound.animator1();
            isCurrentProcedualAnimation = chaosBound.isPhysicAnimation();
        }
        else if(activeName == "Fountain"){
            fountain.animator1();
            isCurrentProcedualAnimation = fountain.isPhysicAnimation();
        }
        else if(activeName == "Snake"){
            snake.animator1();
            isCurrentProcedualAnimation = snake.isPhysicAnimation();
        }
        else if(activeName == "Laser"){
            laser.animator1();
            isCurrentProcedualAnimation = laser.isPhysicAnimation();
        }
        else if(activeName == "Grid"){
            grid.animator1();
            isCurrentProcedualAnimation = grid.isPhysicAnimation();
        }
        else if(activeName == "ShootingStar"){
            shootingStar.animator1();
            isCurrentProcedualAnimation = shootingStar.isPhysicAnimation();
        }
        else if(activeName == "DigitalRain"){
            digitalRain.animator1();
            isCurrentProcedualAnimation = digitalRain.isPhysicAnimation();
        }
        else if(activeName == "Spiderweb"){
            if(spiderweb.getAnimationCurrentNum()==0)
                spiderweb.animator1();
            else if(spiderweb.getAnimationCurrentNum()==1)
                spiderweb.animator2();
            isCurrentProcedualAnimation = spiderweb.isPhysicAnimation();
        }
    }

    private void timeline(){
        if(-200<=time&&time<0){
            if(procedualSetup.getCurrentAnimNum() == 0){
                procedualSetup.animator1();
            }
            else if(procedualSetup.getCurrentAnimNum() == 1){
                procedualSetup.animator2();
            }
        }
        if(0<=time&&time<50)
            laser.animator1();
        if(50<=time&&time<60){
            data.laserBeam();
        }
        if(60<=time&&time<100)
            laser.animator1();
        if(100<=time&&time<110){
            if(time==100)
                data.setLaserBeamFrameCount(0);
            data.laserBeam();
        }
        if(110<=time&&time<120){
            if(time==110)
                data.setLaserBeamFrameCount(0);
            data.laserBeam();
        }
        if(170<=time&&time<180){
            if(time==170)
                data.setLaserBeamFrameCount(0);
            data.laserBeam();
        }
        if(200<=time&&time<210){
            if(time==200)
                data.setLaserBeamFrameCount(0);
            data.laserBeam();
        }
        if(120<=time&&time<230){
            if(time==120)
                laser = new Laser();
            laser.animator1();
        }
        if(230<=time&&time<255){
            data.transform();
        }
        if(255<=time&&time<500){
            snake.animator1();
        }
        if(300<=time&&time<320){
            if(time==320)
                laser = new Laser();
            laser.animator1();
        }
        if(350<=time&&time<360){
            if(time==370)
                laser = new Laser();
            laser.animator1();
        }
        if(400<=time&&time<420){
            if(time==400)
                laser = new Laser();
            laser.animator1();
        }
        if(460<=time&&time<660){
            digitalRain.animator1();
        }
        if(660<=time&&time<692){
            data.tetris();
        }
        if(692<=time&&time<750){
            chaosBound.animator1();
        }
        if(750<=time&&time<800){
            grid.animator1();
        }
        if(780<=time&&time<800){
            if(time==780)
                laser = new Laser();
            laser.animator1();
        }
        if(800<=time&&time<840){
            if(time==800)
                fountain = new Fountain();
            fountain.animator1();
        }
        if(840<=time&&time<860){
            if(time==840)
                data.setHanabiFrameCount(0);
            data.hanabi();
        }
        if(860<=time&&time<880){
            if(time==860)
                laser = new Laser();
            laser.animator1();
        }
        if(880<=time&&time<1700){
            if(time==880)
                shootingStar = new ShootingStar();
            shootingStar.animator1();
        }

        //data.hanabi();
        //data.tetris();
        //data.laserBeam();
        //data.transform();

        time++;
        if(time==1700){
            time=0;
        }
    }
    
    // 指先を描画する drawFingerTip 関数（Hand オブジェクトを引数に取る）
    void drawFingerTip(Hand hand) {
    FingerList fingers = hand.fingers();        // FingerList オブジェクトに見つかった指の情報（複数）を入れる
    for(int i = 0; i < fingers.count(); i++) {  // 見つかった全ての指について
        Finger finger = fingers.get(i);           // 指 i を取得（0:親指, 1:人差し指, 2:中指, 3:薬指, 4:小指）
        Vector tipPos = finger.tipPosition();     // その指の指先（tip）の位置を取得
        Vector tipPosNorm = iBox.normalizePoint(tipPos, false);   // 標準化された座標値に変換
        if(finger.isExtended() == true) {         // その指が伸びて（isExtended）いたら
        fill(255, 0, 0);                        // 塗りつぶし色を赤に
        } else {                                  // そうでなければ（伸びていなければ）
        fill(255, 255, 255);                    // 塗りつぶし色を白に
        }
        pushMatrix();                           // 描画座標の変換開始
        translate(tipPosNorm.getX() * width,  // 標準化された座標値にウィンドウの幅を掛けて画面内の座標に変換
                    (1 - tipPosNorm.getY()) * height,   // ウィンドウの高さを掛けて画面内の座標に変換
                    tipPosNorm.getZ() * 50);    // Z軸（奥行方向）は適当に 50 を掛けた
        noStroke();                           // 線は描かない
        lights();                             // 3D シーン内に照明を置く
        sphere(20);                           // 球を描く
        popMatrix();                            // 描画座標の変換終了
    }
    }
    
    // ★ じゃんけんの手を認識する getChoice 関数（Hand オブジェクトを取り、整数を返す）
    int getChoice(Hand hand) {
    FingerList fingers = hand.fingers();      // FingerList オブジェクトに見つかった指の情報（複数）を入れる
    int extendedFingers = 0;                  // 伸びている指の数をカウントする変数
    for(int i = 0; i < fingers.count(); i++) {    // 見つかった全ての指について
        Finger finger = fingers.get(i);         // 指 i を取得（0:親指, 1:人差し指, 2:中指, 3:薬指, 4:小指）
        if(finger.isExtended() == true) {       // その指が伸びて（isExtended）いたら
        extendedFingers += 1;                 // 伸びている指の数を増やす
        }
    }
    int choice = 0;                           // じゃんけんの手を入れる変数
    if(extendedFingers < 2) {                 // 伸びている指の数が2本未満なら
        choice = 0;                             // 0: Rock（グー）
    } else if(extendedFingers == 2) {         // 伸びている指の数が2本なら
        choice = 1;                             // 1: Scissors（チョキ）
    } else {                                  // それ以外の場合
        choice = 2;                             // 2: Paper（パー）
    }
    String[] choiceName = {"0", "2", "5"};        // じゃんけんの手の名前を定義
    Vector palmPos = hand.palmPosition();                       // 手のひらの位置を取得
    Vector palmPosNorm = iBox.normalizePoint(palmPos, false);   // 標準化された座標値に変換
    fill(255);                                                  // 白く塗りつぶす
    textSize(24);                                               // 文字サイズ
    text(choiceName[choice], palmPosNorm.getX() * width, 60);   // じゃんけんの手を手のひらの位置の上方に表示
    return choice;                            // じゃんけんの手の値（0/1/2）を返す
    }
    
    // ★ じゃんけんの勝敗を判定する judge 関数（対戦している二つの手と、それぞれのじゃんけんの手を引数に取る）
    void judge(HandList hands, int[] choice) {
    textSize(36);                             // 文字サイズ
    if(choice[0] == choice[1]) {              // じゃんけんの手が同じなら（あいこなら）
        fill(255);                              // 白く塗りつぶす
        text("Draw", width / 2, 120);           // Draw と表示
        return;                                 // これ以降は実行せずに関数を抜ける
    }
    Hand winner;                              // 勝者の手の上方を入れる Hand オブジェクト
    if(((choice[0] + 1) % 3) == choice[1]) {  // じゃんけんの勝敗の判定式（詳細は割愛）
        winner = hands.get(0);                  // 勝者は手[0]
    } else {                                  // 判定式が成立しなければ
        winner = hands.get(1);                  // 勝者は手[1]
    }
    Vector winnerPos = winner.palmPosition();         // 勝者の手の手のひらの位置を取得
    Vector winnerPosNorm = iBox.normalizePoint(winnerPos, false);   // 標準化された座標値に変換
    fill(0, 255, 0);                                  // 赤く塗りつぶす
    text("Win!", winnerPosNorm.getX() * width, 120);  // 勝者の手のひらの位置の上方に Win! と表示 
    }

    public int leapmotionLevel(){
        Frame frame = leap.frame();               // Frame オブジェクトを宣言し、leap のフレームを入れる
        HandList hands = frame.hands();           // HandList オブジェクトを宣言し、frame 内の手（複数）の情報を取得
        iBox = frame.interactionBox();            // InteractionBox を初期化
        int choice = 0;    // ★ 出したじゃんけんの手を入れる変数
        for(int i = 0; i < hands.count(); i++) {  // 見つかった全ての手について
            Hand hand = hands.get(i);               // Hand オブジェクトを宣言し、i 番目の手を取得                   // drawFingerTip 関数を呼ぶ
            choice = getChoice(hand);            // ★ getChoice 関数でじゃんけんの手を認識
        }

        return choice;
    }
}