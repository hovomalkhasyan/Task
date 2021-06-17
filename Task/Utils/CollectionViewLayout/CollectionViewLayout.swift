//
//  CollectionViewLayout.swift
//  Task
//
//  Created by Hovo Malkhasyan on 6/17/21.
//

import UIKit

class PhotosCollectionFlow: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        self.scrollDirection = .horizontal
    }
    override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        return true
    }
}
