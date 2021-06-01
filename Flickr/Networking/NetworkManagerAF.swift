//
//  NetworkManagerAF.swift
//  Flickr
//
//  Created by Denis Kravets on 28.05.2021.
//

import UIKit
import Alamofire
import SwiftyJSON

class NetworkManagerAF {
    
    func loadPhotos(completion: @escaping (_ photos: [PhotoModel]) -> ()) {
        
        guard let url = Constant.url else { return }
        let parameters = Constant.parameters
        
        AF.request(url, method: .get, parameters: parameters)
            .validate()
            .responseData { (response) in
                
                switch response.result {
                case .success:
                    
                    guard let data = response.data else { return }
                    let json = JSON(data)
                    let photosJSON = json["photos"]["photo"]
                    let photos = photosJSON.arrayValue.compactMap { PhotoModel(json: $0) }
                    completion(photos)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    // загрузка фото с помощью строки поиска
    func loadPhotosBySearch(searchText: String?, completion: @escaping (_ photos: [PhotoModel]) -> ()) {
        
        guard let url = Constant.url else { return }
        var parameters = Constant.parameters
        
        if let searchText = searchText {
            parameters["method"] = "flickr.photos.search"
            parameters["text"] = searchText
        }
        
        AF.request(url, method: .get, parameters: parameters)
            .validate()
            .responseData { (response) in
                
                switch response.result {
                case .success:
                    
                    guard let data = response.data else { return }
                    let json = JSON(data)
                    let photosJSON = json["photos"]["photo"]
                    let photos = photosJSON.arrayValue.compactMap { PhotoModel(json: $0) }
                    completion(photos)
                
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    
}
