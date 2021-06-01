//
//  PhotoModel.swift
//  Flickr
//
//  Created by Denis Kravets on 26.05.2021.
//

import Foundation
import SwiftyJSON

struct PhotoModel: Decodable {
    
    let imageURL: String?
    
    init?(json: JSON) {
        
        guard let url = json["url_q"].string else { return nil }
        self.imageURL = url
    }
    
}
