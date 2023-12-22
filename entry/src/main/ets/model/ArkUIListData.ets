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
  }
]

export function getModels(): Array<ArkUIListModel> {
  return arkListUIModels
}