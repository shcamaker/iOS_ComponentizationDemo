//
//  CTMediator+Video.swift
//  SFCloudMusic
//
//  Created by Alex.Shen on 2/27/20.
//  Copyright © 2020 沈海超. All rights reserved.
//

import CTMediator

private let videoKitName = "SFCloudMusicVideoKit"
private let videoTargetName = "Video"
private let videoViewControllerActionName = "videoViewController"

public extension CTMediator {
    func videoViewController() -> UIViewController? {
        let params = [kCTMediatorParamsKeySwiftTargetModuleName:videoKitName] as [AnyHashable:Any]
         let viewController = self.performTarget(videoTargetName, action: videoViewControllerActionName, params: params, shouldCacheTarget: false) as? UIViewController
        return viewController
    }
}

