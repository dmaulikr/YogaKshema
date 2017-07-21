//
//  Extensions.swift
//  Yoga Kshema
//
//  Created by Muqtadir Ahmed on 13/07/17.
//  Copyright © 2017 Bitjini. All rights reserved.
//

import UIKit

public extension UITableView {
    func getTextViewCellHeight(for text: String) -> CGFloat {
        let textView = UITextView(frame: CGRect(x: 0.0, y: 0.0, width: Constants.width - 40.0, height: 0.0))
        textView.text = text
        textView.textAlignment = .justified
        let fit = textView.sizeThatFits(CGSize(width: Constants.width - 40.0, height: CGFloat.greatestFiniteMagnitude))
        return (fit.height + 40.0)
    }
}
