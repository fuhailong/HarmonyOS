import router from '@ohos.router'
@Entry
@Component
struct CustomDialogTest {
  // 创建构造器，与装饰器呼应关联
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({
      okCallBack: this.onOk,
      cancelCallBack: this.onCancel,
    }),
    // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
    alignment: DialogAlignment.Default
  })

  onOk() {
    console.log('确定被点击了')
  }

  onCancel() {
    console.log('取消被点击了')
  }

  build() {
    Flex({ justifyContent: FlexAlign.Center }) {
      Button('点击弹窗')
        .onClick(() => {
          this.dialogController.open()
        })
      Button('点击返回')
        .onClick(() => {
          router.back()
        })
    }
  }
}

// @CustomDialog 装饰器装饰自定义弹窗
@CustomDialog
struct CustomDialogExample {
  // 需要一个controller来管理控制
  controller: CustomDialogController
  cancelCallBack: () => void
  okCallBack: () => void
  // 正常构建UI
  build() {
    Column() {
      Text('我是内容')
        .fontSize(20)
        .margin({ top: 10, bottom: 10 })
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('取消')
          .onClick(() => {
            this.controller.close()
            this.cancelCallBack()
          })
        Button('确定')
          .onClick(() => {
            this.controller.close()
            this.okCallBack()
          })
      }
      .margin({ top: 10, right: 10, bottom: 10, left: 10 })
    }
  }
}