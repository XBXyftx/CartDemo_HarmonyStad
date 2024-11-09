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
  @State @Watch('sumHandler') selectedIds:string[]=[]
  @Provide totalPrice:number = 0
  @Provide totalNum:number = 0

  onPageShow(): void {
    this.sumHandler()
  }

  sumHandler(){
    let totalPrice:number = 0//总价
    let totalNum:number = 0//总数量
    totalNum = this.list.reduce((a,b)=>{
      return a+b.count
    },0)
    totalPrice = this.list.reduce((a,b)=>{
      return a+b.count*b.good.jdPrice
    },0)
    this.totalPrice=totalPrice
    this.totalNum=totalNum
  }
  build() {
    Column() {
      // 标题
      TitleCom({
        length:this.list.length
      })
      // 内容
      ContentCom({
        list:this.list,
        resetNums(){
          this.sumHandler()
        }
      })
      // 支付
      PayCom({
        selectedIds:this.selectedIds,
        totalPrice:this.totalPrice,
        totalNum:this.totalNum
      })
    }
    .height('100%')
    .backgroundColor(LIGHT_GRAY)
  }
}

