//
//  SearchVC.swift
//  Flickr
//
//  Created by Denis Kravets on 25.05.2021.
//

import UIKit

protocol SearchViewProtocol: AnyObject {
    func reloadData()
}

class SearchVC: UIViewController {
    
    // MARK: Properties
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SearchCell.self, forCellReuseIdentifier: SearchCell.identifier)
        return tableView
    }()
    
    let searchBar: UISearchBar = {
        let search = UISearchBar()
        return search
    }()
    
    var presenter: SearchPresenterProtocol!
    
    // MARK: Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.updateData()
        
        addSubviews()
        setupConstraints()
        setupDesign()
        tableViewDelegate()
        searchBarDelegate()
    }
    
}

// MARK: TableViewDataSourse and TableViewDelegate

extension SearchVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfPhotos()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.identifier, for: indexPath) as! SearchCell
        guard let model = presenter.photoModel(at: indexPath) else { return UITableViewCell() }
        cell.configure(photoModel: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let model = (presenter.photoModel(at: indexPath)) else { return }
        self.goToDetailedVC(photo: model)
    }
    
}

// MARK: UISearchBarDelegate

extension SearchVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        presenter.loadPhotosFromFlickrBySearch(searchText: searchBar.text ?? "")
    }
}

// реализация протокола SearchViewProtocol
extension SearchVC: SearchViewProtocol {
    func reloadData() {
        tableView.reloadData()
    }
}
