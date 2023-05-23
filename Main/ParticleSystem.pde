public class ParticleSystem{
    private ArrayList<Particle> particles;
    private PhysicsSystem physicsSystem;

    private boolean reflectMode = false;
    private boolean gravityMode = true;
    private boolean deadJudgeMode = true;

    ParticleSystem(){
        physicsSystem = new PhysicsSystem();
        particles = new ArrayList<Particle>();
    }

    public void run(){
        physicsSystem.setDeltaTime();

        for(int i = 0; i < particles.size(); i++){
            Particle p = particles.get(i);

            if(gravityMode)
                physicsSystem.addGravity(p.getPosition(),p.getVelocity());
            else
                physicsSystem.updatePos(p.getPosition(),p.getVelocity());
            p.render();

            if(deadJudgeMode)
                isDead();
        }

        if(reflectMode){
            for(int i = 0; i < particles.size(); i++){
                Particle p = particles.get(i);
                physicsSystem.reflect(p.getPosition(),p.getVelocity());
            }
        }
    }

    public void addParticle(PVector p,PVector v){
        particles.add(new Particle(p,v));
    }

    private void isDead(){
        for(int i = 0; i < particles.size(); i++){
            if(particles.get(i).isDead()){
                particles.remove(i);
            }
        }
    }

    public void overLifespan(){
        for(int i = 0; i < particles.size(); i++){
            Particle p = particles.get(i);
            if(p.overLifespan()){
                particles.remove(i);
            }
            p.updateLifetime();
        }
    }

    public void reflectMode(boolean mode){
        this.reflectMode = mode;
    }

    public void gravityMode(boolean mode){
        this.gravityMode = mode;
    }

    public void deadJudgeMode(boolean mode){
        this.deadJudgeMode = mode;
    }

    public void setLife(int lifetime,int lifespan){
        particles.get(particles.size()-1).setLife(lifetime,lifespan);
    }
}