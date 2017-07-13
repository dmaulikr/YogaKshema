//
//  InitialViewController.swift
//  Yoga Kshema
//
//  Created by Muqtadir Ahmed on 13/07/17.
//  Copyright © 2017 Bitjini. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    fileprivate let titles = ["Home", "About Us", "People", "Projects", "Talks", "Workshops", "Support Groups", "Events", "Contact Us"]
    fileprivate let imageEps = ["", "", "", "", "", "", "", "", ""]
    
    @IBOutlet weak var collectionViewOptions: UICollectionView!

    override func viewDidLoad() { super.viewDidLoad() }
}

extension InitialViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InitialCollectionViewCell",
                                                            for: indexPath) as? InitialCollectionViewCell else { return UICollectionViewCell() }
        cell.set(title: titles[indexPath.item], imageEp: "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return indexPath.item == 0 ? CGSize(width: Constants.width - 24.0, height: 100.0) : CGSize(width: ((Constants.width - 36.0) / 2.0), height: 100.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            navigationController?.pushViewController(vc, animated: true)
            
        case 1:
            let vc = storyboard?.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
            navigationController?.pushViewController(vc, animated: true)
            
        default:
            break
        }
    }
}
