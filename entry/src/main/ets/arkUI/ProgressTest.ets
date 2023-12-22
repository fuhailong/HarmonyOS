import router from '@ohos.router'
@Entry
@Component
struct ProgressTest {
  build() {
    Column({ space: 10 }) {
      // 线性样式进度条
      Progress({ value: 30, total: 100, type: ProgressType.Linear })
        .margin({ top: 100 })
      // 环形无刻度样式
      Progress({ value: 40, total: 100, type: ProgressType.Ring })

      // 环形有刻度样式
      // 总刻度数为20，刻度宽度为5vp
      Progress({ value: 50, total: 100, type: ProgressType.ScaleRing })
        .style({ scaleCount: 20, scaleWidth: 5 })
      // 宽度15，总刻度数为20，刻度宽度为5vp
      Progress({ value: 50, total: 100, type: ProgressType.ScaleRing })
        .style({ strokeWidth: 15, scaleCount: 20, scaleWidth: 5 })
      // 宽度15，总刻度数为20，刻度宽度为3vp
      Progress({ value: 50, total: 100, type: ProgressType.ScaleRing })
        .style({ strokeWidth: 15, scaleCount: 20, scaleWidth: 3 })
      // 圆形样式 默认前景色为蓝色
      Progress({ value: 60, total: 100, type: ProgressType.Eclipse })
        .color(Color.Gray)
      // 胶囊样式
      Progress({ value: 70, total: 100, type: ProgressType.Capsule })
        .width(200)
        .height(50)
        .color(Color.Gray)
        .backgroundColor(Color.Pink)
      Button('点击返回')
        .onClick(() => {
          router.back()
        })
    }
    .width('100%')
  }
}