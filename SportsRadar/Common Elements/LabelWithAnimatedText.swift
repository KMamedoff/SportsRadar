//
//  LabelWithAnimatedText.swift
//  SportsRadar
//
//  Created by Kenan Mamedoff on 02/03/2020.
//  Copyright © 2020 Kenan Mamedoff. All rights reserved.
//

import UIKit

class LabelWithAnimatedText: UILabel {
    override var text: String? {
        didSet {
            animateLabel()
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    func commonInit(){
        self.backgroundColor = .clear
        self.textColor = UIColor.red
        self.font = UIFont.boldSystemFont(ofSize: 50.0)
    }
    
    private func animateLabel() {
        
        self.frame.origin.x = UIScreen.main.bounds.minX - self.frame.width
        
        UIView.animateKeyframes(withDuration: 2, delay: 0.1, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.33) {
                self.frame.origin.x = UIScreen.main.bounds.midX
            }
            UIView.addKeyframe(withRelativeStartTime: 0.33, relativeDuration: 0.33) {
                self.frame.origin.x = UIScreen.main.bounds.midX
            }
            UIView.addKeyframe(withRelativeStartTime: 0.66, relativeDuration: 0.34) {
                self.frame.origin.x = UIScreen.main.bounds.maxX
            }
        })
        
        
        
        
        
    }
}
