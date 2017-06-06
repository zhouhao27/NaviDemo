//
//  PopupViewController.swift
//  NaviDemo
//
//  Created by Zhou Hao on 6/6/17.
//  Copyright © 2017 Zhou Hao. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {

    var closeClicked : (() -> ())?
    var sub1MenuClicked: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onClose(_ sender: Any) {
        if let close = closeClicked {
            close()
        }
    }

    @IBAction func onSub1Menu(_ sender: Any) {
        if let sub1 = sub1MenuClicked {
            sub1()
        }
    }
}
