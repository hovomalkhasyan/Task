//
//  PhotosCollectionViewCell.swift
//  Task
//
//  Created by Hovo Malkhasyan on 6/16/21.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    // MARK: - Views
    @IBOutlet weak var albumPhoto: UIImageView!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

    // MARK: - Set data
extension PhotosCollectionViewCell {
    public func setData(_ model: PhotosDetailsResponseModel) {
        self.albumPhoto.setImage(urlString: model.url)
    }
}
