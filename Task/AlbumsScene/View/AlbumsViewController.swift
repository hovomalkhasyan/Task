//
//  AlbumsViewController.swift
//  Task
//
//  Created by Hovo Malxasyan on 15.06.21.
//

import UIKit

class AlbumsViewController: UIViewController {

    // MARK: - ViewModel
    private var viewModel: AlbumsViewModel!
    
    // MARK: - Lifecycle
    static func create(_ viewModel: AlbumsViewModel) -> AlbumsViewController {
        let vc = AlbumsViewController(nibName: AlbumsViewController.name, bundle: nil)
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
