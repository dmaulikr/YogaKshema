//
//  Middleware.swift
//  Yoga Kshema
//
//  Created by Muqtadir Ahmed on 18/07/17.
//  Copyright © 2017 Bitjini. All rights reserved.
//

import Foundation

class Middleware {
    
    static let shared = Middleware()
    var delegate: HTTPUtilityDelegate?
    
    lazy private var httpUtility: HTTPUtility = {
        var http = HTTPUtility()
        http.delegate = self.delegate
        return http
    }()
    
    func request(page: String) {
        httpUtility.requestPage(withURL: page)
    }
    
}
