import router from '@ohos.router'
@Entry
@Component
struct SharedTransitionTest1 {
  build() {
    Column({ space: 10 }) {
      Button('点击返回')
        .onClick(() => {
          router.back()
        })
      Text('SharedTranstion dest page')
        .sharedTransition('text', { duration: 300, curve: Curve.Linear, type: SharedTransitionEffectType.Static })
      Image($r('app.media.icon'))
        .width(100)
        .height(100)
        .sharedTransition('sharedImage', { duration: 500, curve: Curve.Linear })
    }
    .width('100%')
  }
}