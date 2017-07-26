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
    
    // Variables.
    var content: Content = Content(header: "", content: "")
    var noNetwork = false
    var isSubMenu = false
    
    // IBOutlets.
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life cycle methods.
    override func viewDidLoad() { super.viewDidLoad(); onViewDidLoad() }
    override func viewDidAppear(_ animated: Bool) { super.viewDidAppear(animated); onViewDidAppear() }
    
    func onViewDidLoad() {
        // Load appropriate page.
        middleware.delegate = self
        middleware.request(page: WhichPage.shared.url())
    }
    
    func onViewDidAppear() {
        if !isSubMenu { WhichPage.shared.resetSubMenus(); tableView.reloadData() }
        // Deselect selected rows.
        if let index = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: index, animated: true)
        }
    }
}

// MARK: - UITableView DataSource.
extension ContentViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return noNetwork ? 0 : WhichPage.shared.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return WhichPage.shared.getHeaderFor(sectionAt: section, header: content.header)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return WhichPage.shared.getHeightFor(sectionAt: section)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noNetwork ? 0 : WhichPage.shared.numberOfCells(inSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return WhichPage.shared.getCell(cellAt: indexPath.row, inSection: indexPath.section, content: content.content)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return WhichPage.shared.getHeightFor(cellAt: indexPath.row, inSection: indexPath.section, content: content.content)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelect(indexPath: indexPath)
    }
}

extension ContentViewController {
    
    func didSelect(indexPath: IndexPath) {
        let sharedInstance = WhichPage.shared
        guard let isMenu = sharedInstance.menu else { return }
        
        switch isMenu {
        
        case .aboutUs:
            if indexPath.section == 1 || sharedInstance.aboutUsSubMenu != nil { break }
            sharedInstance.aboutUsSubMenu = [.ourJourney, .reports, .weWorkWith, .gallery, .media, .footprints, .guestSpeak][indexPath.row]
            push()
            
        case .people:
            if indexPath.section == 1 || sharedInstance.peopleSubMenu != nil { break }
            sharedInstance.peopleSubMenu = [.trustees, .developmentCommittee,.faculty, .supporters, .inspirations][indexPath.row]
            push()
            
        case .projects:
            if indexPath.section == 1 || sharedInstance.projectsSubMenu != nil { break }
            sharedInstance.projectsSubMenu = [.ruralEmpowerment, .childEducation, .kidsForKidsSake, .palliativeCare, .publication][indexPath.row]
            push()
            
        case .workshops:
            if indexPath.section == 1 || sharedInstance.workshopsSubMenu != nil { break }
            sharedInstance.workshopsSubMenu = [.forWellness, .forRehab, .feedbacks][indexPath.row]
            push()
            
        case .supportGroups:
            if indexPath.section == 1 || sharedInstance.supportGroupsSubMenu != nil { break }
            sharedInstance.supportGroupsSubMenu = .neuroSculptorSeries
            push()
            
        case .contactUs:
            if indexPath.section == 1 || sharedInstance.contactUsSubMenu != nil { break }
            sharedInstance.contactUsSubMenu = [.supportUs, .ykBlogs][indexPath.row]
            push()
            
        default: break
        }
    }
    
    func push() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        vc.isSubMenu = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ContentViewController: HTTPUtilityDelegate {
    
    func parsed(withHeader header: String, content: String) {
        var head = header.replacingOccurrences(of: "\r", with: "")
        head = head.replacingOccurrences(of: "\t", with: "")
        head = head.replacingOccurrences(of: "\n", with: "")
        
        var body = content.replacingOccurrences(of: "\r", with: "")
        body = body.replacingOccurrences(of: "\t", with: "")
        body = body.replacingOccurrences(of: "\n", with: "")
        
        self.content = Content(header: head, content: body)
        
        self.tableView.reloadData()
    }
    
    func failed() {
        let imgV = UIImageView(image: UIImage(named: "no_network"))
        imgV.contentMode = .scaleAspectFit
        self.tableView.backgroundView = imgV
    }
}
