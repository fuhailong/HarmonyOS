@Entry
@Component
struct ButtonTest {
  build() {
    Column({ space: 10 }) {
      // 默认按钮
      Button('胶囊按钮')
      // 带参的默认 type用于设置Button类型，stateEffect属性设置Button是否开启点击效果
      Button('带参的普通按钮', { type: ButtonType.Normal, stateEffect: true })
      Button('带参的胶囊按钮', { type: ButtonType.Capsule, stateEffect: false })
      Button('带参的圆形按钮', { type: ButtonType.Circle, stateEffect: false })
        .width(150)

      // 包含子组件的按钮
      Button({ type: ButtonType.Capsule, stateEffect: true }) {
        Row() {
          LoadingProgress()
            .width(30)
            .height(30)
            .color(Color.White)
          Text('自定义带图标又带文字的按钮')
            .fontColor(Color.White)
        }
        .margin({ top: 10, right: 10, bottom: 10, left: 8 })
      }
      .onClick(() => {
        console.log('按钮被点击了')
      })
    }
    .width('100%')
  }
}