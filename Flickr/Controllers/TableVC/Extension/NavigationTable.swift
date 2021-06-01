//
//  NavigationTable.swift
//  Flickr
//
//  Created by Denis Kravets on 01.06.2021.
//

import Foundation

extension TableVC {
    
    // переход по нажатию на фотографию на DetailedVC
    func goToDetailedVC(photo: PhotoModel) {
        let vc = ModelBuilder.createDetailedVC(photo: photo)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
