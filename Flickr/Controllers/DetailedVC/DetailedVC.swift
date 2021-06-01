//
//  DetailedVC.swift
//  Flickr
//
//  Created by Denis Kravets on 31.05.2021.
//

import UIKit
import Kingfisher

protocol DetailedViewProtocol: AnyObject {
    
}

class DetailedVC: UIViewController {
    
    // MARK: Properties
    
    let image: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    var photo: PhotoModel?
        
    var presenter: DetailedPresenterProtocol!
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setupConstraint()
        setupDesign()
        setupImage()
    }
    
}

// реализация протокола DetailedViewProtocol
extension DetailedVC: DetailedViewProtocol {
    
}
