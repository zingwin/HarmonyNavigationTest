
import {RouterModule} from './RouterModule';

export class RouterModel{
  // 模块名字，如果为null 就是主模块
  harName: string = "";
  // 页面名称 格式${pagePath}_${pageName}.
  pageName: string = "";
  //页面传递的参数对象
  param?: object = new Object();
}

export function buildRouterModel( harName: string ,pageName: string  , param?: object) {
  let router: RouterModel = new RouterModel();
  router.harName = harName;
  router.pageName = pageName;
  router.param = param;
  RouterModule.push(router);
}

