//
//  Extensions.swift
//  search-app
//
//  Created by LEONID NIFANTIJEV on 08.11.2023.
//

import UIKit

extension UINavigationItem {
    func applyAllAppearance(_ appearance: UINavigationBarAppearance) {
        standardAppearance = appearance
        scrollEdgeAppearance = appearance
        compactAppearance = appearance
        compactScrollEdgeAppearance = appearance
    }
}

extension UINavigationBarAppearance {
    static func defaultAppearance() -> UINavigationBarAppearance {
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundImage = UIImage()
        standardAppearance.backgroundColor = .wildSand
        standardAppearance.shadowImage = UIImage()
        standardAppearance.shadowColor = .clear
        return standardAppearance
    }
}

