//
//  HTMLParser.swift
//  Yoga Kshema
//
//  Created by Muqtadir Ahmed on 18/07/17.
//  Copyright © 2017 Bitjini. All rights reserved.
//

import Foundation
import Kanna

class HTMLParser {
    
    var delegate: HTTPUtilityDelegate?
    
    func parse(HTML doc: String) {
        guard let document = Kanna.HTML(html: doc, encoding: .utf8) else { delegate?.failed(); return }
        // Search for class content by CSS Selector.
        let content = document.css("div[class='entry-content cf']").first?.text ?? ""
        let header = document.css("h1[class='entry-title']").first?.text ?? ""
        delegate?.parsed(withHeader: header, content: content)
    }
    
}
