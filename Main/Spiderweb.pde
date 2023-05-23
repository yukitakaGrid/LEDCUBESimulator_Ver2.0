class Spiderweb{
    ParticleSystem ps;
    private boolean isPhysicAnimation;
    private float offset;
    private int initNum;
    private int animationCurrentNum;
    private int addInterval;

    Spiderweb(){
        ps = new ParticleSystem();
        isPhysicAnimation = false;
        offset  = 0;
        initNum = 10;
        animationCurrentNum = 0;
        addInterval = 10;

        ps.gravityMode(false);
        initSpiderweb();
    }

    public int getAnimationCurrentNum(){
        return animationCurrentNum;
    }

    public void setAnimationCurrentNum(int animNum){
        this.animationCurrentNum = animNum;
    }

    public void animator1(){  
        ps.run();
    
        for(int i=0; i<ps.particles.size(); i++){
            int[] index = ps.particles.get(i).findParticleGrid();
            if(0.4985 < noise(offset + i*5000) && noise(offset + i*5000) < 0.5015)
                if(0<=index[0]&&index[0]<5 && 0<=index[1]&&index[1]<5 && 0<=index[2]&&index[2]<5)
                    frameBuffer[index[0]][index[1]][index[2]] = 1;
        }

        offset += 0.1f;
    }

    public void animator2(){
        ps.run();

        for(int i=0; i<ps.particles.size(); i++){
            int[] index = ps.particles.get(i).findParticleGrid();
            if(0<=index[0]&&index[0]<5 && 0<=index[1]&&index[1]<5 && 0<=index[2]&&index[2]<5)
                frameBuffer[index[0]][index[1]][index[2]] = 1;
        }

        if(frameCount%addInterval==0){
            addSpiderweb2();
        }
    }

    public boolean isPhysicAnimation(){
        return isPhysicAnimation;
    }

    private void initSpiderweb(){
        for(int i=0; i<initNum; i++){
            addSpiderweb1();
        }
    }

    private void addSpiderweb1(){
        PVector ledPos = cube.getPosition();
        PVector ledMaxPos = cube.getMaxPosition();
        PVector pos = new PVector(random(ledPos.x+LED_SIZE, ledMaxPos.x-LED_SIZE), random(ledPos.y+LED_SIZE, ledMaxPos.y-LED_SIZE), random(ledPos.z+LED_SIZE, ledMaxPos.z-LED_SIZE));
        PVector vel = new PVector(0, 0, 0);
        ps.addParticle(pos, vel);
    }

    private void addSpiderweb2(){
        PVector ledPos = cube.getPosition();
        PVector ledMaxPos = cube.getMaxPosition();
        PVector ledCenterPos = ledPos.add(ledMaxPos).mult(0.5f).copy();
        PVector vel = new PVector(random(-1,1), random(-1,1), random(-1,1)).mult(50.0f);
        ps.addParticle(ledCenterPos, vel);
    }

    public void clearSpiderweb(){
        ps = new ParticleSystem();
    }
}