//
//  RoundedBlueButton.swift
//  SportsRadar
//
//  Created by Kenan Mamedoff on 02/03/2020.
//  Copyright © 2020 Kenan Mamedoff. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedBlueButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        sharedInit()
    }
    
    func sharedInit() {
        backgroundColor = .systemBlue
        setTitleColor(.white, for: .normal)
        setTitleColor(.lightText, for: .highlighted)
        
        isExclusiveTouch = true
        layer.cornerRadius = 12
    }
}
