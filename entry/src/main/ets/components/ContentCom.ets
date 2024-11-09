// 内容区域
import { CartGood, DEEP_GRAY } from '../data/GoodData'
import EmptyCom from './EmptyCom'
import FreightCom from './FreightCom'
import GoodsListItem from './GoodsListItem'
import ListTitleCom from './ListTitleCom'

@Component
export default struct ContentCom {
  @Builder
  left() {
    Text('左侧测试')
  }
  resetNums=()=>{

  }

  @Builder
  righ(id: string) {
    Text('删除')
      .fontSize(20)
      .fontColor('#fff')
      .backgroundColor(Color.Red)
      .textAlign(TextAlign.Center)
      .width(100)
      .height('100%')
      .onClick(() => {
        // this.list = []测试并证明Link的联动关系可以直接修改父组件的参数
        this.list = this.list.filter(item => item.id != id) //删除当前的本质是保留其他
        this.resetNums()
      })
  }

  @Link list: CartGood[] //第一层可以用link

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
                  item: item
                })
              }
              .swipeAction({
                // start:this.left,
                end: this.righ(item.id)
              })
            }, (item: CartGood, index: number) => item.id) //将id设为唯一标识
            //为了消除掉ForEach的唯一编码机制带来的影响，更改为用不变的id来取代动态数组编码加id的格式
          }
          .divider({
            strokeWidth: .5,
            startMargin: 10,
            endMargin: 10,
            color: DEEP_GRAY
          })
        }
        .backgroundColor(Color.White)
        .margin({ left: 10, right: 10 })

        if (this.list.length === 0) {
          // 空车 商品为空时显示
          EmptyCom()
        }

      }
    }
    .align(Alignment.Top)
    .padding({ bottom: 10 })
    .edgeEffect(EdgeEffect.Spring)
    .layoutWeight(1)
  }
}
