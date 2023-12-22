import router from '@ohos.router'
@Entry
@Component
struct MenuTest {
  @State select: boolean = true

  @Builder SubMenu() {
    Menu() {
      MenuItem({ content: '复制', labelInfo: 'Ctrl + C' })
      MenuItem({ content: '粘贴', labelInfo: 'Ctrl + V' })
    }
  }

  @Builder MyMenu() {
    Menu() {
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项' })
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项' })
        .enabled(false)
      MenuItem({
        startIcon:$r('app.media.icon'),
        content: '菜单选项',
        endIcon: $r('app.media.icon'),
        // 当builder参数进行配置时，表示与menuItem项绑定了子菜单。鼠标hover在该菜单项时，会显示子菜单。
        // 点击时候不会显示
        builder: this.SubMenu.bind(this)
      })
      MenuItemGroup({ header: '小标题' }) {
        MenuItem({ content: '菜单选项'})
          .selectIcon(true)
          .selected(this.select)
          .onChange((select) => {
            console.log('menuItem select ' + select)
          })
        MenuItem({
          startIcon: $r('app.media.icon'),
          content: '菜单选项',
          endIcon: $r('app.media.icon'),
          builder: this.SubMenu.bind(this)
        })
        MenuItem({
          startIcon: $r('app.media.icon'),
          content: '菜单选项',
          endIcon: $r('app.media.icon')
        })
      }
    }
  }

  build() {
    Column({ space: 10 }) {
      Button('点击弹出菜单')
        .bindMenu([
          {
            value: 'item1',
            action: () => {
              console.log('item1 被点击了')
            }
          },
          {
            value: 'item2',
            action: () => {
              console.log('item2 被点击了')
            }
          },
          {
            value: 'item3',
            action: () => {
              console.log('item3 被点击了')
            }
          }
        ])
      Button('点击弹出自定义菜单')
        .bindMenu(this.MyMenu)
      Button('右键或长按菜单')
        .bindContextMenu(this.MyMenu, ResponseType.LongPress)
      Button('点击返回')
        .onClick(() => {
          router.back()
        })
    }
    .width('100%')
  }
}