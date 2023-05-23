class ProcedualSetup{
    private int animNum;
    private int currentAnimNum;
    //private long animTime;
    private int animFrame;
    private int animFrameRate1;
    private int animFrameRate2;
    private int outPointFrame;
    private int[][][] animFrameBuffer = new int[GRID_ROW_MAX_NUM][GRID_COL_MAX_NUM][GRID_DEPTH_MAX_NUM];

    private LEDCUBEVector animState1; //アニメーション1のLEDの点灯座標を維持する変数
    private int animState2; //アニメーション2の奇数座標と偶数座標のスイッチ状態を維持する変数

    ProcedualSetup(){
        animNum = 2;
        currentAnimNum = 0;
        //animTime = 0;
        animFrame = 0;
        animFrameRate1 = 1;
        animFrameRate2 = 1;
        outPointFrame = 200;

        animState1 = new LEDCUBEVector(0,0,0);
        animState2 = 0; //0:奇数座標 1:偶数座標
    }

    public int getCurrentAnimNum(){
        return currentAnimNum;
    }

    public void animator1(){
        if(currentAnimNum != 0){
            return;
        }

        int x = animState1.x;
        int y = animState1.y;
        int z = animState1.z;
        //println("x:"+x+" y:"+y+" z:"+z);
        animFrameBuffer[x][y][z] = 1;

        if(animFrame%animFrameRate1 == 0){
            x++;
            if(x>=5){
                x = 0;
                y++;
            }
            if(y>=5){
                y = 0;
                z++;
            }
            if(z>=5){
                z = 0;
                //animator2へ遷移
                currentAnimNum++;
            }
        }
        animState1.setLEDCUBEVector(x,y,z);
        
        //グローバル変数のframebufferにアニメーションの情報を書き込む
        frameBuffer = animFrameBuffer;

        animFrame++;
    }

    public void animator2(){
        if(currentAnimNum != 1){
            return;
        }

        if(animFrame%animFrameRate2 == 0){
            if(animState2 == 0){
                animState2 = 1;
            }else{
                animState2 = 0;
            }
        }

        if(animState2 == 0){
            for(int x=0;x<GRID_ROW_MAX_NUM;x++){
                for(int y=0;y<GRID_COL_MAX_NUM;y++){
                    for(int z=0;z<GRID_DEPTH_MAX_NUM;z++){
                        if(x%2 == 0 && y%2 == 0 && z%2 == 0){
                            animFrameBuffer[x][y][z] = 1;
                        }
                    }
                }
            }
        }

        else if(animState2 == 1){
            for(int x=0;x<GRID_ROW_MAX_NUM;x++){
                for(int y=0;y<GRID_COL_MAX_NUM;y++){
                    for(int z=0;z<GRID_DEPTH_MAX_NUM;z++){
                        if(x%2 == 1 && y%2 == 1 && z%2 == 1){
                            animFrameBuffer[x][y][z] = 1;
                        }
                    }
                }
            }
        }

        if(animFrame>outPointFrame){
            activeName = "Default";
            currentAnimNum = 0;
            animFrame = 0;
        }

        //グローバル変数のframebufferにアニメーションの情報を書き込む
        frameBuffer = animFrameBuffer;

        animFrame++;
    }
}