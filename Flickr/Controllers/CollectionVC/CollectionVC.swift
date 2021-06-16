//
//  CollectionVC.swift
//  Flickr
//
//  Created by Denis Kravets on 25.05.2021.
//

import UIKit

protocol CollectionViewProtocol: AnyObject {
    func reloadData()
}

class CollectionVC: UIViewController {

    // MARK: Properties
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        return collectionView
    }()
    
    var presenter: CollectionPresenterProtocol!
    
    // MARK: Life cycle viewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.updateData()

        addSubviews()
        setupConstraints()
        setupDesign()
        collectionViewViewDelegate()
    }
    
    // MARK: Methods
    
    func collectionViewViewDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
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

// MARK: UICollectionViewDataSourse and UICollectionViewDelegate

extension CollectionVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfPhotos()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        guard let model = presenter.photoModel(at: indexPath) else { return UICollectionViewCell() }
        cell.configure(photoModel: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let model = (presenter.photoModel(at: indexPath)) else { return }
        self.goToDetailedVC(photo: model)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == presenter.numberOfPhotos() - 5 {
            presenter.updateData()
        }
    }
    
}

// MARK: UICollectionViewDelegateFlowLayout

extension CollectionVC: UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 250)
    }
}

// MARK: Navigation

extension CollectionVC {
 
    // переход по нажатию на фотографию на DetailedVC
    func goToDetailedVC(photo: PhotoModel) {
        let vc = ModelBuilder.createDetailedVC(photo: photo)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// реализация протокола CollectionViewProtocol
extension CollectionVC: CollectionViewProtocol {
    func reloadData() {
        collectionView.reloadData()
    }
}
