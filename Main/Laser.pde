class Laser{
    private boolean isPhysicAnimation;
    private int laserNum;
    private LEDCUBEVector[] laserPostion;
    private float offset;

    Laser(){
        isPhysicAnimation = false;
        laserNum = 3;
        laserPostion = new LEDCUBEVector[laserNum];
        offset = 0;

        initLaser();
    }

    public void animator1(){
        for(int i=0; i<laserPostion.length; i++){
            if(!(0.47<noise(offset+i*10000) && noise(offset+i*10000)<0.53))
            for(int y=0; y<GRID_ROW_MAX_NUM; y++)
                frameBuffer[laserPostion[i].getX()][y][laserPostion[i].getZ()] = 1;
        }

        println(noise(offset));
        offset += 0.1;
    }

    public boolean isPhysicAnimation(){
        return isPhysicAnimation;
    }

    public void initLaser(){
        for(int i=0; laserPostion.length>i; i++){
            int x = (int)random(5);
            int z = (int)random(5);
            laserPostion[i] = new LEDCUBEVector(x,0,z);
        }
    }
}