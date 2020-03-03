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
        willSet {
            self.transform = .identity
            self.transform = CGAffineTransform(translationX: -self.frame.width, y: 0)
        }
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
        UIView.animateKeyframes(withDuration: 4, delay: 0, options: .calculationModeCubic, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
                self.transform = CGAffineTransform(translationX: UIScreen.main.bounds.minX, y: 0)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                let animation = CATransition()
                animation.timingFunction = CAMediaTimingFunction(name:
                    CAMediaTimingFunctionName.easeIn)
                animation.type = CATransitionType.fade
                animation.duration = 0.4
                self.layer.add(animation, forKey: CATransitionType.fade.rawValue)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.transform = CGAffineTransform(translationX: self.frame.width, y: 0)
            }
        })
        
        
        
        
        
        
    }
}
