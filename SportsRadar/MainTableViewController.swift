//
//  MainTableViewController.swift
//  SportsRadar
//
//  Created by Kenan Mamedoff on 02/03/2020.
//  Copyright © 2020 Kenan Mamedoff. All rights reserved.
//

import UIKit

enum MainTableViewCellReuseIdentifiers: String {
    case fieldTableViewCell = "FieldTableViewCell"
    case inputTableViewCell = "InputTableViewCell"
}

enum SportsTypes: String, CaseIterable {
    case football
    case basketball
    case tennis
}

protocol MatchPitchProtocol {
    func setResult(for home: NSNumber, and away: NSNumber)
}

class MainTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
                    
        setupTableView()
        setupNavigationBarController()
    }
    
    private func setupTableView() {
        tableView.register(cell: FieldTableViewCell.self)
        tableView.register(cell: InputTableViewCell.self)
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.contentInsetAdjustmentBehavior = .always
        tableView.allowsSelection = false
        tableView.delaysContentTouches = false
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupNavigationBarController() {
        title = SportsTypes.allCases[tabBarController?.selectedIndex ?? 0].rawValue.capitalized
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    private func getFieldTableViewCell(for indexPath: IndexPath) -> FieldTableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MainTableViewCellReuseIdentifiers.fieldTableViewCell.rawValue,
            for: indexPath) as? FieldTableViewCell else {
                return FieldTableViewCell()
        }
        
        cell.setContent(forSport: SportsTypes.allCases[tabBarController?.selectedIndex ?? 0])
        
        return cell
    }
    
    private func getInputTableViewCell(for indexPath: IndexPath) -> InputTableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MainTableViewCellReuseIdentifiers.inputTableViewCell.rawValue,
            for: indexPath) as? InputTableViewCell else {
                return InputTableViewCell()
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return getFieldTableViewCell(for: indexPath)
        case 1:
            return getInputTableViewCell(for: indexPath)
        default:
            return UITableViewCell()
        }
        
    }
}
