//
//  Extensions.swift
//  Yoga Kshema
//
//  Created by Muqtadir Ahmed on 13/07/17.
//  Copyright © 2017 Bitjini. All rights reserved.
//

import UIKit

public extension String {
    
    func toTextView() -> UITextView {
        let textView = UITextView(frame: UITableViewCell(style: .default, reuseIdentifier: nil).bounds)
        textView.contentInset = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
        textView.textAlignment = .justified
        textView.isScrollEnabled = false
        textView.text = self
        textView.sizeToFit()
        textView.scrollRangeToVisible(NSRange(location: 0, length: 0))
        return textView
    }
    
}
