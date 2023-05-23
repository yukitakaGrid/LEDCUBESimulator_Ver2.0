public class PhysicsSystem{
    private float gravityWeight;
    private float antiGravityWeight;
    private float maxSpeed;
    private PVector forceDirection;

    //timeの単位はms
    private float nowTime;
    private float oldTime;
    private float deltaTime;
    private int mode;
    private boolean isLimit;

    /*************************************
    mode type

    0: gravity
    1: anti gravity
    *************************************/

    PhysicsSystem(){
        gravityWeight = 3.6f;
        antiGravityWeight = -0.9f;
        forceDirection = new PVector(0.0f,1.0f,0.0f);
        mode = 0;
        maxSpeed = 160.0f;
        isLimit = true;

        nowTime = 0;
        oldTime = 0;
    }

    public void setGravityWeight(float w){
        this.gravityWeight = w;
    }

    public void setAntiGravityWeight(float w){
        this.antiGravityWeight = w;
    }

    public void setIsLimit(boolean b){
        this.isLimit = b;
    }

    public void modeSwitch(){
        mode = (mode == 0) ? 1 : 0;
    }

    private void oldTimeUpdate(){
        oldTime = nowTime;
    }

    private void nowTimeUpdate(){
        nowTime = millis();
    }

    //必要に応じて反射を呼び出す
    public void reflect(PVector p,PVector v){
        PVector limitMinWall = cube.getPosition();
        PVector limitMaxWall = cube.getMaxPosition();

        if(p.x < limitMinWall.x){
            p.x = limitMinWall.x;
            v.x *= -1;
        }
        else if(p.x > limitMaxWall.x){
            p.x = limitMaxWall.x;
            v.x *= -1;
        }

        if(p.y < limitMinWall.y){
            p.y = limitMinWall.y;
            v.y *= -1;
        }
        else if(p.y > limitMaxWall.y){
            p.y = limitMaxWall.y;
            v.y *= -1;
        }

        if(p.z < limitMinWall.z){
            p.z = limitMinWall.z;
            v.z *= -1;
        }
        else if(p.z > limitMaxWall.z){
            p.z = limitMaxWall.z;
            v.z *= -1;
        }
    }

    private void addGravity(PVector p,PVector v){
        PVector _p = p;
        PVector _v = v;
        PVector d = forceDirection.copy();

        if(mode == 0){
            d.mult(gravityWeight);
            _v.add(d);
            limit(_v);
            _p.add(_v);
        }
        else if(mode == 1){
            d.mult(antiGravityWeight);
            _v.add(d);
            limit(_v);
            _p.add(_v);
        }
        //println("加速度" + d + ", 速度" + _v + ", 位置" + _p);
    }

    public void setDeltaTime(){
        oldTimeUpdate();
        nowTimeUpdate();
        deltaTime =  nowTime - oldTime;
    }

    private void limit(PVector v){
        if(isLimit){
            float mag = v.mag();
            v = (mag <= maxSpeed) ? v : v.normalize().mult(maxSpeed);
        }
    }

    public void updatePos(PVector p,PVector v){
        PVector _p = p;
        PVector _v = v;
        
        limit(_v);
        _p.add(_v); 
    }
}


