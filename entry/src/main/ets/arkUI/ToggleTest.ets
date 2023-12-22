import router from '@ohos.router'
@Entry
@Component
struct ToggleTest {
  build() {
    Column({ space: 10 }) {
      // type 为 button 类型，必须有且只能有一个子组件
      Toggle({ type: ToggleType.Button, isOn: false }) {
        Text('Toggle1')
      }
      .width(100)
      Toggle({ type: ToggleType.Checkbox, isOn: true })
      Toggle({ type: ToggleType.Switch, isOn: true })
        .selectedColor(Color.Pink)
        .onChange((isOn: boolean) => {
          console.log('Toggle ' + (isOn ? '打开了' : '关闭了'))
        })
      Button('点击返回')
        .onClick(() => {
          router.back()
        })
    }
    .width('100%')
  }
}