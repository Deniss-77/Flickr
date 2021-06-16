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
    
    // MARK: Life cycle viewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setupConstraint()
        setupDesign()
        setupImage()
    }
    
    // MARK: Methods
    
    // добавление элементов на вью
    func addSubviews() {
        view.addSubview(image)
    }
    
    // функция по установке визульных параметров экрана
    func setupDesign() {
        view.backgroundColor = .white
        navigationItem.title = ""
    }
    
    // установка констрейнтов
    func setupConstraint() {
        image.translatesAutoresizingMaskIntoConstraints = false
        let imageConstraint = [
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150)
        ]
        NSLayoutConstraint.activate(imageConstraint)
    }
    
    // открытие фотографии по url
    func setupImage() {
        if let photo = photo, let url = URL(string: (photo.imageURL)!) {
            image.kf.setImage(with: url)
        }
    }
    
}

// реализация протокола DetailedViewProtocol
extension DetailedVC: DetailedViewProtocol {
    
}
