@Entry
@Component
struct NavigationTest {
  private arr: number[] = [1, 2, 3]

  build() {
    Column() {
      Navigation() {
        TextInput({ placeholder: 'search...' })
          .width('90%')
          .height(40)
          .backgroundColor('#ffffff')
        List({ space: 12 }) {
          ForEach(this.arr, (item) => {
            ListItem() {
              NavRouter() {
                Text('NavRouter' + item)
                  .width('100%')
                  .height(72)
                  .backgroundColor('#ffffff')
                  .borderRadius(24)
                  .fontSize(16)
                  .fontWeight(500)
                  .textAlign(TextAlign.Center)
                NavDestination() {
                  Text('NavDestrinationContent' + item)
                }
                .backgroundColor(Color.Gray)
                .title('NavDestinationTitle' + item)
              }
            }
          }, item => item)
        }
        .width('90%')
        .margin({ top: 12 })
      }
      .title('主标题')
      // Mini 普通标题栏，用于页面不需要突出标题的场景 所以使用mini模式下 会自带一个返回箭头
      // 可以使用hideBackButton隐藏掉
      // 通过 router 进来的 mini 模式 返回按钮自带 back 功能，无需额外添加
      // Full 强调型标题栏，用于一级页面需要突出标题的场景
      .titleMode(NavigationTitleMode.Mini)
      // 默认为 Auto 模式，此模式下，自适应，当宽度大于520vp时，Navigation组件采用分栏模式，反之采用单页面模式
      // Stack 单页面模式 Split 分栏模式
      .mode(NavigationMode.Auto)
      // 设置菜单栏 竖屏时 当个数大于3个时，从第三个开始组合在一起， 横屏时最多现实5个
      .menus([
        {
          value: '',
          icon: '../../resources/base/media/icon.png',
          action: () => {}
        },
        {
          value: '',
          icon: '../../resources/base/media/icon.png',
          action: () => {}
        },
        {
          value: '',
          icon: '../../resources/base/media/icon.png',
          action: () => {}
        },
        {
          value: '',
          icon: '../../resources/base/media/icon.png',
          action: () => {}
        },
        {
          value: '',
          icon: '../../resources/base/media/icon.png',
          action: () => {}
        }
      ])
      // 设置工具栏
      .toolBar({
        items: [
          {
            value: 'func',
            icon: '../../resources/base/media/icon.png',
            action: () => {}
          },
          {
            value: 'func',
            icon: '../../resources/base/media/icon.png',
            action: () => {}
          },
          {
            value: 'func',
            icon: '../../resources/base/media/icon.png',
            action: () => {}
          }
        ]
      })
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#f1f3f5')
  }
}