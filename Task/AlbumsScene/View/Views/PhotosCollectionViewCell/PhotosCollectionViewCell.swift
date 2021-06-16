//
//  PhotosCollectionViewCell.swift
//  Task
//
//  Created by Hovo Malkhasyan on 6/16/21.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var labelText: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension PhotosCollectionViewCell {
    public func setData(_ model: PhotosDetailsResponseModel) {
        self.labelText.text = model.url
    }
}
