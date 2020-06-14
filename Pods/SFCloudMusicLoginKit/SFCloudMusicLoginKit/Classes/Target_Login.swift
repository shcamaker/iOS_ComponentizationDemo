//
//  Target_Login.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/23.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import RxSwift

@objc class Target_Login: NSObject {

   @objc func Action_loginViewController(_ params: NSDictionary) -> UIViewController? {
        let bundle = Bundle(for: Target_Login.self)
        let storyboard = UIStoryboard(name: "Login", bundle: bundle)
        var viewController = storyboard.instantiateViewController(withIdentifier: "SFLoginViewController") as? SFLoginViewController
        guard let loginBlock = params["callback"] as? () -> (Observable<Void>) else {
            return nil
        }
        let viewModel = SFLoginViewModel(loginBlock: loginBlock)
        viewController?.bind(to: viewModel)
        return viewController
    }
}
