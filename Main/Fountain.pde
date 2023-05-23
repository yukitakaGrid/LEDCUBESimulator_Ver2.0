class Fountain{
    ParticleSystem ps;
    private boolean isPhysicAnimation;
    private int restartCounter;

    Fountain(){
        ps = new ParticleSystem();
        isPhysicAnimation = true;
        restartCounter = 70;

        ps.deadJudgeMode(false);
        initFountain();
    }

    public void animator1(){
        ps.run();
        
        //パーティクルの位置を探索して、フレームバッファに反映
        for(int i=0; i<ps.particles.size(); i++){
            int[] index = ps.particles.get(i).findParticleGrid();

            if(index[0]<0)index[0]=0;
            else if(index[0]>=GRID_ROW_MAX_NUM)index[0]=GRID_ROW_MAX_NUM-1;
            if(index[1]<0)index[1]=0;
            else if(index[1]>=GRID_COL_MAX_NUM)index[1]=GRID_COL_MAX_NUM-1;
            if(index[2]<0)index[2]=0;
            else if(index[2]>=GRID_DEPTH_MAX_NUM)index[2]=GRID_DEPTH_MAX_NUM-1;
            
            frameBuffer[index[0]][index[1]][index[2]] = 1;
        }

        if(frameCount%restartCounter==0){
            ps = new ParticleSystem();
            ps.deadJudgeMode(false);
            initFountain();
        }
    }

    public boolean isPhysicAnimation(){
        return isPhysicAnimation;
    }

    private void initFountain(){
        float adjustLedSize = cube.getAdjustLedSize();
        float offset = cube.getpaddingOffset();
        float LedSizeHalf = LED_SIZE/2.0f;
        for(int z=0; z<GRID_DEPTH_MAX_NUM; z++){
            for(int x=0; x<GRID_ROW_MAX_NUM; x++){
                PVector pos = cube.getPosition();
                pos.add(LedSizeHalf + x*adjustLedSize, cube.getSize().y, LedSizeHalf + z*adjustLedSize);
                //グリッドごとの上に打ち上げる初速度を与える
                PVector vel = new PVector(0,-(((2-abs(x-2))+(2-abs(z-2))+1))*16f,0);
                ps.addParticle(pos,vel);
            }
        }
    }
}