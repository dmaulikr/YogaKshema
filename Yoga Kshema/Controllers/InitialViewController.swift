//
//  InitialViewController.swift
//  Yoga Kshema
//
//  Created by Muqtadir Ahmed on 25/07/17.
//  Copyright © 2017 Bitjini. All rights reserved.
//

import UIKit

class InitialViewController: BaseViewController {

    // IBOutlets.
    @IBOutlet weak var collectionViewMenu: UICollectionView!
    
    override func viewDidLoad() { super.viewDidLoad() }
    
    override func viewDidAppear(_ animated: Bool) { super.viewDidAppear(animated); onViewDidAppear() }
    
    func onViewDidAppear() {}

}

extension InitialViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InitialCollectionViewCell", for: indexPath) as? InitialCollectionViewCell else { return UICollectionViewCell() }
        cell.tag = indexPath.item
        cell.set()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return indexPath.item == 0 ?
            CGSize(width: Constants.width - 24.0, height: 80.0) :
            CGSize(width: (Constants.width - 36.0) / 2.0, height: 80.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        next(index: indexPath.item)
    }
    
    func next(index: Int) {
        // Set the selected menu.
        Menu.shared.menu = [.home, .aboutUs, .people, .projects, .talks, .workshops, .supportGroups, .events, .contactUs][index]
        // Push page.
        let vc = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
