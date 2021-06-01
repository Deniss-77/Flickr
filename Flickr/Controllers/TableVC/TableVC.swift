//
//  ViewController.swift
//  Flickr
//
//  Created by Denis Kravets on 25.05.2021.
//

import UIKit

protocol TableViewProtocol: AnyObject {
    func reloadData()
}

class TableVC: UIViewController {
    
    // MARK: Properties
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        return tableView
    }()
    
    var presenter: TablePresenterProtocol!

    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.updateData()
  
        addSubviews()
        setupConstraints()
        setupDesign()
        tableViewDelegate()

    }
    
    func tableViewDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }

}

// MARK: TableViewDataSourse and TableViewDelegate {

extension TableVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfPhotos()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
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

// реализация протокола TableViewProtocol
extension TableVC: TableViewProtocol {
    func reloadData() {
        tableView.reloadData()
    }
}

