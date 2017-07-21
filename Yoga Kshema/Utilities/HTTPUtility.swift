//
//  HTTPUtility.swift
//  Yoga Kshema
//
//  Created by Muqtadir Ahmed on 18/07/17.
//  Copyright © 2017 Bitjini. All rights reserved.
//

import UIKit
import Alamofire

protocol HTTPUtilityDelegate {
    func parsed(withHeader header: String, content: String)
    func failed()
}

class HTTPUtility {
    
    lazy private var parser: HTMLParser = {
        let parser = HTMLParser()
        parser.delegate = self.delegate
        return parser
    }()
    
    var delegate: HTTPUtilityDelegate?
    
    func requestPage(withURL URL: String) {
        Alamofire.request(URL).responseString { (response) in
            guard response.result.isSuccess, let html = response.result.value else { self.delegate?.failed(); return }
            self.parser.parse(HTML: html)
        }
    }
}
