public class LEDCUBE{
    private PVector position;
    private PVector maxPosition;
    private PVector size;
    private float adjustLedSize;
    private float paddingOffset;

    private LED[][][] leds;

    LEDCUBE(PVector position){
        this.position = position;
        paddingOffset = 20.0f;

        initLED();
        //個々のLEDのサイズからLEDCUBEのサイズを計算する
        float paddingW = (GRID_ROW_MAX_NUM - 1) * paddingOffset;
        float paddingH = (GRID_COL_MAX_NUM - 1) * paddingOffset;
        float paddingD = (GRID_DEPTH_MAX_NUM - 1) * paddingOffset;
        float sizeW = LED_SIZE * GRID_ROW_MAX_NUM;
        float sizeH = LED_SIZE * GRID_COL_MAX_NUM;
        float sizeD = LED_SIZE * GRID_DEPTH_MAX_NUM;
        size = new PVector(sizeW + paddingW, sizeH + paddingH, sizeD + paddingD);
        adjustLedSize = LED_SIZE + paddingOffset;

        maxPosition = new PVector(position.x + size.x, position.y + size.y, position.z + size.z);
    }

    public PVector getPosition(){
        return position.copy();
    }

    public PVector getMaxPosition(){
        return maxPosition.copy();
    }

    public PVector getSize(){
        return size.copy();
    }

    public float getpaddingOffset(){
        return paddingOffset;
    }

    public float getAdjustLedSize(){
        return adjustLedSize;
    }

    public void initFrameBuffer(){
        for(int i = 0; i < GRID_ROW_MAX_NUM; i++){
            for(int j = 0; j < GRID_COL_MAX_NUM; j++){
                for(int k = 0; k < GRID_DEPTH_MAX_NUM; k++){
                    frameBuffer[i][j][k] = 0;
                }
            }
        }
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
                    leds[i][j][k] = new LED(ledPosition, index, paddingOffset);
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

    //3次元のLED配列の状態をシリアライズする
    private void convertFrameBufferToBytes(){
        for(int i = 0; i < GRID_ROW_MAX_NUM; i++){
            String binaryData = "";
            for(int j = GRID_DEPTH_MAX_NUM-1; j >=0; j--){
                for(int k = GRID_COL_MAX_NUM-1; k >=0; k--){
                    binaryData += String.valueOf(leds[k][i][j].getLedState());
                }
            }
            binaryData += "0000000";
            
            BigInteger bigInteger = new BigInteger(binaryData, 2);
            byte[] byteArray = bigInteger.toByteArray();

            StringBuilder hexString = new StringBuilder();
            for (byte b : byteArray) {
                hexString.append(String.format("%02X", b));
            }
            String hexResult = hexString.toString();

            int diff = 8 - hexResult.length();
            if(diff > 0){
                for(int j = 0; j < diff; j++){
                    hexResult = "0" + hexResult;
                }
            }
            else if(diff < 0){
                //println(hexResult.length()+diff);
                hexResult = hexResult.substring(-diff,hexResult.length());
            }

            frameBufferBytes[i] = hexResult;
        }
    }
}

