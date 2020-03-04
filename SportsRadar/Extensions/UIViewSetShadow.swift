//
//  UIViewSetShadow.swift
//  SportsRadar
//
//  Created by Kenan Mamedoff on 04/03/2020.
//  Copyright © 2020 Kenan Mamedoff. All rights reserved.
//

import UIKit

extension UIView {
    func setShadow(radius: CGFloat = 5,
                   opacity: Float = 1,
                   offset: CGSize = .zero,
                   color: CGColor = UIColor.black.cgColor) {
        
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowColor = color
        layer.rasterizationScale = UIScreen.main.scale
        layer.shouldRasterize = true
    }
}
