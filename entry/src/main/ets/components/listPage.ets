import { RouterModule } from "leafrouter"

@Component
export struct ListPage {

  build() {
    NavDestination() {
      Column() {
        Text("Entry ListPage")
      }.width('100%').height('100%')
    }.title("ListPage")
    .onBackPressed(() => {
      RouterModule.pop();
      return true
    })
  }
}
