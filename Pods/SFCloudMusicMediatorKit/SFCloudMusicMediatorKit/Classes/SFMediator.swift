//
//  SFMediator.swift
//  SFCloudMusicMediatorKit_Example
//
//  Created by Alex.Shen on 2/27/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

public class SFMediator: NSObject {
   private let router = SFAppCoordinator().strongRouter
   public override init() {
        
    }
   public func setRoot(for window: UIWindow) {
        router.setRoot(for: window)
    }
}
