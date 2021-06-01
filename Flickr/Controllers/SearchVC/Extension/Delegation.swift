//
//  Delegation.swift
//  Flickr
//
//  Created by Denis Kravets on 31.05.2021.
//

import Foundation

extension SearchVC {
    
    func tableViewDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func searchBarDelegate() {
        searchBar.delegate = self
    }
    
}
