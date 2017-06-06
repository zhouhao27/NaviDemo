//
//  MenuNavigator.swift
//  NaviDemo
//
//  Created by Zhou Hao on 6/6/17.
//  Copyright © 2017 Zhou Hao. All rights reserved.
//

import UIKit

enum MenuItem: Int {
    case landing = 0
    case submenu1
    case submenu2
    case submenu3
    case other
}

final class MenuNavigator {

    var menuViewController: MenuViewController!
    var sub1Navigator: Sub1MenuNavigator?
    
    init(menuViewController: MenuViewController, mainViewController: UINavigationController) {
        self.menuViewController = menuViewController
        self.menuViewController.menuClicked = menuClick
        
        if let landingVC = mainViewController.topViewController as? LandingViewController {
            landingVC.subMenu1Clicked = subMenu1Clicked
            landingVC.subMenu2Clicked = subMenu2Clicked
            landingVC.subMenu3Clicked = subMenu3Clicked
        }
    }
    
    func menuClick(menu: MenuItem) {
        switch menu {
        
        case .landing:
            let naviVC = menuViewController.storyboard!.instantiateViewController(withIdentifier: "LandingPageNavigationController") as! UINavigationController
            let landingVC = naviVC.topViewController as! LandingViewController
            landingVC.subMenu1Clicked = subMenu1Clicked
            landingVC.subMenu2Clicked = subMenu2Clicked
            landingVC.subMenu3Clicked = subMenu3Clicked
            menuViewController.slideMenuController()?.changeMainViewController(naviVC, close: true)
        case .submenu1:
            subMenu1Clicked()
        case .submenu2:
            subMenu2Clicked()
        case .submenu3:
            subMenu3Clicked()
        case .other:
            print("other")
        }
    }
    
    func subMenu1Clicked() {
        let sb1 = UIStoryboard(name: "Sub1", bundle: nil)
        let m1 = sb1.instantiateViewController(withIdentifier: "SubMenu1NavigationViewController") as! UINavigationController
        menuViewController.slideMenuController()?.changeMainViewController(m1, close: true)
        let vc = m1.topViewController as! SubMenu1ViewController
        sub1Navigator = Sub1MenuNavigator(vc)
        sub1Navigator?.sub1MenuSelected = subMenu1Clicked
    }
    
    func subMenu2Clicked() {
        let sb2 = UIStoryboard(name: "Sub2", bundle: nil)
        let m2 = sb2.instantiateViewController(withIdentifier: "SubMenu2NavigationViewController")
        menuViewController.slideMenuController()?.changeMainViewController(m2, close: true)
    }

    func subMenu3Clicked() {
        let sb3 = UIStoryboard(name: "Sub3", bundle: nil)
        let m3 = sb3.instantiateViewController(withIdentifier: "SubMenu3NavigationViewController")
        menuViewController.slideMenuController()?.changeMainViewController(m3, close: true)        
    }

}
