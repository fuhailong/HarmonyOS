import router from '@ohos.router'

@Entry
@Component
struct ShapeTest {
  build() {
    Column({ space: 10 }) {
      Button('点击返回')
        .onClick(() => {
          router.back()
        })
      // 使用 Shape 绘制，将图形绘制在指定的PixelMap对象中，若未设置，则在当前绘制目标中进行绘制
      // Shape(value?: PixelMap)
      /*
       * Shape() {
       *  Rect()
       *    .width(300)
       *    .height(50)
       * }
       * */
      // 绘制指定的图形
      /*
       * Circel 圆形
       * Ellipse 椭圆形
       * Line 直线
       * Polyine 折线
       * Polygon 多边形
       * Path 路径
       * Rect 矩形
       * */
     Row() {
       Circle({ width: 75, height: 75 })
         .fill(Color.Pink)

       // 自定义样式
       Path()
         .width(100)
         .height(100)
         .commands('M150 0 L300 300 L0 300 Z')
           // 填充颜色
         .fill('#e87361')
           // 填充透明度
         .fillOpacity(0.3)
           // 边框宽度
         .strokeWidth(10)
           // 边框颜色
         .stroke(Color.Pink)
           // 边框透明度
         .strokeOpacity(0.3)
     }

      Row({ space: 10 }) {
        // viewport 形状视口 width height改变UI大小 viewport改变视口大小 然后根据 width height 放大或者缩小比例
        // 视口与内部形状比例 会按 宽高等比放大或者缩小
        // 视口 x y 可以设置对应位置
        // Shape 内放大Circle组件
        Shape() {
          Rect()
            .width('100%')
            .height('100%')
            .fill('#0097d4')
          // 在内部画一个圆
          Circle({ width: 75, height: 75 })
            .fill('#e87361')
        }
        .viewPort({ x: 0, y: 0, width: 75, height: 75 })
        .width(150)
        .height(150)

        // Shape 内缩小组件
        Shape() {
          Rect()
            .width('100%')
            .height('100%')
            .fill('#bddb69')
          Circle({ width: 75, height: 75 })
            .fill('#e87361')
        }
        .viewPort({ x: 0, y: 0, width: 300, height: 300})
        .width(150)
        .height(150)
        .backgroundColor('#f5dc62')
      }

      Row() {
        // 折线
        Polyline()
          .width(100)
          .height(100)
          .fillOpacity(0)
          .stroke(Color.Red)
          .strokeWidth(8)
          .points([
            [20, 0],
            [0, 100],
            [100, 90]
          ])
            // 设置折线拐角处为圆弧
            /*
             * Miter 尖角
             * Round 圆角
             * */
          .strokeLineJoin(LineJoinStyle.Round)

        Polyline()
          .width(100)
          .height(100)
          .fillOpacity(0)
          .stroke(Color.Red)
          .strokeWidth(10)
          .points([[20, 0], [20, 100], [100, 100]])
          .strokeLineJoin(LineJoinStyle.Miter)
            // 设置斜接长度与线宽的比值
          .strokeMiterLimit(1/Math.sin(45))

        Polyline()
          .width(100)
          .height(100)
          .fillOpacity(0)
          .stroke(Color.Red)
          .strokeWidth(10)
          .points([[20, 0], [20, 100], [100, 100]])
          .strokeLineJoin(LineJoinStyle.Miter)
          .strokeMiterLimit(1.42)
      }

      Row({ space: 10 }) {
        // 抗锯齿 模拟器里 放大就看的清楚了
        Circle()
          .width(150)
          .height(200)
          .fillOpacity(0)
          .strokeWidth(5)
          .stroke(Color.Black)

        Circle()
          .width(150)
          .height(200)
          .fillOpacity(0)
          .strokeWidth(5)
          .stroke(Color.Black)
          // 关闭抗锯齿
          .antiAlias(false)
      }
    }
    .width('100%')
  }
}