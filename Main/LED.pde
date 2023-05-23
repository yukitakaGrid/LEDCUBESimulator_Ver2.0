public class LED{
    private PVector position;
    private float paddingOffset;
    private int ledState;
    private int[] index = new int[3];

    LED(PVector pos, int[] index, float paddingOffset){
        this.paddingOffset = paddingOffset;
        this.ledState = 0;
        this.index = index;
        this.position = pos;
    }

    public int getLedState(){
        return ledState;
    }

    public void setLedState(int state){
        ledState = state;
    }

    public void render(){
        pushMatrix();
        translate(position.x,position.y,position.z);
        blendMode(ADD);
        noFill();
        stroke(255,50);
        strokeWeight(0.5);
        if(ledState == 1){
            fill(LED_RED, LED_GREEN, LED_BLUE, LED_ALPHA);
        }
        box(LED_SIZE - paddingOffset);
        blendMode(NORMAL);
        popMatrix();
    }
}