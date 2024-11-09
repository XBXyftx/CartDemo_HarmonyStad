import ContentCom from '../components/ContentCom'
import PayCom from '../components/PayCom'
import TitleCom from '../components/TitleCom'
import { CartGood, goodList } from '../data/GoodData'
// 标题(显示商品种类)
import { LIGHT_GRAY } from '../data/GoodData'

@Entry
@Component
export default struct Main {
  @State list: CartGood[] = goodList
  build() {
    Column() {
      // 标题
      TitleCom()
      // 内容
      ContentCom()
      // 支付
      PayCom()
    }
    .height('100%')
    .backgroundColor(LIGHT_GRAY)
  }
}

