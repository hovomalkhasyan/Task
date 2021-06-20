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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if viewModel.photosDetail.count > 0 {
            tableView.scrollToRow(at: [viewModel.photosDetail.count / 2, 0], at: .top, animated: false)
        }
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
                }
            }
            self?.dispatchGroup.notify(queue: .main) { [weak self] in
                if let photos = self?.viewModel.photosDetail {
                    self?.viewModel.photosDetail.append(contentsOf: photos)
                    self?.tableView.reloadData()
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
        
        if section >= viewModel.albumDetails.value.count {
            headerView.setData(viewModel.albumDetails.value[section - viewModel.albumDetails.value.count])
        } else {
            headerView.setData(viewModel.albumDetails.value[section])
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print(indexPath.section)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if viewModel.photosDetail.count > 0 {
            if tableView.contentOffset.y <= 0 {
                tableView.contentOffset.y = tableView.contentSize.height / 2
            } else if tableView.contentOffset.y >= tableView.contentSize.height - tableView.frame.height {
                tableView.contentOffset.y = tableView.contentSize.height / 2 - tableView.frame.height
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}
