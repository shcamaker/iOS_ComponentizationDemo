//
//  BindableType.swift
//  RXDemo
//
//  Created by Alex.Shen on 1/14/20.
//  Copyright © 2020 沈海超. All rights reserved.
//

import Foundation

import UIKit

protocol BindableType {
    associatedtype ViewModelType

    var viewModel: ViewModelType! { get set }

    func bindViewModel()
}

extension BindableType where Self: UIViewController {
    mutating func bind(to model: Self.ViewModelType) {
        viewModel = model
        if #available(iOS 9.0, *) {
            loadViewIfNeeded()
        } else {
            
        }
        bindViewModel()
    }
}

extension BindableType where Self: UITableViewCell {
    mutating func bind(to model: Self.ViewModelType) {
        viewModel = model
        bindViewModel()
    }
}

extension BindableType where Self: UICollectionViewCell {
    mutating func bind(to model: Self.ViewModelType) {
        viewModel = model
        bindViewModel()
    }
}
