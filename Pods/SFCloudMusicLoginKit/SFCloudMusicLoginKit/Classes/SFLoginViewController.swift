 //
//  SFLoginViewController.swift
//  RXDemo
//
//  Created by Alex.Shen on 1/14/20.
//  Copyright © 2020 沈海超. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Action
 
 private let minimalUsernameLength = 5
 private let minimalPasswordLength = 5
 
class SFLoginViewController: UIViewController, BindableType {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var usernameValidLabel: UILabel!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var passwordValidLabel: UILabel!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    var viewModel: SFLoginViewModel!
    private let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameValidLabel.text = "用户名长度至少包含 \(minimalUsernameLength) 字符"
        passwordValidLabel.text = "密码长度至少包含 \(minimalPasswordLength) 字符"

    }
    
    func bindViewModel() {
        let usernameValid = usernameTextField.rx.text.orEmpty
                   .map { $0.count >= minimalUsernameLength }
                   .share(replay: 1)

        let passwordValid = passwordTextField.rx.text.orEmpty
                   .map { $0.count >= minimalPasswordLength }
                   .share(replay: 1)

        let everythingValid = Observable.combineLatest(usernameValid, passwordValid) { $0 && $1 }
                   .share(replay: 1)

        usernameValid
                   .bind(to: passwordTextField.rx.isEnabled)
                   .disposed(by: disposeBag)

        usernameValid
                   .bind(to: usernameValidLabel.rx.isHidden)
                   .disposed(by: disposeBag)

        passwordValid
                   .bind(to: passwordValidLabel.rx.isHidden)
                   .disposed(by: disposeBag)

        everythingValid
                   .bind(to: loginButton.rx.isEnabled)
                   .disposed(by: disposeBag)

        loginButton.rx.tap
            .bind(to: viewModel.loginTrigger)
            .disposed(by: disposeBag)
    }
   
}
