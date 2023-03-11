//
//  addSubViews.swift
//  CarrotMarket
//
//  Created by 김인영 on 2022/12/28.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
