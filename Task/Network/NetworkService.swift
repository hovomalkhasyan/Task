//
//  NetworkService.swift
//  Task
//
//  Created by Hovo Malxasyan on 15.06.21.
//

import Foundation
import UIKit

// MARK: - HTTP methods
public enum HTTPMethod: String {
    case get = "GET"
    case head = "HEAD"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

// MARK: - Request service
public protocol NetworkService {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Encodable? { get }
    var headers: [String: String]? { get }
    var queryItems: [String: String]? { get }
    var request: URLRequest { get }
    
    func perform<Value: Codable>(decoder: JSONDecoder, completion: @escaping (Value?, NetworkError?) -> Void)
}

public extension NetworkService {
    
    var formData: (String, [Data])? {
        return nil
    }
    
    // MARK: URLRequest
    var request: URLRequest {
        // URL components
        var urlComponent = URLComponents(string: NetworkConstants.baseURL.rawValue + path) ?? URLComponents()
        // Add query items
        urlComponent.queryItems = queryItems?.map { URLQueryItem(name: $0.key, value: $0.value)  }
        // Request
        var request_ = URLRequest(url: urlComponent.url!)
        request_.httpMethod = method.rawValue
        // Add headers
        headers?.forEach { request_.setValue($0.value, forHTTPHeaderField: $0.key) }
        request_.setValue(NetworkConstants.Parametres.json.rawValue, forHTTPHeaderField: NetworkConstants.Keys.content.rawValue)
        
        return request_
    }
    
    // MARK: Perform request
    func perform<Value: Codable>(decoder: JSONDecoder = JSONDecoder(), completion: @escaping (Value?, NetworkError?) -> Void) {
        URLSession.shared.dataTask(with: request) { (data, res, errorData) in
            var networkError: NetworkError? = nil
            
            if let res = res as? HTTPURLResponse {
                if res.statusCode >= 400 {
                    networkError = NetworkError(res.statusCode)
                    completion(nil, networkError)
                }
                if let data = data {
                    do {
                        let response = try decoder.decode(NetworkResponse<Value>.self, from: data)
                        if response.success ?? false {
                            completion(response.data, nil)
                        } else {
                            if let error_ = response.error {
                                networkError = NetworkError.custom(error_)
                                completion(nil, networkError)
                            } else {
                                if let message = response.message {
                                    networkError = NetworkError.custom(message.isEmpty ? "Something went wrong, please try again" : message)
                                    completion(nil, networkError)
                                }
                            }
                        }
                    } catch let error_ {
                        debugPrint(error_.localizedDescription)
                        completion(nil, nil)
                    }
                }
            } else {
                if let err = errorData {
                    networkError = NetworkError.custom(err.localizedDescription)
                    completion(nil, networkError)
                }
            }
        }.resume()
    }
}


extension NSMutableData {
    func appendString(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}

private extension Encodable {
    func toDictionary() throws -> [String: Any]? {
        let data = try JSONEncoder().encode(self)
        let josnData = try JSONSerialization.jsonObject(with: data)
        return josnData as? [String: Any]
    }
}
