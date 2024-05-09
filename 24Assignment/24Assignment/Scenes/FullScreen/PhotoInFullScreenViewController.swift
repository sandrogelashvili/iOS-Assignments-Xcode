//
//  PhotoInFullScreenViewController.swift
//  24Assignment
//
//  Created by Sandro Gelashvili on 09.05.24.
//

import UIKit

class PhotoInFullScreenViewController: UIViewController {
    // MARK: - Properties
    var viewModel: PhotoInFullScreenViewControllerViewModel
    
    // MARK: - UI Components
    fileprivate let fullScreenScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentMode = .scaleAspectFit
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.backgroundColor = .black
        scroll.minimumZoomScale = 1
        scroll.maximumZoomScale = 6
        return scroll
    }()
    
    fileprivate let imageForScrollView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    fileprivate let labelForPhotoCount: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = "1/30"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Lifecycle
    init(viewModel: PhotoInFullScreenViewControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        loadSelectedPhoto()
        updatePhotoCountLabel()
        setupSwipeGestures()
        
    }
    // MARK: - UI Setup
    private func setUpUI() {
        view.backgroundColor = .black
        fullScreenScrollView.delegate = self
        view.addSubview(fullScreenScrollView)
        fullScreenScrollView.addSubview(imageForScrollView)
        view.addSubview(labelForPhotoCount)
        fullScreenScrollView.frame = view.bounds
        NSLayoutConstraint.activate([
            imageForScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageForScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageForScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            imageForScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            labelForPhotoCount.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelForPhotoCount.topAnchor.constraint(equalTo: imageForScrollView.bottomAnchor, constant: 20)
        ])
        setBackButtonAppearance()
    }
    // MARK: Methods
    
    func setBackButtonAppearance() {
        let backButtonItem = UIBarButtonItem()
        backButtonItem.title = "Gallery"
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButtonItem
        navigationController?.navigationBar.tintColor = .white
    }
    
    func loadSelectedPhoto() {
        guard let photoURL = viewModel.loadPhoto(atIndex: viewModel.selectedPhotoIndex) else {
            return
        }
        imageForScrollView.loadImage(from: photoURL)
    }
    
    func updatePhotoCountLabel() {
        labelForPhotoCount.text = viewModel.updatePhotoCountLabel()
    }
    
    private func setupSwipeGestures() {
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeRight(_:)))
        swipeRightGesture.direction = .right
        view.addGestureRecognizer(swipeRightGesture)
        
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeLeft(_:)))
        swipeLeftGesture.direction = .left
        view.addGestureRecognizer(swipeLeftGesture)
    }
    
    @objc func handleSwipeRight(_ gesture: UISwipeGestureRecognizer) {
        if viewModel.selectedPhotoIndex > 0 {
            viewModel.selectedPhotoIndex -= 1
            loadSelectedPhoto()
            updatePhotoCountLabel()
        }
    }
    
    @objc func handleSwipeLeft(_ gesture: UISwipeGestureRecognizer) {
        if viewModel.selectedPhotoIndex < viewModel.totalPhotosCount - 1 {
            viewModel.selectedPhotoIndex += 1
            loadSelectedPhoto()
            updatePhotoCountLabel()
        }
    }
}

extension PhotoInFullScreenViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageForScrollView
    }
}
#Preview {
    PhotoInFullScreenViewController(viewModel: PhotoInFullScreenViewControllerViewModel())
}
