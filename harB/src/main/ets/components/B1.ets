/*
* Copyright (C) 2024 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
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
          buildRouterModel( "harb", BuilderNameConstants.HARB_B2, new Object({
            "lib": "harB",
            "source": "B1"
          }), );
        })
    }
    .width('100%')
    .height('100%')
  }
  .title('B1Page')
  .onBackPressed(() => {
    RouterModule.pop();
    return true;
  })
}

const builderName = BuilderNameConstants.HARB_B1;
let builder: WrappedBuilder<[object]> = wrapBuilder(harBuilder);
RouterModule.registerBuilder(builderName, builder);

