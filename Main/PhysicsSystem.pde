public class PhysicsSystem{
    private float gravityWeight;
    private float antiGravityWeight;
    private float maxSpeed;
    private PVector forceDirection;

    public ArrayList<Particle> objects = new ArrayList<Particle>();

    //timeの単位はms
    private long nowTime;
    private long oldTime;
    private long deltaTime;
    private int mode;

    /*************************************
    mode type

    0: gravity
    1: anti gravity
    *************************************/

    PhysicsSystem(){
        gravityWeight = 1.0f;
        antiGravityWeight = 1.0f;
        forceDirection = new PVector(0,1,0);
        mode = 0;
        maxSpeed = 1.0f;

        nowTime = 0;
        oldtime = 0;
    }

    public void setGravityWeight(float w){
        this.gravityWeight = w;
    }

    public void setAntiGravityWeight(float w){
        this.antiGravityWeight = w;
    }

    public void modeSwitch(){
        (mode == 0) ? mode = 1 : mode = 0;
    }

    private void oldTimeUpdate(){
        oldTimeUpdate = nowTime;
    }

    private void nowTimeUpdate(){
        nowTime = millis();
    }

    public void Simulation(){
        oldTimeUpdate();
        nowTimeUpdate();

        for(int i=0; i<objects.size(); i++){
            eulerIntegral(objects.get(i));
        }
    }

    public void addObject(Particle p){
        particles.add(p);
    }

    public void removeObject(){
        //objectsの要素を全クリア
        for(int i=0; i<particles.size(); i++){
            particles.remove(i);
        }
    }

    private void eulerIntegral(Particle obj){
        if(!nullPointerCheck(obj)){
            return;
        }

        PVector _pos = obj.position;
        PVector _vel = obj.velocity;

        if(mode == 0){
            _vec.add(forceDirection * gravityWeight * deltaTime());
            limit(_vec);
            _pos.add(_vec * deltaTime());
        }
        else if(mode == 1){
            _vec.add(forceDirection * antiGravityWeight * deltaTime());
            limit(_vec);
            _pos.add(_vec * deltaTime());
        }
    }

    private void deltaTime(){
        return nowTime - oldTime;
    }

    private void limit(PVector v){
        float mag = v.mag();
        (mag <= maxSpeed) ? v :  v = v.normalize()*maxSpeed;
    }

    private void nullPointerCheck(Particle obj){
        if(obj==null){
            return false;
        }
        return true;
    }
}


