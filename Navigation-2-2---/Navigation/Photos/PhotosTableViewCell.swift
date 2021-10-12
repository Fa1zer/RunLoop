//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 26.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var images: [UIImageView]? {
        didSet {
            for i in 0 ..< images!.count {
                
                images![i].contentMode = .scaleAspectFit
                
                stackView.insertArrangedSubview((images?[i])!, at: i)
            }
        }
    }
    
    private let stackView: UIStackView = {
       let view = UIStackView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 8
        view.distribution = .fillEqually
        
        return view
    }()
    
    private let photosLabel: UILabel = {
       let label = UILabel()
        
        label.text = "Photos"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let arrow: UIImageView = {
        let arrow = UIImageView(image: UIImage(systemName: "arrow.right"))
        
        arrow.tintColor = .black
        arrow.translatesAutoresizingMaskIntoConstraints = false
        
        return arrow
    }()
    
    private func setupViews() {
        contentView.addSubview(photosLabel)
        contentView.addSubview(arrow)
        contentView.addSubview(stackView)
        
        let constraints = [photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                                            constant: 12),
                           photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
                           
                           arrow.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
                           arrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
                           
                           stackView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor,
                                                          constant: 12),
                           stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
                           stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                               constant: -12),
                           stackView.heightAnchor.constraint(equalTo: contentView.widthAnchor,
                                                             multiplier: 0.25, constant: -12),
                           
                           contentView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor,
                                                               constant: 12)]
        
        NSLayoutConstraint.activate(constraints)
    }
}
