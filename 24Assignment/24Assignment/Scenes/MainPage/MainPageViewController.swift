//
//  MainPageViewController.swift
//  24Assignment
//
//  Created by Sandro Gelashvili on 08.05.24.
//

import UIKit

final class MainPageViewController: UIViewController {
    // MARK: - Properties
    var viewModel: MainPageViewModel
    
    // MARK: - UI Components
     let collectionViewForPhotos: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 1, height: UIScreen.main.bounds.width / 3 - 1)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        return collection
    }()
    
    private let titleForGallery: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Gallery"
        label.font = .boldSystemFont(ofSize: 32)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    // MARK: Lifecycle
    init(viewModel: MainPageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        viewModel.delegate = self
        viewModel.fetchImages()
        
    }
    // MARK: - UI Setup
   private func setUpUI() {
        view.backgroundColor = .white
        view.addSubview(titleForGallery)
        view.addSubview(collectionViewForPhotos)
        collectionViewForPhotos.delegate = self
        collectionViewForPhotos.dataSource = self
        collectionViewForPhotos.register(CollectionViewCellForPhoto.self, forCellWithReuseIdentifier: CollectionViewCellForPhoto.identifier)
        NSLayoutConstraint.activate([
            titleForGallery.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleForGallery.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            collectionViewForPhotos.topAnchor.constraint(equalTo: titleForGallery.bottomAnchor, constant: 10),
            collectionViewForPhotos.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionViewForPhotos.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionViewForPhotos.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    // MARK: Methods


}
#Preview {
    MainPageViewController(viewModel: MainPageViewModel())
}

