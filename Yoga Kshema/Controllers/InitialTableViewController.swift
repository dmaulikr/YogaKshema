//
//  InitialTableViewController.swift
//  Yoga Kshema
//
//  Created by Muqtadir Ahmed on 18/07/17.
//  Copyright © 2017 Bitjini. All rights reserved.
//

import UIKit

class InitialTableViewController: UITableViewController {
    
    // Class Instances.
    lazy var middleware = Middleware.shared
    
    // Variables.
    var url: String?

    // MARK: - Life cycle methods.
    override func viewDidLoad() { super.viewDidLoad(); onViewDidLoad() }
    
    func onViewDidLoad() {
        middleware.delegate = self
        middleware.request(page: url ?? Constants.home)
    }

    // MARK: - Table view data source.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
}

extension InitialTableViewController: HTTPUtilityDelegate {
    
    func parsed(withHeader header: String, content: String) {
        print("Parsed", header, content)
    }
    
    func failed() {
        print("Failed")
    }
}
