// 列表项：
import { CartGood, DEEP_GRAY, MAIN_RED } from '../data/GoodData'
import PriceCom from './PriceCom'

@Component
export default struct GoodsListItem {
  @ObjectLink item: CartGood//第二层所以要ObjectLink
  build() {
    Row({ space: 10 }) {
      // 左
      Checkbox({
        group: 'cart'
      })
        .shape(CheckBoxShape.CIRCLE)
        .selectedColor(MAIN_RED)


      // 右
      Row({ space: 8 }) {
        // 商品图片
        Image('https://m.360buyimg.com/mobilecms/s558x558_jfs/t1/188208/35/38739/41823/6515995cF15cdb08a/cf82ab82e3e36eb7.jpg!q50.jpg.webp')
          .width(90)
          .padding(5)
          .border({ width: .5, color: DEEP_GRAY })
          .borderRadius(10)
        //   信息
        Column() {
          // 标题
          Text('商品')
            .maxLines(2)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .fontSize(14)
            .fontWeight(400)
            .width('100%')
          // 价格 + 数量
          Row() {
            Column() {
              // 左
              Row() {
                Image($r('app.media.ic_yhd_hyj'))
                  .width(35)
                PriceCom({ price: 10.00 })
              }

              PriceCom({ discard: true, fontColor: DEEP_GRAY, price: 19.00 })
            }
            .alignItems(HorizontalAlign.Start)

            Blank()

            // 个数 Counter 内置组件
            Counter() {
              Text('2')
            }

            .scale({ x: .8, y: .8 })
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('100%')
        }
        .height(90)
        .justifyContent(FlexAlign.SpaceBetween)
        .layoutWeight(1)
      }
      .layoutWeight(1)
    }
    .padding({ left: 10, top: 10, bottom: 10 })

  }
}