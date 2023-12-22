import router from '@ohos.router'
@Entry
@Component
struct TextInputTextAreaTest {
  build() {
    Column() {
      Column({ space: 10 }) {
        Row() {
          Text('用户名:')
          // TextInput为单行输入框
          TextInput({ placeholder: '请输入用户名' })
            .type(InputType.Normal)
            .width(150)
            .margin({ left: 15 })
        }
        .alignItems(VerticalAlign.Center)
        Row() {
          Text('密码:')
            .textAlign(TextAlign.End)
          // TextInput为单行输入框
          TextInput({ placeholder: '请输入密码' })
            .type(InputType.Password)
            .width(150)
            .margin({ left: 15 })
            .onSubmit((EnterKeyType) => {
              console.log(EnterKeyType + '输入法回车键的类型值')
            })
        }
        .alignItems(VerticalAlign.Center)
      }
      .margin({ top: 10 })
      .padding(20)
      .backgroundColor(Color.White)
      .alignItems(HorizontalAlign.End)
      .borderRadius(10)
      Column({ space: 10 }) {
        TextArea({ text: '我是TextArea，超过最大宽度时，我会自动这行', placeholder: 'TextArea会自动折行'})
          .width(150)
          .backgroundColor(Color.Pink)
          .onChange((value: string) => {
            console.log(value)
          })
          .onFocus(() => {
            console.log('获取到焦点了')
          })
          .onKeyEvent((event) => {
            console.log(event.keyText)
          })
      }
      .margin({ top: 10 })
      .padding(20)
      .backgroundColor(Color.White)
      .alignItems(HorizontalAlign.End)
      .borderRadius(10)
      Button('点击返回')
        .onClick(() => {
          router.back()
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Gray)
  }
}