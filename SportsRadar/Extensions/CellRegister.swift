//
//  CellRegister.swift
//  SportsRadar
//
//  Created by Kenan Mamedoff on 02/03/2020.
//  Copyright © 2020 Kenan Mamedoff. All rights reserved.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(cells: [T.Type]) {
        cells.forEach { self.register(cell: $0) }
    }
    
    func register<T: UITableViewCell>(cell: T.Type) {
        let className = String(describing: cell)
        registerNib(named: className, forCellReuseIdentifier: className)
    }
    
    func registerNib(named: String, forCellReuseIdentifier reuseIdentifier: String) {
        let nib = UINib(nibName: named, bundle: nil)
        register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func dequeue<T: UITableViewCell>(cell: T.Type) -> T? {
        let className = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: className) as? T
    }
}
