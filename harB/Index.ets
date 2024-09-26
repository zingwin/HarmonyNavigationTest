import { BuilderNameConstants } from 'leafrouter';

export function harInit(builderName: string): void {
  // 动态引入要跳转的页面
  switch (builderName) {
    case BuilderNameConstants.HARB_B1:
      import("./src/main/ets/components/B1");
      break;
    case BuilderNameConstants.HARB_B2:
      import("./src/main/ets/components/B2");
      break;
    default:
      break;
  }
}