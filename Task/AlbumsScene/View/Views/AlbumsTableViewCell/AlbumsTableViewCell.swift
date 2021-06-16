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
    
    let array = [#colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1) , #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1) ,#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)]
    
    // MARK: - lifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        self.collectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .left, animated: false)
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
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.name, for: indexPath) as! PhotosCollectionViewCell
        cell.contentView.backgroundColor = array[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width
        return CGSize(width: width, height: height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageFloat = (scrollView.contentOffset.x / scrollView.frame.size.width)
        let pageInt = Int(round(pageFloat))
        
        switch pageInt {
        case 0:
            collectionView.scrollToItem(at: [0, 3], at: .left, animated: false)
        case array.count - 1:
            collectionView.scrollToItem(at: [0, 1], at: .left, animated: false)
        default:
            break
        }
    }
}
