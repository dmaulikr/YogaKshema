//
//  WhichPage.swift
//  Yoga Kshema
//
//  Created by Muqtadir Ahmed on 26/07/17.
//  Copyright © 2017 Bitjini. All rights reserved.
//

import UIKit

class WhichPage {
    
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
    
    enum AboutUs: String {
        case ourJourney = "http://yoga-kshema.org/about-us/our-journey/"
        case reports = "http://yoga-kshema.org/about-us/reports/"
        case weWorkWith = "http://yoga-kshema.org/about-us/we-work-with/"
        case gallery = "http://yoga-kshema.org/about-us/gallery/"
        case media = "http://yoga-kshema.org/about-us/media/"
        case footprints = "http://yoga-kshema.org/about-us/footprints/"
        case guestSpeak = "http://yoga-kshema.org/about-us/talks/"
    }
    
    enum People: String {
        case trustees = "http://yoga-kshema.org/people/trustees/"
        case developmentCommittee = "http://yoga-kshema.org/people/development-committee/"
        case faculty = "http://yoga-kshema.org/people/faculty/"
        case supporters = "http://yoga-kshema.org/people/supporters/"
        case inspirations = "http://yoga-kshema.org/people/inspirations/"
    }
    
    enum Projects: String {
        case ruralEmpowerment = "http://yoga-kshema.org/projects/rural-empowerment/"
        case childEducation = "http://yoga-kshema.org/projects/child-education/"
        case kidsForKidsSake = "http://yoga-kshema.org/projects/kids-for-kids-sake/"
        case sparkyMascot = "http://yoga-kshema.org/projects/kids-for-kids-sake/meet-sparky/"
        case palliativeCare = "http://yoga-kshema.org/projects/palliative-care/"
        case publication = "http://yoga-kshema.org/projects/our-publications/"
    }
    
    enum Workshops: String {
        case forWellness = "http://yoga-kshema.org/workshops/for-wellness/"
        case forRehab = "http://yoga-kshema.org/workshops/for-rehab/"
        case feedbacks = "http://yoga-kshema.org/workshops/feedbacks/"
    }
    
    enum SupportGroups: String {
        case neuroSculptorSeries = "http://yoga-kshema.org/support-groups/neuro-sculptor-series/"
    }
    
    enum ContactUs: String {
        case supportUs = "http://yoga-kshema.org/contact-us/support-us/"
        case ykBlogs = "http://yoga-kshema.org/contact-us/yk-blogs/"
    }
    
    // Singleton.
    static let shared: WhichPage = WhichPage()
    
    // Page Preferences.
    var menu: Menus?
    var aboutUsSubMenu: AboutUs?
    var peopleSubMenu: People?
    var projectsSubMenu: Projects?
    var workshopsSubMenu: Workshops?
    var supportGroupsSubMenu: SupportGroups?
    var contactUsSubMenu: ContactUs?
    
    // Resets to initial setting.
    func reset() {
        menu = nil
        resetSubMenus()
    }
    
    // Resets Sub Menus Settings.
    func resetSubMenus() {
        aboutUsSubMenu = nil
        peopleSubMenu = nil
        projectsSubMenu = nil
        workshopsSubMenu = nil
        supportGroupsSubMenu = nil
        contactUsSubMenu = nil
    }
    
    // Return URL of the page to load.
    func url() -> String {
        guard let isMenu = menu else { return "" }
        
        switch isMenu {
        case .aboutUs:
            if let isAboutUs = aboutUsSubMenu {
                return isAboutUs.rawValue
            }
            fallthrough
            
        case .people:
            if let isPeople = peopleSubMenu {
                return isPeople.rawValue
            }
            fallthrough
            
        case .projects:
            if let isProject = projectsSubMenu {
                return isProject.rawValue
            }
            fallthrough
            
        case .workshops:
            if let isWorkshop = workshopsSubMenu {
                return isWorkshop.rawValue
            }
            fallthrough
            
        case .supportGroups:
            if let isSupportGroups = supportGroupsSubMenu {
                return isSupportGroups.rawValue
            }
            fallthrough
            
        case .contactUs:
            if let isContactUs = contactUsSubMenu {
                return isContactUs.rawValue
            }
            fallthrough
            
        default:
            return isMenu.rawValue
        }
    }
}

// Cell generator.

extension WhichPage {
    
    // Header Views.
    // Return the number sections in the table view.
    func numberOfSections() -> Int {
        guard let isMenu = menu else { return 0 }
        
        switch isMenu {
        case .aboutUs:
            if let _ = aboutUsSubMenu { return 1 }
            return 2
            
        case .people:
            if let _ = peopleSubMenu { return 1 }
            return 2
            
        case .projects:
            if let _ = projectsSubMenu { return 1 }
            return 2
            
        case .workshops:
            if let _ = workshopsSubMenu { return 1 }
            return 2
            
        case .supportGroups:
            if let _ = supportGroupsSubMenu { return 1 }
            return 2
            
        case .contactUs:
            if let _ = contactUsSubMenu { return 1 }
            return 2
            
        default: return 1
        }
    }
    
