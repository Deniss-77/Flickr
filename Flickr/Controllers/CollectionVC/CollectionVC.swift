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
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.updateData()

        addSubviews()
        setupConstraints()
        setupDesign()
        collectionViewViewDelegate()
    }
    
    func collectionViewViewDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
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
}

// MARK: UICollectionViewDelegateFlowLayout

extension CollectionVC: UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 250)
    }
}

// реализация протокола CollectionViewProtocol
extension CollectionVC: CollectionViewProtocol {
    func reloadData() {
        collectionView.reloadData()
    }
}
