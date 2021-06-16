//
//  SearchPresenter.swift
//  Flickr
//
//  Created by Denis Kravets on 25.05.2021.
//

import Foundation

protocol SearchPresenterProtocol {
    func photoModel(at indexPath: IndexPath) -> PhotoModel?
    func numberOfPhotos() -> Int
    func updateData()
    func loadPhotosFromFlickrBySearch(searchText: String)
}

class SearchPresenter: SearchPresenterProtocol {
    
    weak var view: SearchViewProtocol!
    var network: NetworkManagerAF = NetworkManagerAF() // экземпляр класса, отвечающий за взаимодействие с сетью
    
    var arrayOfPhotos: [PhotoModel] = []
    
    // MARK: Methods
    
    func photoModel(at indexPath: IndexPath) -> PhotoModel? {
        return arrayOfPhotos[indexPath.row]
    }
    
    func numberOfPhotos() -> Int {
        return arrayOfPhotos.count
    }
    
    func updateData() {
        self.network.loadPhotos { (photos) in
            DispatchQueue.main.async {
                self.arrayOfPhotos = photos
                self.view.reloadData()
            }
        }
    }
    
    func loadPhotosFromFlickrBySearch(searchText: String) {
        self.network.loadPhotosBySearch(searchText: searchText) { (photos) in
            DispatchQueue.main.async {
                self.arrayOfPhotos = photos
                self.view.reloadData()
            }
        }
    }
    
}
