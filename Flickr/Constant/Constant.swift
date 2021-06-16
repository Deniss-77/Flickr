//
//  Constant.swift
//  Flickr
//
//  Created by Denis Kravets on 25.05.2021.
//

import Foundation

struct Constant {
    
    static let urlString = "https://www.flickr.com/services/rest/?"
    static let url = URL(string: "https://www.flickr.com/services/rest/")
    static let apiKey = "2397b5f798f97be71d7729ad90d68216"
    
    static let parameters: [ String: Any] = [
        "method" : "flickr.interestingness.getList",
        "api_key" : "2397b5f798f97be71d7729ad90d68216",
        "format" : "json",
        "per_page" : 20,
        "page" : 2,
        "nojsoncallback": 1,
        "extras": "url_q"
    ]
    
}
