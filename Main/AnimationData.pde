class AnimationData{
    String[] hanabiLines;
    String[] tetrisLines;
    String[] laserBeamLines;
    String[] transformLines;

    String hanabiLine;
    String tetrisLine;
    String laserBeamLine;
    String transformLine;

    String[] hanabiData;
    String[] tetrisData;
    String[] laserBeamData;
    String[] transformData;

    public ArrayList<AnimationBuffer> hanabi;
    public ArrayList<AnimationBuffer> tetris;
    public ArrayList<AnimationBuffer> laserBeam;
    public ArrayList<AnimationBuffer> transform;

    private int hanabiFrameCount;
    private int tetrisFrameCount;
    private int laserBeamFrameCount;
    private int transformFrameCount;

    AnimationData(){
        hanabiLines = loadStrings("data/花火.txt");
        tetrisLines = loadStrings("data/テトリス.txt");
        laserBeamLines = loadStrings("data/レーザー.txt");
        transformLines = loadStrings("data/トランスフォーム.txt");

        hanabiLine = whileLoop(hanabiLines);
        tetrisLine = whileLoop(tetrisLines);
        laserBeamLine = whileLoop(laserBeamLines);
        transformLine = whileLoop(transformLines);

        hanabi = new ArrayList<AnimationBuffer>();
        tetris = new ArrayList<AnimationBuffer>();
        laserBeam = new ArrayList<AnimationBuffer>();
        transform = new ArrayList<AnimationBuffer>();

        load(hanabiLine,hanabiData,hanabi);
        load(tetrisLine,tetrisData,tetris);
        load(laserBeamLine,laserBeamData,laserBeam);
        load(transformLine,transformData,transform);

        hanabiFrameCount = 0;
        tetrisFrameCount = 0;
        laserBeamFrameCount = 0;
        transformFrameCount = 0;   
    }

    public void setHanabiFrameCount(int count){
        hanabiFrameCount = count;
    }

    public void setTetrisFrameCount(int count){
        tetrisFrameCount = count;
    }

    public void setLaserBeamFrameCount(int count){
        laserBeamFrameCount = count;
    }

    public void setTransformFrameCount(int count){
        transformFrameCount = count;
    }

    String whileLoop(String[] lines) {
        int lineIndex = 0; // 現在の行のインデックス
        String line = "";

        while (lineIndex < lines.length) {
            line += lines[lineIndex];

            lineIndex++; // 次の行に移動
        }
        return line;
    }

    private void load(String line,String[] data,ArrayList<AnimationBuffer> animationData){
        data = line.split(",");

        for(int i = 0;i < data.length;i++){
            int x = i%5;
            int y = i/25%5;
            int z = i/5%5;
            if(i%125==0)
                animationData.add(new AnimationBuffer());
            animationData.get(i/125).buffer[x][y][z] = int(data[i]);
        }
    }

    public void hanabi(){
        hanabi.get(hanabiFrameCount).setBuffer(frameBuffer);

        hanabiFrameCount++;
        if(hanabiFrameCount>hanabi.size()-1)
            hanabiFrameCount=0;
    }

    public void tetris(){
        tetris.get(tetrisFrameCount).setBuffer(frameBuffer);

        tetrisFrameCount++;
        if(tetrisFrameCount>tetris.size()-1)
            tetrisFrameCount=0;
    }

    public void laserBeam(){
        laserBeam.get(laserBeamFrameCount).setBuffer(frameBuffer);

        laserBeamFrameCount++;
        if(laserBeamFrameCount>laserBeam.size()-1)
            laserBeamFrameCount=0;
    }

    public void transform(){
        transform.get(transformFrameCount).setBuffer(frameBuffer);

        transformFrameCount++;
        if(transformFrameCount>transform.size()-1)
            transformFrameCount=0;
    }
}