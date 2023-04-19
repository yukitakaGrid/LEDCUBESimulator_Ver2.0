public class AnimationSystem{
    private boolean isCurrentProcedualAnimation; //これはおそらく使わない

    //アニメーションオブジェクトのインスタンス化
    /*private ProcedualSetup procedualSetup;
    private ChaosBound chaosBound;
    private Fountain fountain;
    private Snake snake;
    private Laser laser;
    private Grid grid;
    private ShootingStar shootingStar;
    private DigitalRain digitalRain;
    private Spiderweb spiderweb;*/

    AnimationSystem(){
        isCurrentProcedualAnimation = false;
    }

    public void LEDCUBEGenerator(PVector position){
        cube = new LEDCUBE(position, GRID_ROW_MAX_NUM, GRID_COL_MAX_NUM, GRID_DEPTH_MAX_NUM);
        cube.initFrameBuffer();

        //cubeのバッファが作成されたので、アニメーションオブジェクトのインスタンス化をしてバッファの共有をする
        /*procedualSetup = new ProcedualSetup();
        chaosBound = new ChaosBound();
        fountain = new Fountain();
        snake = new Snake();
        laser = new Laser();
        grid = new Grid();
        shootingStar = new ShootingStar();
        digitalRain = new DigitalRain();
        spiderweb = new Spiderweb();*/
    }

    public void play(){
        cube.clearPreviosFrameBuffer();
        //アニメーションが設定されていない場合は何もしない
        if(activeName == "Default"){
            cube.render();
            return;
        }

        //アニメーションオブジェクト上でフレームバッファに書き込む
        animator();
        //フレームバッファをLEDに書き込む
        cube.writeFrameBufferToLED();

        cube.render();
    }

    private void animator(){
        /*if(activeName == "ProcedualSetup"){
            procedualSetup.animator1();
        }
        else if(activeName == "ChaosBound"){
            chaosBound.animator1();
            isCurrentProcedualAnimation = chaosBound.isProcedualAnimation();
            }
        }
        else if(activeName == "Fountain"){
            fountain.animator1();
            isCurrentProcedualAnimation = fountain.isProcedualAnimation();
            }
        }
        else if(activeName == "Snake"){
            snake.animator1();
            isCurrentProcedualAnimation = snake.isProcedualAnimation();
        }
        else if(activeName == "Laser"){
            laser.animator1();
            isCurrentProcedualAnimation = laser.isProcedualAnimation();
        }
        else if(activeName == "Grid"){
            grid.animator1();
            isCurrentProcedualAnimation = grid.isProcedualAnimation();
        }
        else if(activeName == "ShootingStar"){
            shootingStar.animator1();
            isCurrentProcedualAnimation = shootingStar.isProcedualAnimation();
            }
        }
        else if(activeName == "DigitalRain"){
            digitalRain.animator1();
            isCurrentProcedualAnimation = digitalRain.isProcedualAnimation();
            }
        }
        else if(activeName == "Spiderweb"){
            spiderweb.animator1();
            isCurrentProcedualAnimation = spiderweb.isProcedualAnimation();
        }*/
    }
}