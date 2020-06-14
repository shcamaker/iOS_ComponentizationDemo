//
//  CTMediator+Account.swift
//  SFCloudMusic
//
//  Created by Alex.Shen on 2/27/20.
//  Copyright © 2020 沈海超. All rights reserved.
//

import CTMediator

private let accountKitName = "SFCloudMusicAccountKit"
private let accountTargetName = "Account"
private let accountViewControllerActionName = "accountViewController"

public extension CTMediator {
    func accountViewController() -> UIViewController? {
        let params = [kCTMediatorParamsKeySwiftTargetModuleName:accountKitName] as [AnyHashable:Any]
         let viewController = self.performTarget(accountTargetName, action: accountViewControllerActionName, params: params, shouldCacheTarget: false) as? UIViewController
        return viewController
    }
}

