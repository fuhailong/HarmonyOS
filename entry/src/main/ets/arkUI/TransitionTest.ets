import router from '@ohos.router'
@Entry
@Component
struct TransitionTest {
  @State flag: boolean = true;
  @State show: string = 'show';

  build() {
    // transition 必须和 animateTo 一起使用才能产生组件转场效果
    Column({ space: 10 }) {
      Button('点击返回')
        .onClick(() => {
          router.back()
        })
      Button(this.show).width(80).height(30).margin(30)
        .onClick(() => {
          if (this.flag) {
            this.show = 'hide'
          } else {
            this.show = 'show'
          }
          animateTo({ duration: 1000 }, () => {
            // 点击Button控制Image的显示和消失
            this.flag = !this.flag
          })
        })
      if (this.flag) {
        Image($r('app.media.icon')).width(200).height(200)
          .transition({ type: TransitionType.Insert, translate: { x: 200, y: -200 } })
          .transition({ type: TransitionType.Delete, opacity: 0, scale: { x: 0, y: 0 } })
      }

      /*
       * ForEach产生组件内转场动画
       * 1.ForEach里的组件必须配置了transition效果
       * 2.在触发动画的地方，必须使用animateTo，闭包中控制组件的插入或删除，即控制数组的元素添加和删除。
       * */
    }
    .width('100%')
  }
}