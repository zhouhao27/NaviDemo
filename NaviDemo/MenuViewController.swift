//
//  MenuViewController.swift
//  NaviDemo
//
//  Created by Zhou Hao on 6/6/17.
//  Copyright © 2017 Zhou Hao. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

protocol MenuItemProtocol : class {
    func changeViewController(_ menu: MenuItem)
}

class MenuViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var menuClicked: ((MenuItem) -> ())!
    var data = ["Main","Submenu 1","Submenu 2","Submenu 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension MenuViewController: MenuItemProtocol {
    func changeViewController(_ menu: MenuItem) {
        menuClicked(menu)
    }
}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let item = MenuItem(rawValue: indexPath.row) {
            changeViewController(item)
        }
    }

}
