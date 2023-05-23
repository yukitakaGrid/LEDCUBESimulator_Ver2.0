class Grid{
    private boolean isPhysicAnimation;
    private int dirMode;
    private int updateInterval;
    private int gridCount;
    private int animeChangeInterval;
    
    Grid(){
        isPhysicAnimation = false;
        dirMode = 0;
        updateInterval = 1;
        gridCount = -1;
        animeChangeInterval = updateInterval*5 + 2;
    }

    public void animator1(){
        if(frameCount%updateInterval==0){
            if(gridCount<5)
                gridCount++;
        }

        if(frameCount%animeChangeInterval==0){
            gridCount = -1;
            dirMode++;
            if(dirMode>5){
                dirMode = 0;
            }
        }

        gridAnimation(gridCount);
    }

    public boolean isPhysicAnimation(){
        return isPhysicAnimation;
    }

    private void gridAnimation(int count){
        if(!(0<=count && count<5))
            return;

        if(dirMode==0){
            for(int i=0; i<5; i+=2){
                for(int j=0; j<5; j++){
                    frameBuffer[i][j][count] = 1;
                }
            }
        }
        else if(dirMode==2){
            for(int i=0; i<5; i+=2){
                for(int j=0; j<5; j++){
                    frameBuffer[i][j][4-count] = 1;
                }
            }
        }
        else if(dirMode==4){
            for(int i=0; i<5; i+=2){
                for(int j=0; j<5; j++){
                    frameBuffer[count][i][j] = 1;
                }
            }
        }
        else if(dirMode==1){
            for(int i=0; i<5; i+=2){
                for(int j=0; j<5; j++){
                    frameBuffer[4-count][i][j] = 1;
                }
            }
        }
        else if(dirMode==3){
            for(int i=1; i<5; i+=2){
                for(int j=0; j<5; j++){
                    frameBuffer[j][count][i] = 1;
                }
            }
        }
        else if(dirMode==5){
            for(int i=1; i<5; i+=2){
                for(int j=0; j<5; j++){
                    frameBuffer[j][4-count][i] = 1;
                }
            }
        }
        else{
            println("dirMode error");
        }
    }
}