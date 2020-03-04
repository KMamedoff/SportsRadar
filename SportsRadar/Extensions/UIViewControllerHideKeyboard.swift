//
//  UIViewControllerHideKeyboard.swift
//  SportsRadar
//
//  Created by Kenan Mamedoff on 04/03/2020.
//  Copyright © 2020 Kenan Mamedoff. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardOnInteraction() {
        let tapGesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc fileprivate func hideKeyboard() {
        view.endEditing(true)
    }
}
