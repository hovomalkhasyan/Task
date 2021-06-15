//
//  AlbumsResponseModel.swift
//  Task
//
//  Created by Hovo Malxasyan on 15.06.21.
//

import Foundation

struct AlbumsResponseModel: Codable {
    let albumsDetail: [AlbumDetail]
}

struct AlbumDetail: Codable {
   let userId: Int
   let id : Int
   let title: String
}
