//
//  NetworkManager.swift
//  Flickr
//
//  Created by Denis Kravets on 25.05.2021.
//

import UIKit
import SwiftyJSON

class NetworkManager {
    
    // одно из свойств parameters, отвечающее за количество загружаемых фотографий
    var perPage = 25
    
    func createRequest(url: String, method: String, parameters: [String: Any]) -> URLRequest {
        
        var urlLocal = url
        for (key, value) in parameters {
            urlLocal += key + "=" + "\(value)" + "&"
        }
        
        var request = URLRequest(url: URL(string: urlLocal)!)
        request.httpMethod = method
        return request
    }
    
    func loadPhotos(completion: @escaping (_ photos: [PhotoModel]) -> ()) {

        let url = Constant.urlString
        let method = "GET"
        var parameters = Constant.parameters
        
        parameters["per_page"] = perPage
        perPage += 15

        let request: URLRequest = self.createRequest(url: url, method: method, parameters: parameters)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else { return }
            let json = JSON(data)
            let photosJSON = json["photos"]["photo"]
            let photos = photosJSON.arrayValue.compactMap { PhotoModel(json: $0) }
            completion(photos)
        }
        task.resume()
    }

}
