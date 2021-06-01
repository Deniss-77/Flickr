//
//  VisualCV.swift
//  Flickr
//
//  Created by Denis Kravets on 29.05.2021.
//

import UIKit

extension CollectionVC {
    
    // MARK: Methods
    
    // добавление элементов на вью
    func addSubviews() {
        view.addSubview(collectionView)
    }
    
    // установка констрейнтов
    func setupConstraints() {
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let collectionConstraint = [
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)]
        NSLayoutConstraint.activate(collectionConstraint)
        
    }
    
    // функция по установке визульных параметров экрана
    func setupDesign() {
        view.backgroundColor = .white
        navigationItem.title = "Коллекция"
        navigationItem.backButtonTitle = "Назад"
    }

}
