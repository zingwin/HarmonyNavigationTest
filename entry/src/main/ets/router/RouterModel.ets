
import {RouterModule} from './RouterModule';

export class RouterModel{
  // 模块名字，如果为null 就是主模块
  harName?: string|null;
  // 页面名称 格式${pagePath}_${pageName}.
  pageName: string = "";
  // 路由栈名
  routerName: string = "";
  //页面传递的参数对象
  param?: object = new Object();
}

export function buildRouterModel(routerName: string, pageName: string,  param?: object, harName?: string|null) {
  let router: RouterModel = new RouterModel();
  router.harName = harName;
  router.pageName = pageName;
  router.routerName = routerName;
  router.param = param;
  RouterModule.push(router);
}

