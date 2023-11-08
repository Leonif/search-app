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
        
        let viewModel = MainViewModel()
        let module = MainViewController(viewModel: viewModel)
        let nav = UINavigationController(rootViewController: module)
        
        viewModel.detailsTapped.sink { product in
            nav.pushViewController(DetailsViewController(viewModel: DetailsViewModel(product: product)), animated: true)
        }.store(in: &viewModel.bag)
        
        window.rootViewController = nav
        window.makeKeyAndVisible()
        self.window = window
    }
}

