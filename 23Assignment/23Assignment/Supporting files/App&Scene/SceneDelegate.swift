//
//  SceneDelegate.swift
//  23Assignment
//
//  Created by Sandro Gelashvili on 02.05.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let viewModel = MainPageViewControllerViewModel()
        let mainPage = MainPageViewController(viewModel: viewModel)
        let navController = UINavigationController(rootViewController: mainPage)
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
