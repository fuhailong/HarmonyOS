import router from '@ohos.router'
@Entry
@Component
struct RadioTest {
  build() {
    Column() {
      Row({ space: 5 }) {
        Text('男')
        // 单选框
        // value是单选框的名称，group是单选框的所属群组名称。checked属性可以设置单选框的状态，状态分别为false和true时，设置为true时表示单选框被选中。Radio仅支持选中和未选中两种样式，不支持自定义颜色和形状
        Radio({ value: 'man', group: 'radioGroup' })
          .checked(true)
          .onChange((isChecked: Boolean) => {
            if (isChecked) {
              console.log('男 被点击了')
            }
          })
      }
      Row({ space: 5 }) {
        Text('女')
        Radio({ value: 'man', group: 'radioGroup' })
          .onChange((isChecked: Boolean) => {
            if (isChecked) {
              console.log('女 被点击了')
            }
          })
      }
      Button('点击返回')
        .onClick(() => {
          router.back()
        })
    }
    .width('100%')
  }
}