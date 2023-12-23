
@Entry
@Component
struct TabTest {
  private tabsController: TabsController = new TabsController()
  @State currentIndex: number = 0

  @Builder TabBuilder(title: string, targetIndex: number, selectedImage: Resource, normalImage: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImage : normalImage)
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#1698ce' : '#6b6b6b')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex
      this.tabsController.changeIndex(this.currentIndex)
    })
  }

  build() {
    /*
    // 默认只有两种 顶部也底部
    Tabs({ barPosition: BarPosition.End }) {
      TabContent() {
        Column() {
          Text('首页内容区')
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor(Color.Pink)
      }
      .tabBar('首页')
      TabContent() {
        Text('发现页内容区')
      }
      .tabBar('发现页')
      TabContent() {
        Text('推荐页内容区')
      }
      .tabBar('推荐页')
      TabContent() {
        Text('我的页内容区')
      }
      .tabBar('我的页')
      TabContent() {
        Column() {
          Text('首页内容区')
        }
        .width('100%')
        .height('100%')
        .backgroundColor(Color.Pink)
      }
      .tabBar('首页')
      TabContent() {
        Text('发现页内容区')
      }
      .tabBar('发现页')
      TabContent() {
        Text('推荐页内容区')
      }
      .tabBar('推荐页')
      TabContent() {
        Text('我的页内容区')
      }
      .tabBar('我的页')
    }
    // 如果设置 tabs 为垂直方向， 则会有左边或右边，用于适配 pad 或者横屏模式
    // .vertical(true)
    .barWidth('100%')
    .barHeight(45)
    // 如果 tabContent 很多，fix模式会都挤到一屏里，会有显示不全的情况，最好用scrollable
    .barMode(BarMode.Scrollable)
    */

    // 自定义导航栏
    Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
      TabContent() {
        Column() {
          Text('首页内容区')
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor(Color.Pink)
      }
      .tabBar(this.TabBuilder('首页', 0, $r('app.media.icon'), $r('app.media.icon')))
      TabContent() {
        Column() {
          Text('其他页内容区')
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor(Color.Gray)
      }
      .tabBar(this.TabBuilder('其他', 1, $r('app.media.icon'), $r('app.media.icon')))
    }
    // 滑动切换要监听change事件，以便修改currentIndex
    .onChange((index) => {
      this.currentIndex = index
    })
  }
}