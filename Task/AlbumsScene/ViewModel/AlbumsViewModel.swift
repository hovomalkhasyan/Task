//
//  AlbumsViewModel.swift
//  Task
//
//  Created by Hovo Malxasyan on 15.06.21.
//

import Foundation

class AlbumsViewModel {
//    var albumDetails = Observable<AlbumsResponseModel>(AlbumsResponseModel())
    var albumDetail = Observable<[AlbumDetail]>([])
    
    public func getAlbums() {
        AlbumsService.getAlbums.perform { [weak self] (data: [AlbumDetail]?, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            DispatchQueue.main.async {
                if let data = data {
//                    self?.albumDetails.value = data
                    print(data)
                }
            }
        }
    }
}
