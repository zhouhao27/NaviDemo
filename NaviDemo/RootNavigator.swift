//
//  RootNavigator.swift
//  NaviDemo
//
//  Created by Zhou Hao on 6/6/17.
//  Copyright © 2017 Zhou Hao. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class RootNavigator {
    
    var rootViewController: ViewController!
    var storyboard = UIStoryboard(name: "Main", bundle: nil)
    var menuNavigator: MenuNavigator!
    
    init(_ window: UIWindow) {
        rootViewController = window.rootViewController as! ViewController
        rootViewController.didGoClicked = showLandingPage
    }
    
    func showLandingPage() {
        let menuViewController = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        let landingViewController = storyboard.instantiateViewController(withIdentifier: "LandingPageNavigationController") as! UINavigationController

        let slideMenuController = SlideMenuController(mainViewController: landingViewController, leftMenuViewController: menuViewController, rightMenuViewController: UIViewController())
            
        rootViewController.present(slideMenuController, animated: true, completion: nil)
        menuNavigator = MenuNavigator(menuViewController: menuViewController, mainViewController: landingViewController)
    }
}
