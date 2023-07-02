# LightAnimationController
https://github.com/yukitakaGrid/yukitakaGrid/assets/105165980/177f64ce-755d-4bec-925d-85b4184a7f56

アニメーションの追加など、改造して再利用okです

### 使用技術
- Processing
- ControlP5
***

## リファレンス
- AnimationSystemクラス  
・LEDCUBEGenerator()・・・セットアップ時に呼び出すことでLEDCUBEを生成する  
・play()・・・アニメーションの再生  

- LEDCUBEクラス  
・getPosition()・・・位置の再設定  
・getSize()・・・大きさの再設定  
・writeFrameBufferToLED()・・・子オブジェクト二フレームバッファの反映  
・render()・・・描画する(各LEDのrender()の呼び出し)  
・clearPreviosFrameBuffer()・・・古いバッファを削除する(これをバッファ書き込み前にしないと、動作がおかしくなる可能性あり)  

- LEDクラス  
・getLedState()・・・LED構成要素のブロックの点滅状態を取得  
・setLedState()・・・LED構成要素のブロックの点滅状態を上書き  
・render()・・・LEDグリッドを描画する  

- ParticleSystemクラス  
・run()・・・パーティクルシステム実行  
・addParticle・・・パーティクルの追加  

- Particleクラス  
・render()・・・パーティクルを描画する  
・switchActive()・・・パーティクルの描画の有無の切り替え  
・isDead()・・・パーティクルが死んでいるか判定  
・findParticleGrid()・・・このインスタンスのパーティクルが属しているグリッド要素を探索する  

- PhysicsSystemクラス  
・setGravityWeight()・・・重力の重みを再設定  
・setAntiGravityWeight()・・・反重力の重みを再設定  
・modeSwitch()・・・モードの切替え  
・Simulation()・・・物理演算の実行  
・addObject()・・・物理演算の対象となるオブジェクトの追加  
・removeObject()・・・物理演算の対象となるオブジェクトの削除  
