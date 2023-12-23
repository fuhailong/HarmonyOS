import router from '@ohos.router'

@Entry
@Component
struct CanvasTest {
  // true 表示开启抗锯齿
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  /*
  build() {
    // 使用 CanvasRenderingContext2D 对象在 Canvas 画布上绘制
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Button('点击返回')
        .onClick(() => {
          router.back()
        })
      // 在 Canvas 中调用 CanvasRenderingContext2D 对象
      Canvas(this.context)
        .width('100%')
        .height('100%')
        .backgroundColor('#f5dc62')
        .onReady(() => {
          // 可以在这里绘制内容
          this.context.strokeRect(50, 40, 200, 150)
        })
    }
  }*/

  /*
   * 离屏绘制是指将需要绘制的内容先绘制在缓存区，再将其转换成图片，一次性绘制到Canvas上，加快了绘制速度
   * 1. 通过transferToImageBitmap方法将离屏画布最近渲染的图像创建为一个ImageBitmap对象。
   * 2. 通过CanvasRenderingContext2D对象的transferFromImageBitmap方法显示给定的ImageBitmap对象。
   * */

  // 用来创建OffscreenCanvasRenderingContext2D对象，width为离屏画布的宽度，height为离屏画布的高度。通过在canvas中调用OffscreenCanvasRenderingContext2D对象来绘制。
  private offContext: OffscreenCanvasRenderingContext2D = new OffscreenCanvasRenderingContext2D(600, 600, this.settings)

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center}) {
      Button('点击返回')
        .onClick(() => {
          router.back()
        })
      Canvas(this.context)
        .width('100%')
        .height('100%')
        .backgroundColor('#f5dc62')
        .onReady(() => {
          /*
           * fill(对封闭路径进行填充）
           * clip(设置当前路径为剪切路径)
           * stroke（进行边框绘制操作）
           * 同时提供了fillStyle（指定绘制的填充色）
           * globalAlpha（设置透明度）
           * strokeStyle（设置描边的颜色）等属性修改绘制内容的样式
           * */
          // this.offContext.fillStyle = '#0097d4'
          // this.offContext.fillRect(50, 40, 200, 150)
          // 文本绘制
          //绘制填充类文本
          this.offContext.font = '100px sans-serif'
          this.offContext.fillText("Hello World!", 50, 100)
          //绘制描边类文本
          this.offContext.font = '100px sans-serif'
          this.offContext.strokeText("Hello World!", 50, 150)
          //绘制矩形
          this.offContext.beginPath()
          this.offContext.rect(100, 50, 100, 100)
          this.offContext.stroke()
          //绘制圆形
          this.offContext.beginPath()
          this.offContext.arc(150, 250, 50, 0, 6.28)
          this.offContext.stroke()
          //绘制椭圆
          this.offContext.beginPath()
          this.offContext.ellipse(150, 450, 50, 100, Math.PI * 0.25, Math.PI * 0, Math.PI * 2)
          this.offContext.stroke()
          // 将离屏绘制渲染的图像在普通画布上显示
          let image = this.offContext.transferToImageBitmap()
          this.context.transferFromImageBitmap(image)
        })
    }
    .width('100%')
    .height('100%')
  }
  /*
  // 绘制图片和图像像素信息处理。
  // 可以通过drawImage（图像绘制）
  // putImageData（使用ImageData数据填充新的矩形区域）等接口绘制图片
  // 通过createImageData（创建新的ImageData 对象）
  // getPixelMap（以当前canvas指定区域内的像素创建PixelMap对象）
  // getImageData（以当前canvas指定区域内的像素创建ImageData对象）等接口进行图像像素信息处理。
  private img:ImageBitmap = new ImageBitmap("/common/images/1234.png")

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Canvas(this.context)
        .width('100%')
        .height('100%')
        .backgroundColor('#F5DC62')
        .onReady(() =>{
          // 使用drawImage接口将图片画在（0，0）为起点，宽高130的区域
          this.offContext.drawImage(this.img,0,0,130,130);
          // 使用getImageData接口，获得canvas组件区域中，（50，50）为起点，宽高130范围内的绘制内容
          let imagedata = this.offContext.getImageData(50,50,130,130);
          // 使用putImageData接口将得到的ImageData画在起点为（150， 150）的区域中
          this.offContext.putImageData(imagedata,150,150);
          // 将离屏绘制的内容画到canvas组件上
          let image = this.offContext.transferToImageBitmap();
          this.context.transferFromImageBitmap(image);
        })
    }
    .width('100%')
    .height('100%')
  }*/

  /*
  // Canvas中还提供其他类型的方法
  // 渐变（CanvasGradient对象）相关的方法：
  // createLinearGradient（创建一个线性渐变色）
  // createRadialGradient（创建一个径向渐变色）等。
   Canvas(this.context)
    .width('100%')
    .height('100%')
    .backgroundColor('#F5DC62')
    .onReady(() =>{
      //创建一个径向渐变色的CanvasGradient对象
      let grad = this.context.createRadialGradient(200,200,50, 200,200,200)
      //为CanvasGradient对象设置渐变断点值，包括偏移和颜色
      grad.addColorStop(0.0, '#E87361');
      grad.addColorStop(0.5, '#FFFFF0');
      grad.addColorStop(1.0, '#BDDB69');
      //用CanvasGradient对象填充矩形
      this.context.fillStyle = grad;
      this.context.fillRect(0, 0, 400, 400);
  })
   */
}