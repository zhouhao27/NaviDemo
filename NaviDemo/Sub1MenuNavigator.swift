//
//  Sub1MenuNavigator.swift
//  NaviDemo
//
//  Created by Zhou Hao on 6/6/17.
//  Copyright © 2017 Zhou Hao. All rights reserved.
//

import UIKit

class Sub1MenuNavigator {
    
    var rootViewController: SubMenu1ViewController!
    var popupViewController: PopupViewController?
    var sub1MenuSelected: (() -> ())?
    
    init(_ rootViewController: SubMenu1ViewController) {
        self.rootViewController = rootViewController
        self.rootViewController.popupClicked = popup
    }
    
    private func popup() {
        popupViewController = self.rootViewController.storyboard?.instantiateViewController(withIdentifier: "PopupViewController") as? PopupViewController
        rootViewController.present(popupViewController!, animated: true, completion: nil)
        
        popupViewController?.closeClicked = closePopup
        popupViewController?.sub1MenuClicked = showSub1Menu
    }
    
    private func closePopup() {
        popupViewController?.dismiss(animated: true, completion: nil)
    }
    
    private func showSub1Menu() {
        popupViewController?.dismiss(animated: true, completion: { 
            [weak self] in
            if let sub1 = self?.sub1MenuSelected {
                sub1()
            }
        })
    }
}
