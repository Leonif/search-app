//
//  Extensions.swift
//  search-app
//
//  Created by LEONID NIFANTIJEV on 08.11.2023.
//

import UIKit
import Combine

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

extension UIViewController {
    func showAlert(with error: Error) {
        let message = UIAlertController(title: "Attention", message: error.localizedDescription, preferredStyle: .alert)
        present(message, animated: true, completion: nil)
    }
}

public extension Publishers {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }

        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }

        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}
