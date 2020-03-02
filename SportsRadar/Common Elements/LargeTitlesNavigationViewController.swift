//
//  LargeTitlesNavigationViewController.swift
//  SportsRadar
//
//  Created by Kenan Mamedoff on 02/03/2020.
//  Copyright © 2020 Kenan Mamedoff. All rights reserved.
//

import UIKit

@IBDesignable
class LargeTitlesNavigationViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup() {
        navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithDefaultBackground()
        navigationBar.standardAppearance = navBarAppearance
        navigationBar.compactAppearance = navBarAppearance
        navigationBar.scrollEdgeAppearance = navBarAppearance
    }
}
