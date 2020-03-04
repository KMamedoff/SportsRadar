//
//  FieldTableViewCell.swift
//  SportsRadar
//
//  Created by Kenan Mamedoff on 02/03/2020.
//  Copyright © 2020 Kenan Mamedoff. All rights reserved.
//

import UIKit

class FieldTableViewCell: UITableViewCell, UITextFieldDelegate, MatchPitchProtocol {
    @IBOutlet weak var fieldImageView: UIImageView!
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
        scoreLabel.centerYAnchor.constraint(equalTo: fieldImageView.centerYAnchor).isActive = true
        scoreLabel.centerXAnchor.constraint(equalTo: fieldImageView.centerXAnchor).isActive = true
        scoreLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
        return string.rangeOfCharacter(from: invalidCharacters) == nil
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
        let new = home.stringValue + " : " + away.stringValue
        let old = scoreLabel.text ?? new
        
        scoreLabel.animateLabel(old: old, new: new)
    }
    
    func setContent(forSport sport: SportsTypes) {
        fieldImageView.image = UIImage(named: sport.rawValue.capitalized)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        fieldImageView.image = nil
        homeScoreTextField.text = nil
        awayScoreTextField.text = nil
        scoreLabel.text = nil
    }
}
