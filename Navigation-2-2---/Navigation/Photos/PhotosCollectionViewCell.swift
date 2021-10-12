//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 28.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    var image: UIImageView? {
        didSet {
            image?.clipsToBounds = true
            image?.contentMode = .scaleAspectFill
            image?.translatesAutoresizingMaskIntoConstraints = false
            
            setupViews()
        }
    }
    
    func setupViews() {        
        contentView.addSubview(image!)
        
        let constraints = [image!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                           image!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                           image!.topAnchor.constraint(equalTo: contentView.topAnchor),
                           image!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)]
        
        NSLayoutConstraint.activate(constraints)
    }
}
