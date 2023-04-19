public class ParticleSystem{
    public ArrayList<Particle> particles;

    ParticleSystem(){
        particles = new ArrayList<Particle>();
    }

    public void setLEDCUBE(){
        for(int i = 0; i < particles.size(); i++){
            particles.get(i).run();
        }
    }

    public void run(){
        for(int i = 0; i < particles.size(); i++){
            particles.get(i).run();
        }
    }

    public void addParticle(){
        particles.add(new Particle());
    }
}