# HarmonyOS学习笔记
## 前言
2023年HarmonyOS算是小火了一把，P60的横空出世，让华为手机的热度直逼苹果，由于苹果最近几年实在没有什么拿得出手的新技术，再加上各种负面新闻，以前大排长龙的苹果店，现如今也不是那么的火爆了。反观华为店，由于那个谁谁谁来咱们国家代言一把，再加上各种国货的崛起，热度一直不减，虽然手机真的是一机难抢，但从火爆程度上，依稀看到未来华为鸿蒙的市场前景应该会不错。作为一个iOSer，也应该提前给自己布局布局了，尽管依旧有很多人说鸿蒙是个套壳安卓，但那又怎样，大多数人只关心能找到好的工作就行，尤其现在的互联网不景气，更应该多为自己考虑考虑。以前太忙，现在趁着被裁员的空挡，赶紧弄起来。
### (一) 开发工具
DevEco Studio： [下载地址](https://developer.huawei.com/consumer/cn/deveco-studio/)
#### 使用时，可能遇到的问题：
##### 1. 安装好 DevEco Studio 后，有些小伙伴会遇到：
```
Error: execute install task failed, component ohpm.zip
Error: execute 'ohpm install' failed.
```
这种情况，需要先检查一下自己本地环境是否安装过了 NodeJS ，需要先卸载本地的 NodeJS ,然后通过 DevEco Studio 的提示，安装它指定的版本就可以了。
##### 2. 中文开发界面
File -> Settings -> Plugins -> Other Tools -> Chinese(Simplified) -> 根据提示重启
##### 3. 每次都打开上次关闭工程
文件 -> 搜索(系统) -> 系统设置 -> 启动时重新打开项目
##### 4. 使用 DevEco Studio Git 工具
在菜单栏中，点击 VCS(S) ，启用版本控制集成，点击 Git(G) 菜单，选择管理远程，添加或者克隆。
##### 5. 预览器功能报错
```
Cannot preview this file. Previews are available for files in .ets, .js, .css, .hml, or .visual format, .json files of service widgets, layout.xml, AbilitySlice.java, and Ability.java.
```
使用预览器功能需要选择 `.ets` 文件
### (二) ArkTS 基本组成
每个`.ets`文件都有最少一组 UI 声明，其中包含`装饰器` `自定义组件` `UI描述` 组成，`UI描述` 又包含`系统组件` `属性方法` `事件方法` 等
#### 1. 装饰器
`@Entry` 表示自定义组件为入口组件

`@Component` 自定义可复用的UI单元，可组合其他组件

`@State` 表示组件中的状态变量，状态变量变化会触发 UI 刷新

`@Prop` 与 `@State`组合使用，父组件`@State`和子组件`@Prop`双向绑定，任何一方修改都会影响另一个

`@Link` 与 `@State`组合使用，父组件`@State`和子组件`@Link`单向绑定，父组件修改会影响子组件，子组件修改不会影响父组件

### (三) ArkUI 常用的控件
[常用的控件_传送门](https://github.com/fuhailong/HarmonyOS/tree/master/entry/src/main/ets/ArkUI)


