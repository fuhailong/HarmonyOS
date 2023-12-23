
import router from '@ohos.router'

@Entry
@Component
struct AnimateTest {
  // 用于控制Column的AlignItems属性
  @State itemAlign: HorizontalAlign = HorizontalAlign.Start
  private allAlign: HorizontalAlign[] = [HorizontalAlign.Start, HorizontalAlign.Center, HorizontalAlign.End]
  private alignIndex: number = 0
  @State buttonWidth: number = 100
  @State buttonHeight: number = 50
  @State flag: boolean = false;
  @State myColor: Color = Color.Blue;

  build() {
    Column({ space: 10 }) {
      Button('点击返回')
        .onClick(() => {
          router.back()
        })
      Column({ space: 10 }) {
        Button("宽高动画")
          .width(this.buttonWidth)
          .height(this.buttonHeight)
          .onClick(() => {
            animateTo({ duration: 200, curve: Curve.EaseInOut }, () => {
              this.buttonWidth += 10
              this.buttonHeight += 10
            })
          })
        Button("2")
          .width(100)
          .height(50)
          // 配置position属性固定，使自己的布局位置不被影响
          .position({ x: '30%', y: 50 })
        Button("3")
          .width(100)
          .height(50)
      }
      .margin(20)
      .alignItems(this.itemAlign)
      .width('100%')

      Button('对齐位置动画')
        .onClick(() => {
          animateTo({ duration: 1000, curve: Curve.EaseInOut }, () => {
            this.alignIndex = (this.alignIndex + 1) % this.allAlign.length
            this.itemAlign = this.allAlign[this.alignIndex]
          })
        })

      Button('animation动画')
        .type(ButtonType.Normal)
        .width(this.buttonWidth)
        .height(this.buttonHeight)
        .backgroundColor(this.myColor)
        // animation只对之前设置过的属性有动画效果，在之后写的不生效
        .animation({ duration: 200, curve: Curve.Ease })
        .onClick(() => {
          // 改变属性值，配置了属性动画的属性会进行动画过渡
          if (this.flag) {
            this.buttonWidth = 100;
            this.buttonHeight = 50;
            this.myColor = Color.Blue;
          } else {
            this.buttonWidth = 200;
            this.buttonHeight = 100;
            this.myColor = Color.Pink;
          }
          this.flag = !this.flag;
        })
    }
    .width('100%')
    .height('100%')
  }
}