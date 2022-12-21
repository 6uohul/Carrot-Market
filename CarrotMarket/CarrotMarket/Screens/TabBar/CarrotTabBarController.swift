//
//  CarrotTabBarController.swift
//  Carrot-Market
//
//  Created by 김인영 on 2022/12/14.
//

import UIKit

class CarrotTabbar: UITabBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CarrotTabBarController: UITabBarController {
    
    var defaultIndex = 0 {
        didSet {
            self.selectedIndex = defaultIndex
        }
    }

    private let carrotTabbar = CarrotTabbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.selectedIndex = defaultIndex
        self.setValue(carrotTabbar, forKey: "tabBar")
        object_setClass(self.tabBar, CarrotTabbar.self)
        self.tabBar.itemPositioning = .centered
    }
}

extension CarrotTabBarController : UITabBarControllerDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let homeViewController = HomeViewController()
        let homeNavigationController =  UINavigationController(rootViewController: homeViewController)
        homeNavigationController.navigationBar.isHidden = true
        
        let neighborViewController = NeighborLifeViewController()
        let neighborNavigationController = UINavigationController(rootViewController: neighborViewController)
        neighborNavigationController.navigationBar.isHidden = true
        
        let aroundViewController = AroundViewController()
        let aroundNavigationController = UINavigationController(rootViewController: aroundViewController)
        aroundNavigationController.navigationBar.isHidden = true
        
        let chatViewController = ChatViewController()
        let chatNavigationController = UINavigationController(rootViewController: chatViewController)
        chatNavigationController.navigationBar.isHidden = true
        
        let myViewController = MyCarrotViewController()
        let myNavigationController = UINavigationController(rootViewController: myViewController)
        myNavigationController.navigationBar.isHidden = true
        
        
        let viewControllers = [
            homeViewController,
            neighborViewController,
            aroundViewController,
            chatViewController,
            myViewController
        ]
        
        self.setViewControllers(viewControllers, animated: true)
        
        let tabBar: UITabBar = self.tabBar
        tabBar.backgroundColor = UIColor.white
        tabBar.barStyle = UIBarStyle.default
        tabBar.barTintColor = UIColor.white
        tabBar.tintColor = UIColor.black
        
        
        let imageNames = [
            "iconTabHomeUnfilled",
            "iconTabNeighborUnfilled",
            "iconTabAroundUnfilled",
            "iconTabChatUnfilled",
            "iconTabMyUnfilled"
        ]
        
        let imageSelectedNames = [
            "iconTabHomeFilled",
            "iconTabNeighborFilled",
            "iconTabAroundFilled",
            "iconTabChatFilled",
            "iconTabMyFilled"
        ]
        
        let tabBarTitle = [
            "홈",
            "동네생활",
            "내 근처",
            "채팅",
            "나의 당근"
        ]
        
        for (index, value) in (tabBar.items?.enumerated())! {
            let tabBarItem: UITabBarItem = value as UITabBarItem
            
            tabBarItem.image = UIImage(named: imageNames[index])?.withRenderingMode(.alwaysOriginal)
            tabBarItem.selectedImage = UIImage(named: imageSelectedNames[index])?.withRenderingMode(.alwaysOriginal)
            tabBarItem.accessibilityIdentifier = imageNames[index]
            tabBarItem.title = tabBarTitle[index]
        }
    }
}
