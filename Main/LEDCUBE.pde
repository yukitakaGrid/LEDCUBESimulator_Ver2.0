public class LEDCUBE{
    private PVector position;
    private PVector size;

    private LED[][][] leds;

    LEDCUBE(PVector position){
        this.position = position;

        initLED();
        //個々のLEDのサイズからLEDCUBEのサイズを計算する
        float sizeW = LED_SIZE * GRID_ROW_MAX_NUM;
        float sizeH = LED_SIZE * GRID_COL_MAX_NUM;
        float sizeD = LED_SIZE * GRID_DEPTH_MAX_NUM;
        size = new PVector(sizeW, sizeH, sizeD);
    }

    public PVector getPosition(){
        return position;
    }

    public PVector getSize(){
        return size;
    }

    public void writeFrameBufferToLED(){
        //frameBufferの状態をLEDに反映させる
        for(int i = 0; i < GRID_ROW_MAX_NUM; i++){
            for(int j = 0; j < GRID_COL_MAX_NUM; j++){
                for(int k = 0; k < GRID_DEPTH_MAX_NUM; k++){
                    leds[i][j][k].setLedState(frameBuffer[i][j][k]);
                }
            }
        }
    }

    private void initLED(){
        leds = new LED[GRID_ROW_MAX_NUM][GRID_COL_MAX_NUM][GRID_DEPTH_MAX_NUM];
        for(int i = 0; i < GRID_ROW_MAX_NUM; i++){
            for(int j = 0; j < GRID_COL_MAX_NUM; j++){
                for(int k = 0; k < GRID_DEPTH_MAX_NUM; k++){
                    int[] index = {i, j, k};
                    PVector ledPosition = new PVector(position.x + LED_SIZE * i, position.y + LED_SIZE * j, position.z + LED_SIZE * k);
                    leds[i][j][k] = new LED(ledPosition, index);
                }
            }
        }
    }

    public void render(){
        for(int i = 0; i < GRID_ROW_MAX_NUM; i++){
            for(int j = 0; j < GRID_COL_MAX_NUM; j++){
                for(int k = 0; k < GRID_DEPTH_MAX_NUM; k++){
                    leds[i][j][k].render();
                }
            }
        }
    }

    public void clearPreviosFrameBuffer(){
        for(int i = 0; i < GRID_ROW_MAX_NUM; i++){
            for(int j = 0; j < GRID_COL_MAX_NUM; j++){
                for(int k = 0; k < GRID_DEPTH_MAX_NUM; k++){
                    frameBuffer[i][j][k] = 0;
                    leds[i][j][k].ledState = 0;
                }
            }
        }
    }

    //3次元のLED配列の状態をエンコードする
    private void convertFrameBufferToBytes(){
        for(int i = 0; i < GRID_ROW_MAX_NUM; i++){
            for(int j = 0; j < GRID_COL_MAX_NUM; j++){
                for(int k = 0; k < GRID_DEPTH_MAX_NUM; k++){
                    if(leds[i][j][k].getLedState() == 1){
                        frameBufferBytes[i * GRID_COL_MAX_NUM + j] |= (1 << k);
                    }
                }
            }
        }
    }
}

