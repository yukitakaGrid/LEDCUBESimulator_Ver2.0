class DigitalRain{
    ParticleSystem ps;
    private boolean isPhysicAnimation;
    private int initNum;
    private float addInterval;

    DigitalRain(){
        ps = new ParticleSystem();
        isPhysicAnimation = true;
        initNum = 3;
        addInterval = 3;

        ps.deadJudgeMode(false);
        initDigitalRain();
    }

    public void animator1(){
        ps.run();
        ps.overLifespan();
        
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

        if(frameCount%addInterval==0){
            addDigitalRain();
        }
    }

    public boolean isPhysicAnimation(){
        return isPhysicAnimation;
    }

    private void initDigitalRain(){
        for(int i=0; i<3; i++){
            PVector pos = new PVector(random(0, GRID_COL_MAX_NUM), random(0, GRID_ROW_MAX_NUM), random(0, GRID_DEPTH_MAX_NUM));
            PVector vel = new PVector(0, 0, 0);
            ps.addParticle(pos, vel);
        }
    }

    private void addDigitalRain(){
        PVector ledPos = cube.getPosition();
        PVector ledMaxPos = cube.getMaxPosition();
        PVector pos = new PVector(random(ledPos.x, ledMaxPos.x), 0, random(ledPos.z, ledMaxPos.z));
        PVector vel = new PVector(0, 0, 0);
        ps.addParticle(pos, vel);
        ps.setLife(0,18);
    }
}