//
//  LandingViewController.swift
//  NaviDemo
//
//  Created by Zhou Hao on 1/6/17.
//  Copyright © 2017 Zhou Hao. All rights reserved.
//

import UIKit

final class LandingViewController: UIViewController {

    var username: String!
    
    var subMenu1Clicked: (() -> ())?
    var subMenu2Clicked: (() -> ())?
    var subMenu3Clicked: (() -> ())?
    
    // MARK: Initializing
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSideMenuButton()
    }

    @IBAction func onSubMenu1(_ sender: Any) {
        if let sub1 = subMenu1Clicked {
            sub1()
        }
    }
    
    @IBAction func onSubMenu2(_ sender: Any) {
        if let sub2 = subMenu2Clicked {
            sub2()
        }
    }
        
    @IBAction func onSubMenu3(_ sender: Any) {
        if let sub3 = subMenu3Clicked {
            sub3()
        }
    }
}

