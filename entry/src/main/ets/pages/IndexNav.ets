


import { BuilderNameConstants, buildRouterModel, RouterModule, RouterNameConstants } from '../router/RouterIndex';

@Entry
@Component
struct EntryHap {
  @State entryHapRouter: NavPathStack = new NavPathStack();

  aboutToAppear() {
    if (!this.entryHapRouter) {
      this.entryHapRouter = new NavPathStack();
    }
    RouterModule.createRouter(RouterNameConstants.ENTRY_HAP, this.entryHapRouter);
  };

  @Builder
  routerMap(builderName: string, param: object) {
    RouterModule.getBuilder(builderName).builder(param);
  };

  build() {
    Navigation(this.entryHapRouter) {
      Button("to A1", { stateEffect: true, type: ButtonType.Capsule })
        .width('80%')
        .height(40)
        .margin(20)
        .onClick(() => {
          buildRouterModel(RouterNameConstants.ENTRY_HAP, "../pages/A1_A1", new Object({
            origin: 'Entry',
            postId: "122132323"
          }));
        })
      Button("to A2", { stateEffect: true, type: ButtonType.Capsule })
        .width('80%')
        .height(40)
        .margin(20)
        .onClick(() => {
          buildRouterModel(RouterNameConstants.ENTRY_HAP, "../pages/A2_A2", new Object({
            origin: 'Entry',
            postId: "4323rsdafsdfasdf"
          }));
        })
    }
    .title('NavIndex')
    .navDestination(this.routerMap);
  }
}


export function harInit(builderName: string): void {
  // 动态引入要跳转的页面
  switch (builderName) {
    case BuilderNameConstants.A1Page:
      import("./A1");
      break;
    case BuilderNameConstants.A2Page:
      import("./A2");
      break;
    default:
      break;
  }
}