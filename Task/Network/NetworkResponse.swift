//
//  NetworkResponse.swift
//  Task
//
//  Created by Hovo Malxasyan on 15.06.21.
//

import Foundation

struct NetworkResponse<Value: Codable>: Codable {
    let timestamp: Int?
    let data: Value?
    let message: String?
    let success: Bool?
    let error: String?
    let path: String?
}
