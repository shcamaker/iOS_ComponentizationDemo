//
//  SFAppCoordinator.swift
//  RXDemo
//
//  Created by Alex.Shen on 1/7/20.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import XCoordinator
import RxSwift
import CTMediator

enum AppRoute: Route {
    case login
    case homeTab
}

class SFAppCoordinator: NavigationCoordinator<AppRoute> {
    init() {
        super.init(initialRoute: .login)
    }
    
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
           switch route {
           case .login:
                let viewController = CTMediator.sharedInstance()?.loginViewController { [unowned self] in
                    self.unownedRouter.rx.trigger(.homeTab)
                }
                guard let loginVC = viewController else {
                    return .none()
                }
               return .push(loginVC)
           case .homeTab:
               return .present(SFHomeTabCoordinator())
        }
    }
            
}
