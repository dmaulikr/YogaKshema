//
//  Menu.swift
//  Yoga Kshema
//
//  Created by Muqtadir Ahmed on 27/07/17.
//  Copyright © 2017 Bitjini. All rights reserved.
//

import UIKit

class Menu {
    
    // Shared Instance.
    static var shared = Menu()
    
    // Variables.
    
    
    // Enums.
    enum Menus: String {
        case home = "http://yoga-kshema.org/"
        case aboutUs = "http://yoga-kshema.org/about-us/"
        case people = "http://yoga-kshema.org/people/"
        case projects = "http://yoga-kshema.org/projects/"
        case talks = "http://yoga-kshema.org/awareness-talks/"
        case workshops = "http://yoga-kshema.org/workshops/"
        case supportGroups = "http://yoga-kshema.org/support-groups/"
        case events = "http://yoga-kshema.org/events/"
        case contactUs = "http://yoga-kshema.org/contact-us/"
    }
    
    // Page Preferences.
    var menu: Menus = .home
    
    // Return URL of the page to load.
    func url() -> String {
        return menu.rawValue
    }
    
}

extension Menu { // Header Generator.
    
    func numberOfSections() -> Int {
        switch menu {
        case .aboutUs, .contactUs, .people, .projects, .supportGroups, .workshops: return 2
        default: return 1
        }
    }
    
    func heightForHeader(atSection section: Int) -> CGFloat {
        switch menu {
        case .aboutUs, .contactUs, .people, .projects, .supportGroups, .workshops:
            return section == 0 ? 0.0 : 44.0
            
        default:
            return 44.0
        }
    }
    
    func viewForHeader(atSection section: Int, withText header: String) -> UIView? {
        switch menu {
        case .aboutUs, .contactUs, .people, .projects, .supportGroups, .workshops:
            if section == 0 {
                return nil
            }
            fallthrough
            
        default:
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.backgroundColor = .white
            cell.selectionStyle = .none
            cell.textLabel?.text = header
            return cell
        }
    }
    
}

extension Menu { // Cell Generator.
    
    func numberOfCells(inSection section: Int) -> Int {
        switch menu {
        case .aboutUs:
            return section == 0 ? 7 : 1
            
        case .contactUs:
            return section == 0 ? 2 : 1
            
        case .people:
            return section == 0 ? 5 : 1
            
        case .projects:
            return section == 0 ? 5 : 1
                
        case .supportGroups:
            return 1
        
        case .workshops:
            return section == 0 ? 3 : 1
         
        default:
            return 1
        }
    }
    
    func getHeightForCell(inSection section: Int, content: String) -> CGFloat {
        switch menu {
        case .aboutUs, .people, .projects, .workshops, .supportGroups, .contactUs:
            if section == 0 { return 44.0 }
            fallthrough
            
        default:
            return content.toTextView().frame.height
        }
    }
    
    func viewForCell(atIndexPath indexPath: IndexPath, andContent content: String) -> UITableViewCell {
        
        switch menu {
        case .aboutUs:
            if indexPath.section == 0 {
                let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
                cell.selectionStyle = .none
                cell.accessoryType = .disclosureIndicator
                cell.backgroundColor = ColorPalette.green
                cell.textLabel?.textColor = .white
                cell.textLabel?.text = ["Our Journey", "Reports", "We Work With", "Gallery", "Media", "Footprints", "Guest Speak"][indexPath.row]
                return cell
            }
            fallthrough
            
        case .contactUs:
            if indexPath.section == 0 {
                let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
                cell.selectionStyle = .none
                cell.accessoryType = .disclosureIndicator
                cell.backgroundColor = ColorPalette.green
                cell.textLabel?.textColor = .white
                cell.textLabel?.text = ["Support Us", "KY Blogs"][indexPath.row]
                return cell
            }
            fallthrough
            
        case .people:
            if indexPath.section == 0 {
                let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
                cell.selectionStyle = .none
                cell.accessoryType = .disclosureIndicator
                cell.backgroundColor = ColorPalette.green
                cell.textLabel?.textColor = .white
                cell.textLabel?.text = ["Trustees", "Development Committee", "Faculty", "Supporters", "Inspirations"][indexPath.row]
                return cell
            }
            fallthrough
            
        case .projects:
            if indexPath.section == 0 {
                let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
                cell.selectionStyle = .none
                cell.accessoryType = .disclosureIndicator
                cell.backgroundColor = ColorPalette.green
                cell.textLabel?.textColor = .white
                cell.textLabel?.text = ["Rural Empowerment", "Child Education", "Kids for Kid' Sake", "Palliative Care", "Our Publications"][indexPath.row]
                return cell
            }
            fallthrough
            
        case .supportGroups:
            if indexPath.section == 0 {
                let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
                cell.selectionStyle = .none
                cell.accessoryType = .disclosureIndicator
                cell.backgroundColor = ColorPalette.green
                cell.textLabel?.textColor = .white
                cell.textLabel?.text = "Neuro-Sculptor Series"
                return cell
            }
            fallthrough
            
        case .workshops:
            if indexPath.section == 0 {
                let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
                cell.selectionStyle = .none
                cell.accessoryType = .disclosureIndicator
                cell.backgroundColor = ColorPalette.green
                cell.textLabel?.textColor = .white
                cell.textLabel?.text = ["For Wellness", "For Rehab", "Feedbacks"][indexPath.row]
                return cell
            }
            fallthrough
            
        default:
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.selectionStyle = .none
            cell.addSubview(content.toTextView())
            return cell
        }
    }
    
}
