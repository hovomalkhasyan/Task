//
//  AlbumsTableViewCell.swift
//  Task
//
//  Created by Hovo Malkhasyan on 6/16/21.
//

import UIKit

class AlbumsTableViewCell: UITableViewCell {
    // MARK: - Views
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Propertyes
    private var photosArray = [PhotosDetailsResponseModel]()
 
    // MARK: - lifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        collectionView.contentOffset.x = (collectionView.contentSize.width + 10) / 2
    }
}

// MARK: - setup
extension AlbumsTableViewCell {
    private func setup() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: PhotosCollectionViewCell.name, bundle: nil), forCellWithReuseIdentifier: PhotosCollectionViewCell.name)
    }
}
// MARK: - Collection view delegate & data source
extension AlbumsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.name, for: indexPath) as! PhotosCollectionViewCell
        cell.setData(photosArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width
        return CGSize(width: width, height: height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if collectionView.contentOffset.x <= 0 {
            collectionView.contentOffset.x = (collectionView.contentSize.width + 10) / 2
        } else if collectionView.contentOffset.x >= collectionView.contentSize.width - frame.width {
            collectionView.contentOffset.x = (collectionView.contentSize.width + 10) / 2 - collectionView.frame.width - 10
        }
    }
}

    // MARK: - Set data
extension AlbumsTableViewCell {
    
    public func setData(model: [PhotosDetailsResponseModel]) {
        self.photosArray = model
        self.photosArray.append(contentsOf: model)
        collectionView.reloadData()
    }
}
