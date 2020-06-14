//
//  SFLoginViewModel.swift
//  RXDemo
//
//  Created by Alex.Shen on 1/14/20.
//  Copyright © 2020 沈海超. All rights reserved.
//

import Action
import RxSwift

class SFLoginViewModel: NSObject {
    private(set) lazy var loginTrigger = loginAction.inputs
    
    var loginBlock:(() -> (Observable<Void>))
    
    private lazy var loginAction = CocoaAction { [unowned self] in
        self.loginBlock()
    }
    
    init(loginBlock: @escaping () -> (Observable<Void>)) {
        self.loginBlock = loginBlock
    }

}
