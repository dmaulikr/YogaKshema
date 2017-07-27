//
//  WhichPage.swift
//  Yoga Kshema
//
//  Created by Muqtadir Ahmed on 26/07/17.
//  Copyright © 2017 Bitjini. All rights reserved.
//

import UIKit

class WhichPage {
    
    // Shared Instance.
    static var shared = WhichPage()
    var menu = Menu.shared
    var subMenu = SubMenu.shared
    
    var isSubMenu = false {
        // Reset SubMenu options.
        didSet {
            if !isSubMenu {
                subMenu.reset()
            }
        }
    }
    
    func url() -> String {
        return isSubMenu ? subMenu.url() : menu.url()
    }
    
    func shouldPush() -> Bool {
        if menu.menu == .aboutUs ||
            menu.menu == .people ||
            menu.menu == .projects ||
            menu.menu == .workshops ||
            menu.menu == .supportGroups ||
            menu.menu == .contactUs { return true }
        return false
    }
}
