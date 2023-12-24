import router from '@ohos.router'
@Entry
@Component
struct SharedTransitionTest {
  build() {
    Column({ space: 10 }) {
      Button('点击返回')
        .onClick(() => {
          router.back()
        })
      // 实现共享元素转场 需要设置共享元素id
      Image($r('app.media.icon'))
        .width(50)
        .height(50)
        .sharedTransition('sharedImage', { duration: 300, curve: Curve.Linear })
        .onClick(() => {
          router.pushUrl({ url: 'arkUI/SharedTransitionTest1'})
        })
    }
    .width('100%')
  }
}