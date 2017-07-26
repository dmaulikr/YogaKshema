//
//  InitialCollectionViewCell.swift
//  Yoga Kshema
//
//  Created by Muqtadir Ahmed on 25/07/17.
//  Copyright © 2017 Bitjini. All rights reserved.
//

import UIKit

class InitialCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    
    func set() {
        labelTitle.text = [
            "Home",
            "About Us",
            "People",
            "Projects",
            "Talks",
            "Workshops",
            "Support Groups",
            "Events",
            "Contact Us"
        ][tag]
    }
    
}
