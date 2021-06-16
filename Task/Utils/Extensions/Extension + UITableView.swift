//
//  Extension + UITableView.swift
//  Task
//
//  Created by Hovo Malkhasyan on 6/16/21.
//

import UIKit

extension UITableView {
    func registerCellFromXib(cell: UITableViewCell.Type) {
        self.register(UINib(nibName: cell.name, bundle: nil), forCellReuseIdentifier: cell.name)
    }
}
    
