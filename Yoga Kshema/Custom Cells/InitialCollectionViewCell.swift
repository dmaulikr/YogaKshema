//
//  InitialCollectionViewCell.swift
//  Yoga Kshema
//
//  Created by Muqtadir Ahmed on 13/07/17.
//  Copyright © 2017 Bitjini. All rights reserved.
//

import UIKit

class InitialCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    func set(title: String, imageEp: String) {
        self.title.text = title
        imageView.image = UIImage(named: imageEp)
    }
}
