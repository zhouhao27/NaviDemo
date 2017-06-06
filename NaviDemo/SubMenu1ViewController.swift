//
//  SubMenu1ViewController.swift
//  NaviDemo
//
//  Created by Zhou Hao on 6/6/17.
//  Copyright © 2017 Zhou Hao. All rights reserved.
//

import UIKit

class SubMenu1ViewController: UIViewController {

    var popupClicked: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSideMenuButton()
    }
    
    @IBAction func onPopup(_ sender: Any) {
        if let popup = popupClicked {
            popup()
        }
    }
}
