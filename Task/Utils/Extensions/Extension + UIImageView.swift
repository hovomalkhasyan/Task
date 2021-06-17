//
//  Extension + UIImageView.swift
//  Task
//
//  Created by Hovo Malkhasyan on 6/17/21.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(urlString: String?, completed: (() -> Void)? = nil) {
        guard let string = urlString else { return }
        kf.indicatorType = .activity
        kf.setImage(with: URL(string: string)) { _ in
            completed?()
        }
    }
}

