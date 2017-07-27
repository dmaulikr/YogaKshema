//
//  SubMenu.swift
//  Yoga Kshema
//
//  Created by Muqtadir Ahmed on 27/07/17.
//  Copyright © 2017 Bitjini. All rights reserved.
//

import UIKit

class SubMenu {
    
    // Shared Instance.
    static var shared = SubMenu()
    
    // Variables.
    var menu: Menu
    
    init() {
        self.menu = Menu.shared
    }
    
    // Enums.
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
    
    // Page Preferences.
    var aboutUsSubMenu: AboutUs?
    var contactUsSubMenu: ContactUs?
    var peopleSubMenu: People?
    var projectsSubMenu: Projects?
    var supportGroupsSubMenu: SupportGroups?
    var workshopsSubMenu: Workshops?
    
    func reset() {
        aboutUsSubMenu = nil
        peopleSubMenu = nil
        projectsSubMenu = nil
        workshopsSubMenu = nil
        supportGroupsSubMenu = nil
        contactUsSubMenu = nil
    }
    
    func url() -> String {
        switch menu.menu {
        case .aboutUs:
            if let sub = aboutUsSubMenu { return sub.rawValue }
            fallthrough
            
        case .contactUs:
            if let sub = contactUsSubMenu { return sub.rawValue }
            fallthrough
            
        case .people:
            if let sub = peopleSubMenu { return sub.rawValue }
            fallthrough
            
        case .projects:
            if let sub = projectsSubMenu { return sub.rawValue }
            fallthrough
            
        case .supportGroups:
            if let sub = supportGroupsSubMenu { return sub.rawValue }
            fallthrough
            
        case .workshops:
            if let sub = workshopsSubMenu { return sub.rawValue }
            fallthrough
            
        default: return ""
        }
    }
    
}

extension SubMenu { // Header Generator.
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func heightForHeader() -> CGFloat {
        return 44.0
    }
    
    func viewForHeader(withText header: String) -> UIView? {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        cell.textLabel?.text = header
        return cell
    }
    
}

extension SubMenu { // Cell Generator.
    
    func numberOfCells() -> Int {
        return 1
    }
    
    func getHeightForCell(withText content: String) -> CGFloat {
        return content.toTextView().frame.height
    }
    
    func viewForCell(withText content: String) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.selectionStyle = .none
        cell.addSubview(content.toTextView())
        return cell
    }
    
}