    func getHeaderFor(sectionAt at: Int, header: String) -> UIView? {
        guard let isMenu = menu else { return nil }
        
        switch isMenu {
        case .aboutUs:
            if let _ = aboutUsSubMenu { fallthrough }
            else if at == 0 { return nil }
            fallthrough
            
        case .people:
            if let _ = peopleSubMenu { fallthrough }
            else if at == 0 { return nil }
            fallthrough
            
        case .projects:
            if let _ = projectsSubMenu { fallthrough }
            else if at == 0 { return nil }
            fallthrough
            
        case .workshops:
            if let _ = workshopsSubMenu { fallthrough }
            else if at == 0 { return nil }
            fallthrough
            
        case .supportGroups:
            if let _ = supportGroupsSubMenu { fallthrough }
            else if at == 0 { return nil }
            fallthrough
            
        case .contactUs:
            if let _ = contactUsSubMenu { fallthrough }
            else if at == 0 { return nil }
            fallthrough
            
        default:
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.backgroundColor = .white
            cell.textLabel?.text = header
            return cell
        }
    }
    
    func getHeightFor(sectionAt at: Int) -> CGFloat {
        guard let isMenu = menu else { return 0.0 }
        switch isMenu {
        case .aboutUs:
            if let _ = aboutUsSubMenu { fallthrough }
            else { return 0.0 }
            
        case .people:
            if let _ = peopleSubMenu { fallthrough }
            else { return 0.0 }
            
        case .projects:
            if let _ = projectsSubMenu { fallthrough }
            else { return 0.0 }
            
        case .workshops:
            if let _ = workshopsSubMenu { fallthrough }
            else { return 0.0 }
            
        case .supportGroups:
            if let _ = supportGroupsSubMenu { fallthrough }
            else { return 0.0 }
            
        case .contactUs:
            if let _ = contactUsSubMenu { fallthrough }
            else { return 0.0 }
            
        default: return 44.0
        }
    }
    
    // Cell Views.
    // Return the number of cells to load in current setting.
    func numberOfCells(inSection section: Int) -> Int {
        guard let isMenu = menu else { return 0 }
        
        switch isMenu {
        case .aboutUs:
            if let _ = aboutUsSubMenu {
                return 1
            }
            return section == 0 ? 7 : 1
            
        case .people:
            if let _ = peopleSubMenu {
                return 1
            }
            return section == 0 ? 5 : 1
            
        case .projects:
            if let _ = projectsSubMenu {
                return 1
            }
            return section == 0 ? 5 : 1
            
        case .workshops:
            if let _ = workshopsSubMenu {
                return 1
            }
            return section == 0 ? 3 : 1
            
        case .supportGroups:
            if let _ = supportGroupsSubMenu {
                return 1
            }
            return 1
            
        case .contactUs:
            if let _ = contactUsSubMenu {
                return 1
            }
            return section == 0 ? 2 : 1
            
        default: return 1
        }
    }
    
    func getCell(cellAt row: Int, inSection section: Int, content: String) -> UITableViewCell {
        guard let isMenu = menu else { return UITableViewCell(style: .default, reuseIdentifier: nil) }
        
        switch isMenu {
        case .aboutUs:
            if let _ = aboutUsSubMenu { fallthrough }
            if section == 0 {
                let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
                cell.backgroundColor = ColorPalette.green
                cell.textLabel?.textColor = .white
                cell.accessoryType = .disclosureIndicator
                cell.textLabel?.text = ["Our Journey", "Reports", "We Work With", "Gallery", "Media", "Footprints", "Guest Speak"][row]
                return cell
            }
            fallthrough
            
        case .people:
            if let _ = peopleSubMenu { fallthrough }
            if section == 0 {
                let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
                cell.backgroundColor = ColorPalette.green
                cell.textLabel?.text = ["Trustees", "Development Committee", "Faculty", "Supporters", "Inspirations"][row]
                return cell
            }
            fallthrough
            
        case .projects:
            if let _ = projectsSubMenu { fallthrough }
            if section == 0 {
                let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
                cell.backgroundColor = ColorPalette.green
                cell.textLabel?.text = ["Rural Empowerment", "Child Education", "Kids for Kid' Sake", "Palliative Care", "Our Publications"][row]
                return cell
            }
            fallthrough
            
        case .workshops:
            if let _ = workshopsSubMenu { fallthrough }
            if section == 0 {
                let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
                cell.backgroundColor = ColorPalette.green
                cell.textLabel?.text = ["For Wellness", "For Rehab", "Feedbacks"][row]
                return cell
            }
            fallthrough
            
        case .supportGroups:
            if let _ = supportGroupsSubMenu { fallthrough }
            if section == 0 {
                let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
                cell.backgroundColor = ColorPalette.green
                cell.textLabel?.text = ["Neuro-Sculptor Series"][row]
                return cell
            }
            fallthrough
            
        case .contactUs:
            if let _ = contactUsSubMenu { fallthrough }
            if section == 0 {
                let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
                cell.backgroundColor = ColorPalette.green
                cell.textLabel?.text = ["Support Us", "KY Blogs"][row]
                return cell
            }
            fallthrough
            
        default:
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.addSubview(getTextView(withText: content))
            return cell
        }
    }
    
    func getTextView(withText text: String) -> UITextView {
        let textView = UITextView(frame: UITableViewCell(style: .default, reuseIdentifier: nil).bounds)
        textView.contentInset = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
        textView.textAlignment = .justified
        textView.isScrollEnabled = false
        textView.text = text
        textView.sizeToFit()
        textView.scrollRangeToVisible(NSRange(location: 0, length: 0))
        return textView
    }
    
    func getHeightFor(cellAt at: Int, inSection section: Int, content: String) -> CGFloat {
        guard let isMenu = menu else { return 0.0 }
        
        switch isMenu {
        case .aboutUs, .people, .projects, .workshops, .supportGroups, .contactUs:
            if section == 0 { return 44.0 }
            fallthrough
            
        default:
            return getTextView(withText: content).frame.height
        }
    }
}
