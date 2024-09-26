import { BuilderNameConstants, RouterModel, RouterModule, } from 'leafrouter';

@Builder
export function harBuilder(value: object) {
  NavDestination() {
    Column() {
      Button("to B1", { stateEffect: true, type: ButtonType.Capsule })
        .width('80%')
        .height(40)
        .margin(20)
        .onClick(() => {
          let routerModel: RouterModel = {
            harName: "harb",
            pageName:BuilderNameConstants.HARB_B1,
            param:new Object({
              origin: 'Entry',
              postId: "4323rsdafsdfasdf"
            })
          };
          RouterModule.push(routerModel);
        })
    }
    .width('100%')
    .height('100%')
  }
  .title('A1Page')
  .onBackPressed(() => {
    RouterModule.pop();
    return true;
  })
}

const pageName = "hara_A1";
let builder: WrappedBuilder<[object]> = wrapBuilder(harBuilder);
RouterModule.registerBuilder(pageName, builder);




