import { RouterModel } from './RouterModel';
import Logger from './RouterLogger';


export class RouterModule {
  static builderMap: Map<string, WrappedBuilder<[object]>> = new Map<string, WrappedBuilder<[object]>>();
  static routerMap: Map<string, NavPathStack> = new Map<string, NavPathStack>();

  // Registering a builder by name.
  public static registerBuilder(builderName: string, builder: WrappedBuilder<[object]>): void {
    RouterModule.builderMap.set(builderName, builder);
  }

  // Get builder by name.
  public static getBuilder(builderName: string): WrappedBuilder<[object]> {
    const builder = RouterModule.builderMap.get(builderName);
    if (!builder) {
      Logger.info('not found builder ' + builderName);
    }
    return builder as WrappedBuilder<[object]>;
  }

  // Registering a router by name.
  public static createRouter(routerName: string, router: NavPathStack): void {
    RouterModule.routerMap.set(routerName, router);
    router.setInterception({
      willShow: (from: NavDestinationContext | "navBar", to: NavDestinationContext | "navBar",
        operation: NavigationOperation, animated: boolean) => {
        if (typeof to === "string") {
          console.log("target page is navigation home page.");
          return;
        }
        // 将跳转到PageTwo的路由重定向到PageOne
        let target: NavDestinationContext = to as NavDestinationContext;
        let t = target.pathInfo.name;
        console.log("路由拦截-willShow ${t}");
      },
      didShow: (from: NavDestinationContext | NavBar, to: NavDestinationContext | NavBar, operation: NavigationOperation, isAnimated: boolean) => {
        console.log("路由拦截-didShow");
      },
      modeChange: (mode: NavigationMode) => {
        console.log("路由拦截modeChange");
      }
    })
  }

  // Get router by name.
  public static getRouter(routerName: string): NavPathStack {
    return RouterModule.routerMap.get(routerName) as NavPathStack;
  }

  // Jumping to a Specified Page by Obtaining the Page Stack.
  public static async push(router: RouterModel): Promise<void> {
    try{
      if(router.harName != null){
        await import(router.harName).then((ns: ESObject): Promise<void> => {
          return ns.harInit(router.pageName);
        });
      }else{
        const pagePath = router.pageName.split('_')[0];
        await import(pagePath);
      }
      RouterModule.getRouter(router.routerName).pushPath({ name: router.pageName.split('_')[1], param: router.param });
    } catch (e) {
      console.log("push error ${e}");
    }
  }

  // Obtain the page stack and pop it.
  public static pop(routerName: string): void {
    // Find the corresponding route stack for pop.
    RouterModule.getRouter(routerName).pop();
  }

  // Get the page stack and clear it.
  public static clear(routerName: string): void {
    // Find the corresponding route stack for pop.
    RouterModule.getRouter(routerName).clear();
  }

  // Directly jump to the specified route.
  public static popToName(routerName: string, builderName: string): void {
    RouterModule.getRouter(routerName).popToName(builderName);
  }
}

