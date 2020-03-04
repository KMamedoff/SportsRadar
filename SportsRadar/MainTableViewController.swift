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
        
        hideKeyboardOnInteraction()
        setupTableView()
        setupNavigationBarController()
    }
    
    private func setupTableView() {
        tableView.register(cell: FieldTableViewCell.self)
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
        
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh,
                                            target: self,
                                            action: #selector(tableViewReload))
        navigationItem.rightBarButtonItem = refreshButton
    }
    
    @objc private func tableViewReload(sender: UIBarButtonItem) {
        let range = NSMakeRange(0, tableView.numberOfSections)
        let sections = NSIndexSet(indexesIn: range)
        tableView.reloadSections(sections as IndexSet, with: .fade)
    }
    
    // MARK: - Table view data source
    
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getFieldTableViewCell(for: indexPath)
    }
}
