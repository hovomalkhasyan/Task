//
//  ViewController.swift
//  Task
//
//  Created by Hovo Malxasyan on 15.06.21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func btn(_ sender: UIButton) {
        let controller = AlbumsViewController.create(AlbumsViewModel())
        navigationController?.pushViewController(controller, animated: true)
    }
}

