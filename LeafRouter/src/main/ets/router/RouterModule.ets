import { RouterModel } from './RouterModel';
import Logger from './RouterLogger';


export class RouterModule {
  static builderMap: Map<string, WrappedBuilder<[object]>> = new Map<string, WrappedBuilder<[object]>>();
  static router:  NavPathStack = new  NavPathStack();

  // Registering a builder by name.
  public static registerBuilder(pageName: string, builder: WrappedBuilder<[object]>): void {
    const hasBuilder = RouterModule.builderMap.get(pageName);
    if(hasBuilder == null || hasBuilder == undefined){
      RouterModule.builderMap.set(pageName, builder);
    }
  }

  // Get builder by name.
  public static getBuilder(pageName: string): WrappedBuilder<[object]> {
    const builder = RouterModule.builderMap.get(pageName);
    if (!builder) {
      Logger.info('not found builder ' + pageName);
    }
    return builder as WrappedBuilder<[object]>;
  }

  // Registering a router by name.
  public static addRouterInterception(): void {
    RouterModule.router.setInterception({
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

  // Jumping to a Specified Page by Obtaining the Page Stack.
  public static async push(router: RouterModel): Promise<void> {
    try{
      await import(router.harName).then((ns: ESObject): Promise<void> => {
        return ns.harInit(router.pageName);
      });
      RouterModule.router.pushPath({ name: router.pageName, param: router.param });
    } catch (e) {
      console.log("push error ${e}");
    }
  }

  // Obtain the page stack and pop it.
  public static pop(): void {
    // Find the corresponding route stack for pop.
    RouterModule.router.pop();
  }

  // Get the page stack and clear it.
  public static clear(): void {
    // Find the corresponding route stack for pop.
    RouterModule.router.clear();
  }

  // Directly jump to the specified route.
  public static popToName( builderName: string): void {
    RouterModule.router.popToName(builderName);
  }
}

