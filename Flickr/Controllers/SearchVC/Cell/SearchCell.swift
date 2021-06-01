//
//  SearchCell.swift
//  Flickr
//
//  Created by Denis Kravets on 31.05.2021.
//

import UIKit
import Kingfisher

class SearchCell: UITableViewCell {
    
    // MARK: Properties
    
    static let identifier = "searchCell"
    
    let image: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    // MARK: Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(image)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        let imageConstraint = [
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
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
