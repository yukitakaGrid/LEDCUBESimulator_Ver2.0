class ShootingStar{
    ParticleSystem ps;
    private boolean isPhysicAnimation;
    private int addInterval;
    private float initVelocity;
    private int updateInterval;

    ShootingStar(){
        ps = new ParticleSystem();
        isPhysicAnimation = true;
        addInterval = 3;
        initVelocity = 0;
        updateInterval = 20;

        ps.physicsSystem.modeSwitch();
        ps.physicsSystem.setIsLimit(false);
    }

    public void animator1(){     
        ps.run();

        //パーティクルの位置を探索して、フレームバッファに反映
        for(int i=0; i<ps.particles.size(); i++){
            int[] index = ps.particles.get(i).findParticleGrid();
            if(0<=index[0]&&index[0]<5 && 0<=index[1]&&index[1]<5 && 0<=index[2]&&index[2]<5)
                frameBuffer[index[0]][index[1]][index[2]] = 1;
        }

        if(frameCount%addInterval==0){
            addShootingStar();
        }

        initVelocity += 0.5;
    }

    public boolean isPhysicAnimation(){
        return isPhysicAnimation;
    }

    private void addShootingStar(){
        PVector ledPos = cube.getPosition();
        PVector ledMaxPos = cube.getMaxPosition();
        PVector pos = new PVector(random(ledPos.x, ledMaxPos.x), ledMaxPos.y, random(ledPos.z, ledMaxPos.z));
        PVector vel = new PVector(0, -initVelocity, 0);
        ps.addParticle(pos, vel);
    }
}