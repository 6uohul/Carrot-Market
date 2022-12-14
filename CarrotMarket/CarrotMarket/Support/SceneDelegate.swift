//
//  SceneDelegate.swift
//  CarrotMarket
//
//  Created by 고두영 on 2022/12/13.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            guard let _ = (scene as? UIWindowScene) else { return }
            
            if let windowScene = scene as? UIWindowScene {
                
                let window = UIWindow(windowScene: windowScene)
                window.overrideUserInterfaceStyle = UIUserInterfaceStyle.light
                
                let rootVC = ViewController()
                
                window.rootViewController = rootVC
                window.makeKeyAndVisible()
                self.window = window
            }
        }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

