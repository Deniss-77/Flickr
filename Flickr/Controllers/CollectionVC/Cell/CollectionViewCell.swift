//
//  CollectionViewCell.swift
//  Flickr
//
//  Created by Denis Kravets on 29.05.2021.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
 
    // MARK: Properties
    
    static let identifier = "collectionCell"
    
    let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    // MARK: Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(image)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        let imageConstraint = [
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            image.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            image.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ]
        NSLayoutConstraint.activate(imageConstraint)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    
    func configure(photoModel: PhotoModel) {
        guard let url = photoModel.imageURL else { return }
        image.kf.setImage(with: URL(string: url))
    }
    
}
