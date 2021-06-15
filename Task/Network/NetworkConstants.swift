//
//  NetworkConstants.swift
//  Task
//
//  Created by Hovo Malxasyan on 15.06.21.
//

import Foundation

enum NetworkConstants: String {
    case baseURL = "https://jsonplaceholder.typicode.com"

    enum Keys: String {
        case content = "Content-Type"
        case auth = "Authorization"
    }
    
    enum Parametres: String {
        case json = "application/json"
    }
}
