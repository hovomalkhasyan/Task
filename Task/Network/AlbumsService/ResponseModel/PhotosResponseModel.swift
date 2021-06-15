//
//  PhotosResponseModel.swift
//  Task
//
//  Created by Hovo Malxasyan on 15.06.21.
//

import Foundation

struct PhotosResponseModel: Codable {
    let photosDetail: [PhotosDetails]
}

struct PhotosDetails: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
