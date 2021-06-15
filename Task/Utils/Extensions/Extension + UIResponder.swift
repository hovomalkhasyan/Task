//
//  Extension + UIResponder.swift
//  Task
//
//  Created by Hovo Malxasyan on 15.06.21.
//

import UIKit

public extension UIResponder {
    class var name: String {
        return String(describing: self)
    }
}
