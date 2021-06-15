//
//  AlbumsResponseModel.swift
//  Task
//
//  Created by Hovo Malxasyan on 15.06.21.
//

import Foundation

//struct AlbumsResponseModel: Codable {
//    var albumsDetail: [AlbumDetail]?
//}

struct AlbumDetail: Codable {
   var userId: Int?
   var id : Int?
   var title: String?
}
