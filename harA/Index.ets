import { BuilderNameConstants } from 'leafrouter';

export function harInit(builderName: string): void {
  // 动态引入要跳转的页面
  switch (builderName) {
    case BuilderNameConstants.HARA_A1:
      import("./src/main/ets/components/A1");
      break;
    case BuilderNameConstants.HARA_A2:
      import("./src/main/ets/components/A2");
      break;
    default:
      break;
  }
}
