//
//  AboutUsViewController.swift
//  Yoga Kshema
//
//  Created by Muqtadir Ahmed on 13/07/17.
//  Copyright © 2017 Bitjini. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {
    
    fileprivate let options = ["Our Journey", "Reports", "We Work With", "Gallery", "Media", "Footprints", "Guest Speak"]
    
    @IBOutlet weak var tableView: UITableView!

}

extension AboutUsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.textLabel?.text = options[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = storyboard?.instantiateViewController(withIdentifier: "OurJourneyViewController") as! OurJourneyViewController
            navigationController?.pushViewController(vc, animated: true)
            
        case 1:
            let vc = storyboard?.instantiateViewController(withIdentifier: "ReportsViewController") as! ReportsViewController
            navigationController?.pushViewController(vc, animated: true)
            
        case 2:
            let vc = storyboard?.instantiateViewController(withIdentifier: "WeWorkWithViewController") as! WeWorkWithViewController
            navigationController?.pushViewController(vc, animated: true)
            
        case 3:
            let vc = storyboard?.instantiateViewController(withIdentifier: "GalleryViewController") as! GalleryViewController
            navigationController?.pushViewController(vc, animated: true)
            
        case 4:
            let vc = storyboard?.instantiateViewController(withIdentifier: "MediaViewController") as! MediaViewController
            navigationController?.pushViewController(vc, animated: true)
            
        case 5:
            let vc = storyboard?.instantiateViewController(withIdentifier: "FootprintsViewController") as! FootprintsViewController
            navigationController?.pushViewController(vc, animated: true)
            
        default:
            let vc = storyboard?.instantiateViewController(withIdentifier: "GuestSpeakViewController") as! GuestSpeakViewController
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
