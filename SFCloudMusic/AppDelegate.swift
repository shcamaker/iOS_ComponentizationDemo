//
//  AppDelegate.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/12.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import SFCloudMusicMediatorKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private lazy var mainWindow = UIWindow()
    private lazy var appMediator = SFMediator()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureUI()
        appMediator.setRoot(for: mainWindow)
        return true
    }

    private func configureUI() {
        UIView.appearance().overrideUserInterfaceStyle = .light
    }

}

