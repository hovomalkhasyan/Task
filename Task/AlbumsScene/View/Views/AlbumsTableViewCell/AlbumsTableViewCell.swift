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
    
    // MARK: - lifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
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
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.name, for: indexPath) as! PhotosCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width * 0.7
        return CGSize(width: width, height: height)
    }
}
