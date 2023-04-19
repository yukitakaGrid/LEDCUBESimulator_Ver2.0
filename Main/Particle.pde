public class Particle{
    private PVector position;
    private PVector velocity;
    private boolean active;
    private PVector minimumPosition;
    private PVector maximumPosition;

    Particle(PVector p, PVector v){
        position = p;
        velocity = v;
        active = true;
        minimumPosition = cube.getPosition();
        maximumPosition = new PVector(minimumPosition.x + cube.getSize(), minimumPosition.y + cube.getSize(), minimumPosition.z + cube.getSize());
    }

    public void render(){
        if(active){
            pushMatrix();
            translate(position.x, position.y, position.z);
            fill(255);
            noStroke();
            sphere(SPHERE_RADIUS);
            popMatrix();
        }
    }

    public void switchActive(){
        active = !active;
    }

    public boolean isDead(){
        if(position.x < minimumPosition.x || position.x > maximumPosition.x){
            return true;
        }
        if(position.y < minimumPosition.y || position.y > maximumPosition.y){
            return true;
        }
        if(position.z < minimumPosition.z || position.z > maximumPosition.z){
            return true;
        }

        return false;
    }

    public int[] findParticleGrid(){
        //属しているグリッド番号 
        int[] gridIndex = new int[3];
        //x方向のグリッド番号
        gridIndex[0] = (int) ((position.x - minimumPosition.x) / (maximumPosition.x - minimumPosition.x) * LedCubeStatus.getRowMaxNum());
        //y方向のグリッド番号
        gridIndex[1] = (int) ((position.y - minimumPosition.y) / (maximumPosition.y - minimumPosition.y) * LedCubeStatus.getColMaxNum());
        //z方向のグリッド番号
        gridIndex[2] = (int) ((position.z - minimumPosition.z) / (maximumPosition.z - minimumPosition.z) * LedCubeStatus.getDepMaxNum());

        return gridIndex;
    }
}