//
//  SFAccountCoordinator.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/13.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import XCoordinator
import CTMediator

enum AccountRoute: Route {
    case accountMain
}
class SFAccountCoordinator: NavigationCoordinator<AccountRoute> {
    override init(rootViewController: NavigationCoordinator<RouteType>.RootViewController = .init(), initialRoute: RouteType? = nil) {
        super.init(rootViewController: rootViewController, initialRoute: nil)
        trigger(.accountMain)
    }
    
    override func prepareTransition(for route: AccountRoute) -> NavigationTransition {
           switch route {
           case .accountMain:
               guard let viewController = CTMediator.sharedInstance()?.accountViewController() else {
                   return .none()
               }
               return .push(viewController)
           }
       }
}
