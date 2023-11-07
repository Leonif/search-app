//
//  SceneDelegate.swift
//  search-app
//
//  Created by LEONID NIFANTIJEV on 07.11.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let module = MainViewController(viewModel: MainViewModel())
        window.rootViewController = UINavigationController(rootViewController: module)
        window.makeKeyAndVisible()
        self.window = window
    }
}

