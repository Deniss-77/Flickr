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

    // MARK: Life cycle viewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.updateData()
  
        tableViewDelegate()
        addSubviews()
        setupConstraints()
        setupDesign()
    }
    
    // MARK: Methods
    
    func tableViewDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.item == presenter.numberOfPhotos() - 5 {
            presenter.updateData()
        }
    }
    
}

// MARK: Navigation

extension TableVC {
    
    // переход по нажатию на фотографию на DetailedVC
    func goToDetailedVC(photo: PhotoModel) {
        let vc = ModelBuilder.createDetailedVC(photo: photo)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// реализация протокола TableViewProtocol
extension TableVC: TableViewProtocol {
    func reloadData() {
        tableView.reloadData()
    }
}

