import curves from '@ohos.curves';
import router from '@ohos.router';

@Entry
@Component
struct SpringAnimateTest {
  @State translateX: number = 0

  @State positionX: number = 100
  @State positionY: number = 300
  private diameter: number = 50

  // springCurve 方式的动画
  private jumpWithSpeed(speed: number) {
    this.translateX = -1
    // 四个参数分别为： 初速度、 弹簧系统的质量、 刚度、 阻尼
    /*
     * 速度只是放大了振荡的效果，但系统能否产生振荡的效果，取决于弹簧振子本身的物理参数，即质量、刚度、阻尼三个参数。
     * 刚度越小、阻尼越大，springCurve的“弹性”越弱，振荡效果越弱。
     * 随着刚度减小或阻尼变大，达到过阻尼状态后，无论速度为多大，都不会有在终点值附近振荡的效果。
     * */
    animateTo({ duration: 2000, curve: curves.springCurve(speed, 1, 1, 1.2) }, () => {
      // 以指定初速度进行x方向的平移的弹簧动画
      this.translateX = 0
    })
  }

  build() {
    Column({ space: 10 }) {
      Button('点击返回')
        .onClick(() => {
          router.back()
        })
      Button('button')
        .width(100)
        .height(50)
        .margin(30)
        .translate({ x: this.translateX })
      Button('jump')
        .onClick(() => {
          // 以初速度100的弹簧曲线进行平移
          this.jumpWithSpeed(100)
        })

      Circle({ width: this.diameter, height: this.diameter })
        .fill(Color.Blue)
        .position({ x: this.positionX, y: this.positionY })
        .onTouch((event: TouchEvent) => {
          if (event.type === TouchType.Move) {
            // 跟手过程， 使用 responsiveSpringMotion 曲线
            animateTo({ curve: curves.responsiveSpringMotion() }, () => {
              // 减去半径，使球的中心运动到手指位置
              this.positionX = event.touches[0].screenX - this.diameter / 2
              this.positionY = event.touches[0].screenY - this.diameter / 2
              console.log(`move, animateTo: x: ${this.positionX}, y: ${this.positionY}`)
            })
          } else if (event.type === TouchType.Up) {
            // 离手时，使用 springMotion 曲线
            animateTo({ curve: curves.springMotion() }, () => {
              this.positionX = 100
              this.positionY = 300
              console.log('touchUp， animateTo x: 100, y: 300')
            })
          }
        })
      /*
       * 跟手过程推荐使用responsiveSpringMotion曲线
       * 松手过程推荐使用springMotion曲线
       * 跟手过程随着手的位置变化会被多次触发，所以会接连启动多次responsiveSpringMotion动画
       * 松手时启动一次springMotion动画
       * 跟手、松手过程在对同一对象的同一属性上执行动画，且使用了springMotion或responsiveSpringMotion曲线，每次新启动的动画会继承上次动画使用的速度，实现平滑过渡。
       *
       * 1. springCurve可以设置初速度，单一属性存在多个动画时不会互相影响，观察到的是多个动画效果的叠加。
       * 2. springMotion虽然内部有速度机制，但不可由开发者设置。在单一属性存在多个动画时，后一动画会取代前一动画，并继承前一动画的速度。
       * */
    }
    .width('100%')
  }
}