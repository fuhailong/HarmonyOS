import router from '@ohos.router'
@Entry
@Component
struct GestureTest {
  build() {
    Column() {
      Button('点击返回')
        .onClick(() => {
          router.back()
        })
      Text('Gesture')
        .gesture(
          TapGesture()
            .onAction(() => {
              console.log('Text 的 TapGesture')
            })
        )
    }
    .width('100%')
    // 给父容器添加一个优先级更高的手势
    // GestureMask.IgnoreInternal 忽略内部手势并首先识别当前手势
    /*
    .priorityGesture(
      TapGesture()
        .onAction(() => {
          console.log('比 Text TapGesture手势更高优先级的 TapGesture 被触发了，不会响应原本的 Text TapGesture')
        }), GestureMask.IgnoreInternal)*/
    // 并行手势绑定
    .parallelGesture(
      TapGesture()
        .onAction(() => {
          console.log('与 Text TapGesture 同时触发')
        }), GestureMask.IgnoreInternal
    )

    /*
     * 其他手势基本添加方法类似 主要分为
     * 1.TapGesture 点击手势 TapGesture({ count: 2})
     * count 点击次数
     * fingers 触发手势的手指数量 1 - 10
     *
     * 2.LongPressGesture 长按手势
     * fingers 手指数量
     * repeat 时候连续触发时间回调
     * duration触发时间最短时间
     *
     * 3.PanGesture 拖动手势
     * fingers 手指数量
     * direction 手势方向 支持 & | 运算
     * distance 触发拖动最小距离
     *
     * 4.PinchGesture 捏合手势
     * fingers 手指数量
     * distance 啮合手势最小距离
     *
     * 5.RotationGesture 旋转手势
     * fingers 手指数量
     * angle 旋转最小改变角度
     *
     * 6.SwipeGesture 滑动手势
     * fingers 手指数量
     * direction 手势方向 支持 & | 运算
     * speed 触发滑动最小滑动识别速度
     *
     * 每个手势方法都包含 onAction onActionStart onActionUpdate onActionEnd
     * */

    /*
     * GestureGroup 组合手势
     * GestureMode.Sequence 连续识别，前一个手势未被识别，后续手势是不可能被识别的
     * 当连续识别组合手势中有一个手势识别失败时，所有的手势识别失败
     *
     * GestureMode.Parallel 并行识别，并行识别手势组合中的手势进行识别时互不影响。
     *
     * GestureMode.Exclusive 互斥识别
     *
     * 当由单击手势和双击手势组成一个互斥识别组合手势后，在区域内进行点击时，单击手势和双击手势将同时进行识别。
     * 当只有单次点击时，单击手势识别成功，双击手势识别失败。
     * 当有两次点击时，单击手势在第一次点击时即宣告识别成功，此时双击手势已经失败。即使在规定时间内进行了第二次点击，双击手势事件也不会进行响应，此时会触发单击手势事件的第二次识别成功。
     * */
  }
}