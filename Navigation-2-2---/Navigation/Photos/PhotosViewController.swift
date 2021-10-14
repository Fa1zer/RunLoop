//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 27.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import iOSIntPackage

class PhotosViewController: UIViewController, Coordinatable {
    
    var callTabBar: (() -> Void)?
    weak var tabBar: TabBarController?

    var imageViews =  [UIImageView]()
    
    private let imageProcessor = ImageProcessor()
    private let imagePublisherFacade = ImagePublisherFacade()
    private let layout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        navigationItem.title = "Photo Gallery"
        
        
        
        collectionView.dataSource = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier:
                                    String(describing: PhotosCollectionViewCell.self))
        
        setupViews()
        
        imagePublisherFacade.subscribe(self)
        imagePublisherFacade.addImagesWithTimer(time: 2, repeat: 10)
        
        var firstImages = [UIImage]()
        let secondImages = [UIImage(named: "iphone 13")!, UIImage(named: "appleTV")!]
        let thirdImages = [UIImage(named: "ipad pro")!, UIImage(named: "airPods")!]
        let fourthImages = [UIImage(named: "apple watch")!, UIImage(named: "doge and elon")!]
        let fifthImages = [UIImage(named: "mac pro")!, UIImage(named: "mac mini")!]

        imageViews.forEach({firstImages.append($0.image!)})
        
        imageProcessor.processImagesOnThread(sourceImages: firstImages, filter: .colorInvert,
                                             qos: .background) { images in
            for i in 0 ..< images.count {
                DispatchQueue.main.async {
                    self.imageViews[i].image = UIImage(cgImage: images[i]!)
                }
            }
            
        } // 616
        
        imageProcessor.processImagesOnThread(sourceImages: secondImages, filter: .noir,
                                             qos: .default) { images in
            for i in 0 ..< images.count {
                DispatchQueue.main.async {
                    self.imageViews.append(UIImageView(image: UIImage(cgImage: images[i]!)))
                }
            }
        } // 62
        
        imageProcessor.processImagesOnThread(sourceImages: thirdImages, filter: .chrome,
                                             qos: .userInitiated) { images in
            for i in 0 ..< images.count {
                DispatchQueue.main.async {
                    self.imageViews.append(UIImageView(image: UIImage(cgImage: images[i]!)))
                }
            }
        } // 36
        
        imageProcessor.processImagesOnThread(sourceImages: fourthImages, filter: .fade,
                                             qos: .userInteractive) { images in
            for i in 0 ..< images.count {
                DispatchQueue.main.async {
                    self.imageViews.append(UIImageView(image: UIImage(cgImage: images[i]!)))
                }
            }
        } // 43
        
        imageProcessor.processImagesOnThread(sourceImages: fifthImages, filter: .posterize,
                                             qos: .utility) { images in
            for i in 0 ..< images.count {
                DispatchQueue.main.async {
                    self.imageViews.append(UIImageView(image: UIImage(cgImage: images[i]!)))
                }
            }
        } // 1068
    }
    
    private func setupViews() {
        
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        
        let constraints = [collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
                           collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                           collectionView.leadingAnchor.constraint(equalTo:
                                                            view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
                           collectionView.trailingAnchor.constraint(equalTo:
                                                        view.safeAreaLayoutGuide.trailingAnchor, constant: -8)]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        layout.itemSize = CGSize(width: (collectionView.frame.width - 16) / 3,
                                 height: (collectionView.frame.width - 16) / 3)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        imagePublisherFacade.removeSubscription(for: self)
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    { imageViews.count }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
    UICollectionViewCell {
        let cell: PhotosCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                    String(describing: PhotosCollectionViewCell.self),
                                                            for: indexPath) as! PhotosCollectionViewCell
        
        guard imageViews.isEmpty == false else {
            return cell
        }

        cell.image = imageViews[indexPath.item]

        return cell
    }
}

extension PhotosViewController: ImageLibrarySubscriber {
    func receive(images: [UIImage]) {
        self.imageViews.append(UIImageView(image: images[images.count - 1]))

        collectionView.reloadItems(at: [IndexPath(item: images.count - 1, section: 0)])
    }
}
