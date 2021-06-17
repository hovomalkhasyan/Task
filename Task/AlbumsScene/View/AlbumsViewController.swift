//
//  AlbumsViewController.swift
//  Task
//
//  Created by Hovo Malxasyan on 15.06.21.
//

import UIKit

class AlbumsViewController: UIViewController {
    // MARK: - Views
    @IBOutlet weak var tableView: UITableView!
   
    // MARK: - ViewModel
    private var viewModel: AlbumsViewModel!
    private var dispatchGroup = DispatchGroup()
 
    // MARK: - Lifecycle
    static func create(_ viewModel: AlbumsViewModel) -> AlbumsViewController {
        let vc = AlbumsViewController(nibName: AlbumsViewController.name, bundle: nil)
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        start()
    }
}

    // MARK: - Startup
extension AlbumsViewController {
    func start() {
        viewModel.getAlbums()
        bind()
    }
    
    private func bind() {
        viewModel.albumDetails.observe(on: self) { [weak self] value in
            self?.tableView.reloadData()
            value.forEach {
                if let id = $0.id {
                    self?.dispatchGroup.enter()
                    self?.viewModel.getPhotos(id) {
                        self?.dispatchGroup.leave()
                    }
                    
                    self?.dispatchGroup.notify(queue: .main) { [weak self] in
                        self?.tableView.reloadData()
                    }
                }
            }
        }
    }
}


    // MARK: - Setup
extension AlbumsViewController {
    private func setup() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.sectionHeaderHeight = 44
        tableView.registerCellFromXib(cell: AlbumsTableViewCell.self)
        tableView.registerCellFromXib(cell: TableViewHeader.self)
    }
}

    // MARK: - TableView delegate & data source
extension AlbumsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.photosDetail.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumsTableViewCell.name, for: indexPath) as! AlbumsTableViewCell
        cell.setData(model: viewModel.photosDetail[indexPath.section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableCell(withIdentifier: TableViewHeader.name) as! TableViewHeader
        headerView.setData(viewModel.albumDetails.value[section])
        return headerView
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if tableView.contentOffset.y < 0 && indexPath.section != viewModel.photosDetail.count - 1 {
            tableView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            cell.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        }
        if tableView.contentOffset.y > 0 && indexPath.section == viewModel.photosDetail.count - 1  {
            tableView.transform = .identity
            cell.transform = .identity
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}
