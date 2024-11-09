// 内容区域
import { CartGood, DEEP_GRAY } from '../data/GoodData'
import EmptyCom from './EmptyCom'
import FreightCom from './FreightCom'
import GoodsListItem from './GoodsListItem'
import ListTitleCom from './ListTitleCom'

@Component
export default struct ContentCom {
  @Link list:CartGood[]//第一层可以用link
  build() {
    Scroll() {
      Column() {
        // 支付
        FreightCom()
          .margin(10)
        // 商品列表
        Column({ space: 10 }) {
          ListTitleCom()
          // 自营区域
          List() {
            ForEach(this.list, (item: CartGood, index: number) => {
              ListItem() {
                GoodsListItem({
                  item:item
                })
              }
            })
          }
          .divider({ strokeWidth: .5, startMargin: 10, endMargin: 10, color: DEEP_GRAY })
        }
        .backgroundColor(Color.White)
        .margin({ left: 10, right: 10 })

        // 空车 商品为空时显示
        EmptyCom()
      }
    }
    .align(Alignment.Top)
    .padding({ bottom: 10 })
    .edgeEffect(EdgeEffect.Spring)
    .layoutWeight(1)
  }
}
