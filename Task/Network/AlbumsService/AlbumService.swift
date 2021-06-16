//
//  AlbumService.swift
//  Task
//
//  Created by Hovo Malxasyan on 15.06.21.
//

import Foundation
enum AlbumsService: NetworkService {

    case getAlbums
    case getPhotos(id: Int)
    
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
        case .getAlbums: return nil
        case .getPhotos: return nil
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getAlbums, .getPhotos: return nil
        }
    }
    
    var queryItems: [String : String]? {
        switch self {
        case .getAlbums:
            return ["userId": "1"]
        case .getPhotos(let id):
            return ["albumId": String(id)]
        }
    }
}
