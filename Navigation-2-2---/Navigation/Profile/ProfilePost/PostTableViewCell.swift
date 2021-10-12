//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 19.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import iOSIntPackage

class PostTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageProcessor = ImageProcessor()
    
    var post: ProfilePost? {
        didSet {
            autorLabel.text = post!.autor
            likeLabel.text = "likes: \(post!.likes)"
            viewsLabel.text = "views: \(post!.views)"
            descriptionPost.text = post!.description
            
            imageProcessor.processImage(sourceImage: UIImage(named: post!.image)!,
                                        filter: .allCases.randomElement()!) { [weak self] (image: UIImage?) in
                self?.imagePost.image = image
            }
        }
    }
    
    private let autorLabel: UILabel = {
       let autor = UILabel()
        
        autor.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        autor.textColor = .black
        autor.numberOfLines = 2
        autor.translatesAutoresizingMaskIntoConstraints = false
        
        return autor
    }()
    
    private let likeLabel: UILabel = {
       let likes = UILabel()
        
        likes.font = UIFont.systemFont(ofSize: 16)
        likes.textColor = .black
        likes.translatesAutoresizingMaskIntoConstraints = false
        
        return likes
    }()
    
    private let viewsLabel: UILabel = {
       let views = UILabel()
        
        views.font = UIFont.systemFont(ofSize: 16)
        views.textColor = .black
        views.translatesAutoresizingMaskIntoConstraints = false
        
        return views
    }()
    
    private let descriptionPost: UILabel = {
       let description = UILabel()
        
        description.font = UIFont.systemFont(ofSize: 14)
        description.textColor = .systemGray
        description.numberOfLines = 0
        description.translatesAutoresizingMaskIntoConstraints = false
        
        return description
    }()
    
    private let imagePost: UIImageView = {
       let image = UIImageView()
        
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private func setupViews() {
        addSubview(autorLabel)
        addSubview(likeLabel)
        addSubview(viewsLabel)
        addSubview(descriptionPost)
        addSubview(imagePost)
        
        let constraints = [autorLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                           autorLabel.leadingAnchor.constraint(equalTo:
                                                                safeAreaLayoutGuide.leadingAnchor,
                                                               constant: 16),
                          
                          imagePost.topAnchor.constraint(equalTo: autorLabel.bottomAnchor,
                                                         constant: 12),
                          imagePost.leadingAnchor.constraint(equalTo:
                                                                safeAreaLayoutGuide.leadingAnchor),
                          imagePost.trailingAnchor.constraint(equalTo:
                                                                safeAreaLayoutGuide.trailingAnchor),
                          imagePost.heightAnchor.constraint(equalTo: imagePost.widthAnchor),
        
                          descriptionPost.topAnchor.constraint(equalTo: imagePost.bottomAnchor,
                                                               constant: 16),
                          descriptionPost.leadingAnchor.constraint(equalTo:  imagePost.leadingAnchor,
                                                                   constant: 16),
                          descriptionPost.trailingAnchor.constraint(equalTo: imagePost.trailingAnchor,
                                                                    constant: -16),
                          
                          likeLabel.leadingAnchor.constraint(equalTo:
                                                                safeAreaLayoutGuide.leadingAnchor,
                                                             constant: 16),
                          likeLabel.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor,
                                                         constant: 16),
        
                          viewsLabel.trailingAnchor.constraint(equalTo:
                                                                safeAreaLayoutGuide.trailingAnchor,
                                                               constant: -16),
                          viewsLabel.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor,
                                                          constant: 16),

                          bottomAnchor.constraint(equalTo: likeLabel.bottomAnchor, constant: 16)]
        
        NSLayoutConstraint.activate(constraints)
    }
}
