//
//  SFDiscoverCoordinator.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/13.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import XCoordinator
import CTMediator

enum DiscoverRoute: Route {
    case discoverMain
    
}


class SFDiscoverCoordinator: NavigationCoordinator<DiscoverRoute> {
    override init(rootViewController: NavigationCoordinator<RouteType>.RootViewController = .init(), initialRoute: RouteType? = nil) {
        super.init(rootViewController: rootViewController, initialRoute: nil)
        trigger(.discoverMain)
    }
    
    override func prepareTransition(for route: DiscoverRoute) -> NavigationTransition {
           switch route {
           case .discoverMain:
               guard let viewController = CTMediator.sharedInstance()?.discoverViewController() else {
                   return .none()
               }
               return .push(viewController)
           }
       }
    
    
}
