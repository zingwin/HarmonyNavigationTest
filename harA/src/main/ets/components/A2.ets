import { BuilderNameConstants, buildRouterModel, RouterModule, } from 'leafrouter';

@Builder
export function harBuilder(value: object) {
  NavDestination() {
    Column() {
      Button("to B2", { stateEffect: true, type: ButtonType.Capsule })
        .width('80%')
        .height(40)
        .margin(20)
        .onClick(() => {
          buildRouterModel( 'harb',BuilderNameConstants.HARB_B2,new Object(), );
        })
      Button("back", { stateEffect: true, type: ButtonType.Capsule })
        .width('80%')
        .height(40)
        .margin(20)
        .onClick(() => {
          RouterModule.pop();
        })
    }
    .width('100%')
    .height('100%')
  }
  .title('A2Page')
  .onBackPressed(() => {
    RouterModule.pop();
    return true;
  })
}

const builderName = BuilderNameConstants.HARA_A2;
let builder: WrappedBuilder<[object]> = wrapBuilder(harBuilder);
RouterModule.registerBuilder(builderName, builder);

