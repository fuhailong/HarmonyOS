import router from '@ohos.router'
@Entry
@Component
struct PopupTest {
  @State showPopup: boolean = false
  @State showCustomPopup: boolean = false

  @Builder popupBuilder() {
    Row({ space: 2 }) {
      Image($r('app.media.icon'))
        .width(24)
        .height(24)
        .margin({ left: 5 })
      Text('这是一个自定义气泡')
    }
    .width(200)
    .height(50)
    .padding(5)
  }

  build() {
    Column({ space: 10 }) {
      Button('点击弹出一个气泡')
        .bindPopup(this.showPopup, {
          message: '我是一个气泡',
          // 未添加按钮，全屏隐藏
          // 添加了按钮后，只能点击按钮后隐藏
          primaryButton: {
            value: '确定',
            action: () => {
              console.log('确定被点击了')
              this.showPopup = false
            }
          },
          secondaryButton: {
            value: '取消',
            action: () => {
              console.log('取消被点击了')
              this.showPopup = false
            }
          },
          onStateChange: (event) => {
            this.showPopup = event.isVisible
          }
        })
        .onClick(() => {
          this.showPopup = !this.showPopup
        })

      Button('自定义气泡')
        .bindPopup(this.showCustomPopup, {
          // 气泡的内容
          builder: this.popupBuilder,
          // 气泡的弹出位置
          placement: Placement.Bottom,
          // 气泡的背景色
          popupColor: Color.Pink
        })
        .onClick(() => {
          this.showCustomPopup = !this.showCustomPopup
        })
      Button('点击返回')
        .onClick(() => {
          router.back()
        })
    }
    .width('100%')
  }
}