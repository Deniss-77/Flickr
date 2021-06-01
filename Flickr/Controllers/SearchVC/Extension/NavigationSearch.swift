//
//  NavigationSearch.swift
//  Flickr
//
//  Created by Denis Kravets on 31.05.2021.
//

import Foundation

extension SearchVC {
    
    // переход по нажатию на фотографию на DetailedVC
    func goToDetailedVC(photo: PhotoModel) {
        let vc = ModelBuilder.createDetailedVC(photo: photo)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
