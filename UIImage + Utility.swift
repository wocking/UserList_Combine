//
//  UIImage + Uitily.swift
//  Login_MVVM
//
//  Created by Heng.Wang on 2022/1/26.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func setImageWithUrlPath(_ path: String, completed: SDExternalCompletionBlock? = nil) {
        self.sd_setImage(with: URL(string: path), completed: completed)
    }
}
