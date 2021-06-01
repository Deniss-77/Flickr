//
//  ModelBuilder.swift
//  Flickr
//
//  Created by Denis Kravets on 25.05.2021.
//

import UIKit

protocol Builder {
    static func createTableVC() -> UIViewController
    static func createCollectionVC() -> UIViewController
    static func createSearchVC() -> UIViewController
}

class ModelBuilder: Builder {
   
    static func createTableVC() -> UIViewController {
        let vc = TableVC()
        let presenter = TablePresenter()
        vc.presenter = presenter
        presenter.view = vc
        return vc
    }
    
    static func createCollectionVC() -> UIViewController {
        let vc = CollectionVC()
        let presenter = CollectionPresenter()
        vc.presenter = presenter
        presenter.view = vc
        return vc
    }
    
    static func createSearchVC() -> UIViewController {
        let vc = SearchVC()
        let presenter = SearchPresenter()
        vc.presenter = presenter
        presenter.view = vc
        return vc
    }
    
    static func createDetailedVC(photo: PhotoModel) -> UIViewController {
        let vc = DetailedVC()
        let presenter = DetailedPresenter()
        vc.presenter = presenter
        vc.photo = photo
        presenter.view = vc
        return vc
    }
    
}
