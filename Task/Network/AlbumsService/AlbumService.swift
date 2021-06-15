//
//  AlbumService.swift
//  Task
//
//  Created by Hovo Malxasyan on 15.06.21.
//

import Foundation
enum AlbumsService: NetworkService {

    case getAlbums(_ model: AlbumsRequestModel)
    case getPhotos(_ model: PhotosRequestModel)
    
    var method: HTTPMethod {
        switch self {
        case .getAlbums, .getPhotos: return .get
        }
    }
    
    var path: String {
        switch self {
        case .getAlbums: return "/albums"
        case .getPhotos: return "/photos"
        }
    }
    
    var parameters: Encodable? {
        switch self {
        case .getAlbums(let model): return model
        case .getPhotos(let model): return model
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getAlbums, .getPhotos: return nil
        }
    }
    
    var queryItems: [String : String]? {
        switch self {
        case .getAlbums, .getPhotos: return nil
        }
    }
}
