//
//  VisualSearch.swift
//  Flickr
//
//  Created by Denis Kravets on 31.05.2021.
//

import UIKit

extension SearchVC {
    
    // MARK: Methods
    
    // добавление элементов на вью
    func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(searchBar)
    }
    
    // установка констрейнтов
    func setupConstraints() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let tableConstraint = [
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)]
        NSLayoutConstraint.activate(tableConstraint)
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        let searchConstraint = [
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)]
        NSLayoutConstraint.activate(searchConstraint)
        
    }
    
    // функция по установке визульных параметров экрана
    func setupDesign() {
        view.backgroundColor = .white
        navigationItem.title = "Поиск"
        navigationItem.backButtonTitle = "Назад"
        tableView.tableFooterView = UIView()
    }

}

