class LEDCUBEVector{
    private int x;
    private int y;
    private int z;

    LEDCUBEVector(int x, int y, int z){
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public void setLEDCUBEVector(int x,int y,int z) throws IllegalArgumentException {
        if (x < 0 || x >= 5) {
            throw new IllegalArgumentException("Invalid LEDCUBEVector values: x=" + x);
        }
        if (y < 0 || y >= 5) {
            throw new IllegalArgumentException("Invalid LEDCUBEVector values: y=" + y);
        }
        if (z < 0 || z >= 5) {
            throw new IllegalArgumentException("Invalid LEDCUBEVector values: z=" + z);
        }
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public int getZ() {
        return z;
    }
}