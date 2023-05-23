class ChaosBound{
    ParticleSystem ps;
    private boolean isPhysicAnimation;

    ChaosBound(){
        ps = new ParticleSystem();
        ps.reflectMode(true);
        ps.deadJudgeMode(false);
        isPhysicAnimation = true;

        initChaosBound();
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
    }

    public boolean isPhysicAnimation(){
        return isPhysicAnimation;
    }

    private void initChaosBound(){
        float adjustLedSize = cube.getAdjustLedSize();
        float offset = cube.getpaddingOffset();
        float LedSizeHalf = LED_SIZE/2.0f;
        for(int z=0; z<GRID_DEPTH_MAX_NUM; z++){
            for(int x=0; x<GRID_ROW_MAX_NUM; x++){
                PVector pos = cube.getPosition();
                pos.add(LedSizeHalf + x*adjustLedSize, cube.getSize().y, LedSizeHalf + z*adjustLedSize);
                //グリッドごとの上に打ち上げる初速度を与える
                float vel = random(40.0f,160.0f);
                ps.addParticle(pos,new PVector(0.0f,-vel,0.0f));
            }
        }
    }
}