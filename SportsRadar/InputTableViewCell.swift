//
//  InputTableViewCell.swift
//  SportsRadar
//
//  Created by Kenan Mamedoff on 02/03/2020.
//  Copyright © 2020 Kenan Mamedoff. All rights reserved.
//

import UIKit

class InputTableViewCell: UITableViewCell, UITextFieldDelegate, MatchPitchProtocol {
    @IBOutlet weak var homeScoreTextField: UITextField!
    @IBOutlet weak var awayScoreTextField: UITextField!
    
    let scoreLabel = LabelWithAnimatedText()
    
    override func awakeFromNib() {
        super.awakeFromNib()
                
        homeScoreTextField.delegate = self
        awayScoreTextField.delegate = self
        
        setupScoreLabelUI()
    }
    
    private func setupScoreLabelUI() {
        contentView.addSubview(scoreLabel)

        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        scoreLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    @IBAction func setScoreAction(_ sender: RoundedBlueButton) {
        endEditing(true)
        
        guard let homeScore = homeScoreTextField.text else {
            return
        }
        
        guard let awayScore = awayScoreTextField.text else {
            return
        }
        
        let home = NumberFormatter().number(from: homeScore) ?? 0
        let away = NumberFormatter().number(from: awayScore) ?? 0

        setResult(for: home, and: away)
    }
    
    func setResult(for home: NSNumber, and away: NSNumber) {
        scoreLabel.text = home.stringValue + " : " + away.stringValue
    }
}

extension InputTableViewCell {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }
}

class LabelWithAnimatedText: UILabel {
    override var text: String? {
        didSet {
            animateLabel()
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        self.commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.commonInit()
    }
    
    func commonInit(){
        self.backgroundColor = .clear
        self.textColor = UIColor.red
        self.font = UIFont.boldSystemFont(ofSize: 50.0)
    }
    
    private func animateLabel() {
        UIView.animate(withDuration: 0.6) {
            self.alpha = 0.2
        }
    }
}
