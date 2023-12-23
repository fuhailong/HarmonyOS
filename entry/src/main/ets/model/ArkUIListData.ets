import { ArkUIListModel } from './ArkUIListModel'

let arkListUIModels: Array<ArkUIListModel> = [
  {
    id: 1,
    title: 'Text',
    subTitle: '文本'
  },
  {
    id: 2,
    title: 'Button',
    subTitle: '按钮'
  },
  {
    id: 3,
    title: 'TextInputTextArea',
    subTitle: '单行输入框 多上输入框'
  },
  {
    id: 4,
    title: 'Radio',
    subTitle: '单选'
  },
  {
    id: 5,
    title: 'Toggle',
    subTitle: '多选'
  },
  {
    id: 6,
    title: 'Progress',
    subTitle: '进度条'
  },
  {
    id: 7,
    title: 'Dialog',
    subTitle: '弹窗'
  },
  {
    id: 8,
    title: 'Popup',
    subTitle: '气泡'
  },
  {
    id: 9,
    title: 'Menu',
    subTitle: '菜单'
  },
  {
    id: 10,
    title: 'Navigation',
    subTitle: '标题栏'
  },
  {
    id: 11,
    title: 'Tab',
    subTitle: '导航栏'
  },
  {
    id: 12,
    title: 'Image',
    subTitle: '显示图片'
  },
  {
    id: 13,
    title: 'Shape',
    subTitle: '绘制几何图形'
  },
  {
    id: 14,
    title: 'Canvas',
    subTitle: '画布'
  },
  {
    id: 15,
    title: 'Animate',
    subTitle: '布局动画'
  },
  {
    id: 16,
    title: 'Transition',
    subTitle: '组件内转场动画'
  },
]

export function getModels(): Array<ArkUIListModel> {
  return arkListUIModels
}