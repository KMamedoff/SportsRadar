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

class MainTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(cell: FieldTableViewCell.self)
        tableView.register(cell: InputTableViewCell.self)
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.contentInsetAdjustmentBehavior = .always
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    private func getFieldTableViewCell(for indexPath: IndexPath) -> FieldTableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MainTableViewCellReuseIdentifiers.fieldTableViewCell.rawValue,
            for: indexPath) as? FieldTableViewCell else {
                return FieldTableViewCell()
        }
        
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
        let cell = getFieldTableViewCell(for: indexPath)
        return cell
    }
}
