//
//  BaseViewController.swift
//  Yoga Kshema
//
//  Created by Muqtadir Ahmed on 25/07/17.
//  Copyright © 2017 Bitjini. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() { super.viewDidLoad(); preferences() }
    
    func preferences() {
        self.navigationController?.navigationBar.barTintColor = ColorPalette.orange
        self.navigationController?.navigationBar.tintColor = .white
    }
}
