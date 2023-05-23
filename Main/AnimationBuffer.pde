class AnimationBuffer{
    public int[][][] buffer;

    AnimationBuffer(){
        buffer = new int[GRID_ROW_MAX_NUM][GRID_COL_MAX_NUM][GRID_DEPTH_MAX_NUM];

        initBuffer();
    }

    void initBuffer(){
        for(int i = 0; i < GRID_ROW_MAX_NUM; i++){
            for(int j = 0; j < GRID_COL_MAX_NUM; j++){
                for(int k = 0; k < GRID_DEPTH_MAX_NUM; k++){
                    buffer[i][j][k] = 0;
                }
            }
        }
    }

    public void setBuffer(int[][][] b){
        for(int i = 0; i < GRID_ROW_MAX_NUM; i++){
            for(int j = 0; j < GRID_COL_MAX_NUM; j++){
                for(int k = 0; k < GRID_DEPTH_MAX_NUM; k++){
                    int data = buffer[i][j][k];
                    b[i][j][k] = data;
                }
            }
        }
    }
}