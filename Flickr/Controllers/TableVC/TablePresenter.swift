//
//  TableViewPresenter.swift
//  Flickr
//
//  Created by Denis Kravets on 25.05.2021.
//

import Foundation

protocol TablePresenterProtocol {
    func photoModel(at indexPath: IndexPath) -> PhotoModel?
    func numberOfPhotos() -> Int
    func updateData()
}

class TablePresenter: TablePresenterProtocol {
    
    // MARK: Properties

    weak var view: TableViewProtocol!
    var network: NetworkManager = NetworkManager() // экземпляр класса, отвечающий за интернет
    
    var arrayOfPhotos: [PhotoModel] = []
    
    // MARK: Methods
    
    func photoModel(at indexPath: IndexPath) -> PhotoModel? {
        return arrayOfPhotos[indexPath.row]
    }
    
    func numberOfPhotos() -> Int {
        return arrayOfPhotos.count
    }
    
    func updateData() {
        self.loadPhotosFromFlickr()
    }
    
    func loadPhotosFromFlickr() {
        self.network.loadPhotos { (photos) in
            DispatchQueue.main.async {
                self.arrayOfPhotos = photos
                self.view.reloadData()
            }
        }
    }
    
}
