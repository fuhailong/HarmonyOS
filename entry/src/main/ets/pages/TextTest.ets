@Entry
@Component
struct Texttest {
  build() {
    Column({ space: 10 }) {
      Text('我是一个文本')
      // 带子组件的文本 Span只能是Text的子组件显示内容
      // Span组件需要写到Text组件内，单独写Span组件不会显示信息，Text与Span同时配置文本内容内容时，Span内容覆盖Text内容。
      Text('123') {
        Span('abc')
        Span('\n')
        Span('def')
      }
      .backgroundColor(Color.Gray)
      .fontSize(30)
      .fontColor(Color.Red)

      Text() {
        Span('我是Span1')
          .fontSize(16)
          .fontColor(Color.Gray)
          .decoration({ type: TextDecorationType.LineThrough, color: Color.Red })
        Span('我是Span2')
          .fontSize(16)
          .fontColor(Color.Gray)
          .decoration({ type: TextDecorationType.Underline, color: Color.Black })
        Span('我是Span3')
          .fontSize(16)
          .fontColor(Color.Gray)
          .decoration({ type: TextDecorationType.Overline, color: Color.Green })
      }
      .borderWidth(1)
      .padding(10)

      // 保持大小写 添加点击事件 对Span同样有效
      Text('abcd')
        .textCase(TextCase.UpperCase)
        .onClick(() => {
          console.log('abcd被点击了')
        })

      // textOverflow属性控制文本超长处理，textOverflow需配合maxLines一起使用（默认情况下文本自动折行）
      Text('我是超长文本，超出的部分不显示。I am an extra long text, with ellipses displayed for any excess。')
        .width(250)
        .textOverflow({ overflow: TextOverflow.None })
        .maxLines(2)
        .fontSize(12)
        .border({ width: 1 })
        .padding(10)
      Text('我是超长文本，超出的部分显示省略号。I am an extra long text, with ellipses displayed for any excess。')
        .width(250)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(1)
        .fontSize(12)
        .border({ width: 1 })
        .padding(10)
      Text('我是超长文本，超出的部分直接切掉。I am an extra long text, with ellipses displayed for any excess。')
        .width(250)
        .textOverflow({ overflow: TextOverflow.Clip })
        .maxLines(1)
        .fontSize(12)
        .border({ width: 1 })
        .padding(10)

      // 通过minFontSize与maxFontSize自适应字体大小，minFontSize设置文本最小显示字号，maxFontSize设置文本最大显示字号，minFontSize与maxFontSize必须搭配同时使用，以及需配合maxline或布局大小限制一起使用，单独设置不生效。
      Text('我的最大字号为30，最小字号为5，宽度为250，maxLines为1')
        .width(250)
        .maxLines(1)
        .maxFontSize(30)
        .minFontSize(5)
        .border({ width: 1 })
        .padding(10)
        .margin(5)
      Text('我的最大字号为30，最小字号为5，宽度为250，maxLines为2')
        .width(250)
        .maxLines(2)
        .maxFontSize(30)
        .minFontSize(5)
        .border({ width: 1 })
        .padding(10)
        .margin(5)
      Text('我的最大字号为30，最小字号为15，宽度为250,高度为50')
        .width(250)
        .height(50)
        .maxFontSize(30)
        .minFontSize(15)
        .border({ width: 1 })
        .padding(10)
        .margin(5)
      Text('我的最大字号为30，最小字号为15，宽度为250,高度为100')
        .width(250)
        .height(100)
        .maxFontSize(30)
        .minFontSize(15)
        .border({ width: 1 })
        .padding(10)
        .margin(5)

      // 可以复制的文本
      Text('可以复制的文本')
        .copyOption(CopyOptions.InApp)

      /*
       * 通过lineHeight属性设置文本行高
       * 通过decoration属性设置文本装饰线样式及其颜色
       * 通过baselineOffset属性设置文本基线的偏移量
       * 通过letterSpacing属性设置文本字符间距
       * 通过textCase属性设置文本大小写
       * Text组件可以添加通用事件，可以绑定onClick、onTouch等事件来响应操作
       * */
    }
    .width('100%')
  }
}