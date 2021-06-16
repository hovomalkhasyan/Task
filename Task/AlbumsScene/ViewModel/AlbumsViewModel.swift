//
//  AlbumsViewModel.swift
//  Task
//
//  Created by Hovo Malxasyan on 15.06.21.
//

import Foundation

class AlbumsViewModel {
    
    public var albumDetails = Observable<[AlbumDetailResponseModel]>([])
    public var photosDetail = [PhotosDetailsResponseModel]()
    private var photosRequestModel = PhotosRequestModel()
    
    public func getAlbums() {
        AlbumsService.getAlbums.perform { [weak self] (data: [AlbumDetailResponseModel]?, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            DispatchQueue.main.async {
                if let data = data {
                    self?.albumDetails.value = data
                    print(data)
                }
            }
        }
    }
    
    public func getPhotos(_ id: Int) {
        AlbumsService.getPhotos(id: id).perform { [weak self] (data: [PhotosDetailsResponseModel]?, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            DispatchQueue.main.async {
                if let data = data {
                    self?.photosDetail = data
                }
            }
        }
    }
}
