//
//  SFMineCoordinator.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/13.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import XCoordinator
import CTMediator

enum MineRoute: Route {
    case mineMain
}
class SFMineCoordinator: NavigationCoordinator<MineRoute> {
    override init(rootViewController: NavigationCoordinator<RouteType>.RootViewController = .init(), initialRoute: RouteType? = nil) {
        super.init(rootViewController: rootViewController, initialRoute: nil)
        trigger(.mineMain)
    }
    
    override func prepareTransition(for route: MineRoute) -> NavigationTransition {
           switch route {
           case .mineMain:
               guard let viewController = CTMediator.sharedInstance()?.mineViewController() else {
                   return .none()
               }
               return .push(viewController)
           }
       }
}
