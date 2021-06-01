//
//  VisualTV.swift
//  Flickr
//
//  Created by Denis Kravets on 26.05.2021.
//

import UIKit

extension TableVC {
    
    // MARK: Methods
    
    // добавление элементов на вью
    func addSubviews() {
        view.addSubview(tableView)
    }
    
    // установка констрейнтов
    func setupConstraints() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let tableConstraint = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)]
        NSLayoutConstraint.activate(tableConstraint)
        
    }
    
    // функция по установке визульных параметров экрана
    func setupDesign() {
        view.backgroundColor = .white
        navigationItem.title = "Таблица"
        navigationItem.backButtonTitle = "Назад"
        tableView.tableFooterView = UIView()
    }

}
