//
//  SceneDelegate.swift
//  25Assignment
//
//  Created by Sandro Gelashvili on 10.05.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let viewModel = MainPageViewModel()
        let mainPage = MainPageVC (viewModel: viewModel)
        let navController = UINavigationController(rootViewController: mainPage)
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}

