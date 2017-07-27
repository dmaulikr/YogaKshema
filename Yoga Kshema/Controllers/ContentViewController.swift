//
//  ContentViewController.swift
//  Yoga Kshema
//
//  Created by Muqtadir Ahmed on 25/07/17.
//  Copyright © 2017 Bitjini. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    // Structs.
    struct Content {
        var header: String
        var content: String
    }
    
    // Class Instances.
    lazy var middleware = Middleware()
    var pageHandler = WhichPage.shared
    
    // Variables.
    var content: Content = Content(header: "", content: "")
    var isSubMenu = false
    var noNetwork = false
    
    // IBOutlets.
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life cycle methods.
    override func viewDidLoad() { super.viewDidLoad(); onViewDidLoad() }
    override func viewDidAppear(_ animated: Bool) { super.viewDidAppear(animated); onViewDidAppear() }
    override func viewWillDisappear(_ animated: Bool) { super.viewWillDisappear(animated); onViewWillDisappear() }
    
    func onViewDidLoad() {
        // Load appropriate page.
        pageHandler.isSubMenu = isSubMenu
        middleware.delegate = self
        middleware.request(page: pageHandler.url())
        // Turn the indicator on.
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func onViewDidAppear() {}
    
    func onViewWillDisappear() {
        // Reset WhichPage.isSubMenu flag.
        if pageHandler.isSubMenu { pageHandler.isSubMenu = false }
        // If network indicator is on, turn off.
        // Turn the indicator off.
        if UIApplication.shared.isNetworkActivityIndicatorVisible {
            // Turn the indicator off.
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}

// MARK: - UITableView DataSource.
extension ContentViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return pageHandler.isSubMenu ? pageHandler.subMenu.numberOfSections() : pageHandler.menu.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return pageHandler.isSubMenu ?
        pageHandler.subMenu.viewForHeader(withText: content.header) :
        pageHandler.menu.viewForHeader(atSection: section, withText: content.header)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return pageHandler.isSubMenu ?
        pageHandler.subMenu.heightForHeader() :
        pageHandler.menu.heightForHeader(atSection: section)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pageHandler.isSubMenu ?
        pageHandler.subMenu.numberOfCells() :
        pageHandler.menu.numberOfCells(inSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return pageHandler.isSubMenu ?
        pageHandler.subMenu.viewForCell(withText: content.content) :
        pageHandler.menu.viewForCell(atIndexPath: indexPath, andContent: content.content)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return pageHandler.isSubMenu ?
        pageHandler.subMenu.getHeightForCell(withText: content.content) :
        pageHandler.menu.getHeightForCell(inSection: indexPath.section, content: content.content)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard pageHandler.shouldPush() &&
            !pageHandler.isSubMenu &&
            indexPath.section == 0 else { return }
        didSelect(indexPath: indexPath)
    }
}

extension ContentViewController {
    
    func didSelect(indexPath: IndexPath) {
        // Set SubMenu, and push.
        switch pageHandler.menu.menu {
        case .aboutUs:
            pageHandler.subMenu.aboutUsSubMenu = [
                .ourJourney, .reports, .weWorkWith, .gallery, .media, .footprints, .guestSpeak
                ][indexPath.row]
            
        case .people:
            pageHandler.subMenu.peopleSubMenu = [
                .trustees, .developmentCommittee,.faculty, .supporters, .inspirations
                ][indexPath.row]
            
        case .projects:
            pageHandler.subMenu.projectsSubMenu = [
                .ruralEmpowerment, .childEducation, .kidsForKidsSake, .palliativeCare, .publication
                ][indexPath.row]
            
        case .workshops:
            pageHandler.subMenu.workshopsSubMenu = [
                .forWellness, .forRehab, .feedbacks
                ][indexPath.row]
            
        case .supportGroups:
            pageHandler.subMenu.supportGroupsSubMenu = .neuroSculptorSeries
            
        case .contactUs:
            pageHandler.subMenu.contactUsSubMenu = [
                .supportUs, .ykBlogs
                ][indexPath.row]
            
        default: break
        }
        // Push.
        push()
    }
    
    func push() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        vc.isSubMenu = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ContentViewController: HTTPUtilityDelegate {
    
    func parsed(withHeader header: String, content: String) {
        // Turn the indicator off.
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
        var head = header.replacingOccurrences(of: "\r", with: "")
        head = head.replacingOccurrences(of: "\t", with: "")
        head = head.replacingOccurrences(of: "\n", with: "")
        
        let body = content.replacingOccurrences(of: "\t", with: "")
        
        self.content = Content(header: head, content: body)
        
        self.tableView.reloadData()
    }
    
    func failed() {
        // Turn the indicator off.
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        tableView.isHidden = true
    }
}
