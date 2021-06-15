//
//  NetworkError.swift
//  Task
//
//  Created by Hovo Malxasyan on 15.06.21.
//

import Foundation

public enum NetworkError: LocalizedError {
    case noConnection
    case cancelled
    case serverError
    case unauthorized
    case forbidden
    case notFound
    case custom(String)
    
    public init(_ code: Int) {
        switch code {
        case -1009, -1001, -1005, 13:
            self = .noConnection
        case -999:
            self = .cancelled
        case 500...599:
            self = .serverError
        case 401:
            self = .unauthorized
        case 403:
            self = .forbidden
        case 404:
            self = .notFound
        default:
            self = .custom("Unknown error")
        }
    }
}
