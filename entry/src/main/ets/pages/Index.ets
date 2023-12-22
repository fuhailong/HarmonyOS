import { ArkUIListModel } from '../model/ArkUIListModel'
import { getModels } from '../model/ArkUIListData'
import router from '@ohos.router'

@Entry
@Component
struct Index {
  private list = getModels()

  build() {
    List() {
      ForEach(this.list, (item: ArkUIListModel) => {
        ListItem() {
          Text(item.title + ' ' + item.subTitle)
            .height(50)
            .onClick(() => {
              let paramsInfo: ArkUIListModel = {
                id: 123,
                title: '我是带过来的参数标题标题',
                subTitle: '带参副标题'
              }

              // router.pushUrl()：目标页不会替换当前页，而是压入页面栈。这样可以保留当前页的状态，并且可以通过返回键或者调用router.back()方法返回到当前页。
              // 页面栈的最大容量为32个页面。如果超过这个限制，可以调用router.clear()方法清空历史页面栈，释放内存空间。
              // router.replaceUrl()：目标页会替换当前页，并销毁当前页。这样可以释放当前页的资源，并且无法返回到当前页。
              router.pushUrl({
                url: 'arkUI/' + item.title + 'Test',
                // 不需要传递参数 params 可以省略
                // 查看接受参数方式，在TextTest.ets里看吧，就不一个一个写了
                params: { key: paramsInfo }
                //  router.RouterMode.Standard 和 err 可以省略
              }, router.RouterMode.Standard, (err) => {
                if (err) {
                  console.error(`Invoke replaceUrl failed, code is ${err.code}, message is ${err.message}`)
                  return
                }
                console.log('Invoke replaceUrl succeeded.')
              })
            })
        }
      }, item => JSON.stringify(item.id))
    }
  }
}