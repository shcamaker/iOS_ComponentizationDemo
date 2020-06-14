//
//  SFCloudVillageCoordinator.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/13.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import XCoordinator
import CTMediator

enum CloudVillageRoute: Route {
    case cloudVillageMain
}
class SFCloudVillageCoordinator: NavigationCoordinator<CloudVillageRoute> {
    override init(rootViewController: NavigationCoordinator<RouteType>.RootViewController = .init(), initialRoute: RouteType? = nil) {
        super.init(rootViewController: rootViewController, initialRoute: nil)
        trigger(.cloudVillageMain)
    }
    
    override func prepareTransition(for route: CloudVillageRoute) -> NavigationTransition {
           switch route {
           case .cloudVillageMain:
               guard let viewController = CTMediator.sharedInstance()?.cloudVillageViewController() else {
                   return .none()
               }
               return .push(viewController)
           }
       }
}
