// 支付（最下方组件）
import { MAIN_RED } from '../data/GoodData'
import PriceCom from './PriceCom'

@Component
export default struct PayCom {
  @Link selectedIds:string[]
  @Prop totalPrice:number
  @Prop totalNum:number
  build() {
    Row() {
      Row() {
        CheckboxGroup({
          group: 'cart'
        })
          .selectedColor(MAIN_RED)
          .onChange((event)=>{
            console.log('选中了'+JSON.stringify(event.name))
            this.selectedIds = event.name
          })

        Text('全选')
          .fontSize(12)
      }

      Row() {
        Text('合计:')
          .fontSize(14)
        PriceCom({
          fontColor: Color.Black,
          price: this.totalPrice
        })
        Button(`入会结算(${this.totalNum})`)
          .fontColor('#ffe3cc')
          .backgroundColor(Color.Black)
          .fontSize(14)
          .margin({ left: 5 })
      }

    }
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({ left: 10, right: 10 })
    .height(48)
    .width('100%')
    .backgroundColor(Color.White)
  }
}