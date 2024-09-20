import { buildRouterModel, RouterModule,RouterNameConstants,BuilderNameConstants } from '../router/RouterIndex';

@Builder
export function harBuilder(value: object) {
  NavDestination() {
    A2()
  }.title("A2 page")
}

@Component
struct A2{
  aboutToAppear(): void {
    let x =  RouterModule.getRouter(RouterNameConstants.ENTRY_HAP);
    let p = x.getParamByIndex(0) as Map<String, object>;
    let postId = p['postId'] as string | null;
    console.log("a2 aboutToAppear");
  }

  build() {
    Column(){
      Text("我是A2页面")
      Button("返回", { stateEffect: true, type: ButtonType.Capsule })
        .width('80%')
        .height(40)
        .margin(20)
        .onClick(() => {
          buildRouterModel(RouterNameConstants.ENTRY_HAP, BuilderNameConstants.A2Page, new Object({
            origin: 'Entry'
          }));
        })
    }
  }
}

// 在页面首次加载时触发执行
let pageName = "A2";
// 判断表中是否已存在路由信息，避免重复注册
if (!RouterModule.getBuilder(pageName)) {
  // 通过系统提供的wrapBuilder接口封装@Builder装饰的方法，生成harB1页面builder
  let builder: WrappedBuilder<[object]> = wrapBuilder(harBuilder);
  // 注册harB1页面到全局路由表
  RouterModule.registerBuilder(pageName, builder);
}