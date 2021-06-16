//
//  TableViewHeader.swift
//  Task
//
//  Created by Hovo Malkhasyan on 6/16/21.
//

import UIKit

class TableViewHeader: UITableViewCell {
    // MARK: - Views
    @IBOutlet weak private var headerText: UILabel!
    
    // MARK: - lifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
    // MARK: - Set data
extension TableViewHeader {
    public func setData(_ model: AlbumDetailResponseModel) {
        self.headerText.text = model.title
    }
}
