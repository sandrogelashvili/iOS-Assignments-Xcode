//
//  MainPageViewController+Extensions.swift
//  24Assignment
//
//  Created by Sandro Gelashvili on 08.05.24.
//

import UIKit

extension MainPageViewController: MainPageViewControllerViewModelDelegate {
    func getPhotosForGallery(_ imageURLs: [String]) {
        DispatchQueue.main.async {
            self.viewModel.imageURLs = imageURLs
            self.collectionViewForPhotos.reloadData()
        }
    }
}

extension MainPageViewController: UICollectionViewDelegate {
    
}

extension MainPageViewController: UICollectionViewDelegateFlowLayout {

}

extension MainPageViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.imageURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewForPhotos.dequeueReusableCell(withReuseIdentifier: CollectionViewCellForPhoto.identifier, for: indexPath) as! CollectionViewCellForPhoto
        let imageURL = viewModel.imageURLs[indexPath.item]
        cell.imageForGallery.loadImage(from: imageURL)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let fullScreenViewModel = PhotoInFullScreenViewControllerViewModel()
        fullScreenViewModel.selectedPhotoIndex = indexPath.item
        fullScreenViewModel.imageURLs = viewModel.imageURLs
        let fullScreenViewController = PhotoInFullScreenViewController(viewModel: fullScreenViewModel)
        navigationController?.pushViewController(fullScreenViewController, animated: true)
    }
}
