

import { pageOneTmp } from  '../components/pageOneTmp';
import { pageTwoTmp } from  '../components/pageTwoTmp';
import { pageThreeTmp } from  '../components/pageThreeTmp';

@Entry
@Component
struct Index {

  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  private arr: number[] = [1, 2, 3];


  @Builder
  PageMap(name: string) {
    if (name === "NavDestinationTitle1") {
      pageOneTmp()
    } else if (name === "NavDestinationTitle2") {
      pageTwoTmp()
    } else if (name === "NavDestinationTitle3") {
      pageThreeTmp()
    }
  }

  build() {
    Column(){
      Navigation(this.pageInfos){
        List({ space: 12 }) {
          ForEach(this.arr, (item:string) => {
            ListItem() {
              Text("NavRouter" + item)
                .width("100%")
                .height(72)
                .backgroundColor('#FFFFFF')
                .borderRadius(24)
                .fontSize(16)
                .fontWeight(500)
                .textAlign(TextAlign.Center)
                .onClick(()=>{
                  this.pageInfos.pushPath({ name: "NavDestinationTitle" + item})
                })
            }
          }, (item:string):string => item)
        }
        .width("90%")
        .margin({ top: 12 })
      }.title("鸿蒙路由")
      .mode(NavigationMode.Stack)
      .navDestination(this.PageMap)
      .titleMode(NavigationTitleMode.Mini)
      .hideBackButton(true)
    }.height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5')
  }
}