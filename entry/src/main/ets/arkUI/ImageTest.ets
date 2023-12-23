import router from '@ohos.router'

@Entry
@Component
struct ImageTest {
  build() {
    Column({ space: 10 }) {
      Button('点击返回')
        .onClick(() => {
          router.back()
        })
      // ets 下 任意位置创建的文件夹 可以直接引入本地图片路径 'images/a.png'
      // 网络资源 直接为 url
      // rawfile 文件夹下 $rawfile('a') 这种方式下不能加图片格式后缀
      // 媒体库（相册） 'file://media/Photos/a'
      // base64 'data:image/[png|jpeg|bmp|webp];base64,[base64 data]'
      // Resource资源如下
      Image($r('app.media.icon'))
        .width(500)
        .height(500)
        // 缩放类型
        /*
         * Contain 保持宽高比进行缩小或者放大，使得图片完全显示在显示边界内
         * Cover 保持宽高比进行缩小或者放大，使得图片两边都大于或等于显示边界
         * Auto 自适应显示
         * Fill 不保持宽高比进行放大缩小，使得图片充满显示边界
         * ScaleDown 保持宽高比显示，图片缩小或者保持不变
         * None 保持原有尺寸显示
         * */
        .objectFit(ImageFit.None)
      // 图片插值 当原图分辨率较低并且放大显示时，图片会模糊出现锯齿。这时可以使用interpolation属性对图片进行插值，使图片显示得更清晰。
        .interpolation(ImageInterpolation.High)
      // 设置图片重复样式
      /*
       * XY 在水平轴和竖直轴上同时重复绘制图片
       * Y 只在竖直轴上重复绘制图片
       * X 只在水平轴上重复绘制图片
       * */
        .objectRepeat(ImageRepeat.XY)
      // 图片渲染模式 通过renderMode属性设置图片的渲染模式为原色或黑白
        .renderMode(ImageRenderMode.Template)
      // 图片解码尺寸 降低图片的分辨率 将原尺寸 解码为 想要的尺寸
        .sourceSize({ width: 100, height: 100 })
      // 添加滤镜效果
        .colorFilter([
          1, 1, 0, 0, 0,
          0, 1, 0, 0, 0,
          0, 0, 1, 0, 0,
          0, 0, 0, 1, 0
        ])
      // 一般情况下，图片会异步加载，以避免阻塞主线程，但有可能会出现刷新出来是闪烁，可以改为同步加载
        .syncLoad(true)
      // 图片加载成功后可以获取图片的必要信息
        .onComplete((msg: {
          width: number,
          height: number,
          componentWidth: number,
          componentHeight: number
        }) => {
          // msg.width msg.height msg.componentWidth msg.componentHeight
        })
      // 图片加载失败
        .onError(() => {
          console.log('load image fail')
        })

      // PixelMap是图片解码后的像素图
      /*
       * let options = {
       *  alphaType: 0,     // 透明度
       *  editable: false,  // 是否可编辑
       *  pixelFormat: 3,   // 像素格式
       *  scaleMode: 1,     // 缩略值
       *  size: { height: 100, width: 100 }
       * }
       *
       * import image from '@ohos.multimedia.image';
       * 需要用到这个库
       * imageSource = image.createImageSource(res)
       * imageSource.createPixelMap(options).then((pixelMap) => {
       *  this.image = pixelMap
       * })
       * Image(this.image)
       * */
      // 矢量图 svg格式
      // 支持的svg标签为：svg、rect、circle、ellipse、path、line、polyline、polygon和animate。
      // svg格式的图片可以使用fillColor属性改变图片的绘制颜色
    }
    .width('100%')
  }
}