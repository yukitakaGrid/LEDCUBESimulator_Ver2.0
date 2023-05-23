class Snake{
    private boolean isPhysicAnimation;
    private int[][] snakeBody;
    private int updateInterval;

    Snake(){
        isPhysicAnimation = false;
        snakeBody = new int[3][3];
        updateInterval = 2;

        initSnakeBody();
    }

    public void animator1(){
        if(frameCount%updateInterval==0){
            snakeCalc();
        }

        frameBuffer[snakeBody[0][0]][snakeBody[0][1]][snakeBody[0][2]] = 1;
        frameBuffer[snakeBody[1][0]][snakeBody[1][1]][snakeBody[1][2]] = 1;
        frameBuffer[snakeBody[2][0]][snakeBody[2][1]][snakeBody[2][2]] = 1;
    }

    public boolean isPhysicAnimation(){
        return isPhysicAnimation;
    }

    public void snakeCalc(){
        int movingIndex = (int)random(3); 
        int fixedIndex1 = 0;
        int fixedIndex2 = 0;
        
        if(movingIndex==0){
            fixedIndex1 = 1;
            fixedIndex2 = 2;
        }
        else if(movingIndex==1){
            fixedIndex1 = 0;
            fixedIndex2 = 2;
        }
        else if(movingIndex==2){
            fixedIndex1 = 0;
            fixedIndex2 = 1;
        }
        
        float p = random(1);
        if(p>0.75)
            snakeBody[movingIndex][0] = snakeBody[fixedIndex1][0]-1;
        else if(p<=0.75 && p>0.5)
            snakeBody[movingIndex][0] = snakeBody[fixedIndex1][0]+1;
        else if(p<=0.5 && p>0.25)
            snakeBody[movingIndex][0] = snakeBody[fixedIndex2][0]-1;
        else
            snakeBody[movingIndex][0] = snakeBody[fixedIndex2][0]+1;
        
        p = random(1);
        if(p>0.75)
            snakeBody[movingIndex][1] = snakeBody[fixedIndex1][1]-1;
        else if(p<=0.75 && p>0.5)
            snakeBody[movingIndex][1] = snakeBody[fixedIndex1][1]+1;
        else if(p<=0.5 && p>0.25)
            snakeBody[movingIndex][1] = snakeBody[fixedIndex2][1]-1;
        else
            snakeBody[movingIndex][1] = snakeBody[fixedIndex2][1]+1;
        
        p = random(1);
        if(p>0.75)
            snakeBody[movingIndex][2] = snakeBody[fixedIndex1][2]-1;
        else if(p<=0.75 && p>0.5)
            snakeBody[movingIndex][2] = snakeBody[fixedIndex1][2]+1;
        else if(p<=0.5 && p>0.25)
            snakeBody[movingIndex][2] = snakeBody[fixedIndex2][2]-1;
        else
            snakeBody[movingIndex][2] = snakeBody[fixedIndex2][2]+1;
        
        for(int i=0; i<3; i++){
            if(snakeBody[movingIndex][i]<0)
                snakeBody[movingIndex][i] = 0;
            else if(snakeBody[movingIndex][i]>4)
                snakeBody[movingIndex][i] = 4;
        }
    }

    public void initSnakeBody(){
        snakeBody[0][0] = (int)random(5);
        snakeBody[0][1] = (int)random(5);
        snakeBody[0][2] = (int)random(5);

        //iはsnakeBodyのインデックス、jはsnakeBodyの座標
        for(int i=1; i<snakeBody.length; i++){
            for(int j=0; j<snakeBody[i].length; j++){
                if(random(1)<0.5)
                    snakeBody[i][j] = snakeBody[i-1][j]-1;
                else
                    snakeBody[i][j] = snakeBody[i-1][j]+1;

                if(snakeBody[i][j]<0)
                    snakeBody[i][j] = 0;
                else if(snakeBody[i][j]>4){
                    snakeBody[i][j] = 4;
            }
        }
    }
}
}