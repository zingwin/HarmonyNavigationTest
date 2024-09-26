


import { BuilderNameConstants, buildRouterModel, RouterModel, RouterModule } from 'leafrouter';
import { ListPage } from '../components/listPage';
import { pageOneTmp } from '../components/pageOneTmp';
import { pageTwoTmp } from '../components/pageTwoTmp';

@Entry
@Component
struct EntryHap {
  @Builder
  routerMap(builderName: string, param: object) {
    if(builderName == "entry_listpage"){
      ListPage();
    }else{
      RouterModule.getBuilder(builderName).builder(param);
    }
  };

  build() {
    Navigation(RouterModule.router) {
      Button("to entery entry_listpage", { stateEffect: true, type: ButtonType.Capsule })
        .width('80%')
        .height(40)
        .margin(20)
        .onClick(() => {
          RouterModule.router.pushPath({name:"entry_listpage"});
        })
      Button("to A1", { stateEffect: true, type: ButtonType.Capsule })
        .width('80%')
        .height(40)
        .margin(20)
        .onClick(() => {
          let routerModel: RouterModel = {
            harName: "hara",
            pageName:BuilderNameConstants.HARA_A1,
            param:new Object({
              origin: 'Entry',
              postId: "4323rsdafsdfasdf"
            })
          };
          RouterModule.push(routerModel);
        })
      Button("to A2", { stateEffect: true, type: ButtonType.Capsule })
        .width('80%')
        .height(40)
        .margin(20)
        .onClick(() => {
          buildRouterModel("hara", BuilderNameConstants.HARA_A2, new Object({
            origin: 'Entry',
            postId: "4323rsdafsdfasdf"
          }));
        })
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
      Button("to B2", { stateEffect: true, type: ButtonType.Capsule })
        .width('80%')
        .height(40)
        .margin(20)
        .onClick(() => {
          let routerModel: RouterModel = {
            harName: "harb",
            pageName:BuilderNameConstants.HARB_B2,
            param:new Object({
              origin: 'Entry',
              postId: "4323rsdafsdfasdf"
            })
          };
          RouterModule.push(routerModel);
        })
    }
    .title('NavIndex')
    .navDestination(this.routerMap);
  }
}