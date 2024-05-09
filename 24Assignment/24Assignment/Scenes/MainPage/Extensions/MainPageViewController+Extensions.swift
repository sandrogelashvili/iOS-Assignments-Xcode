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
            self.applySnapshot()
        }
    }
}

extension MainPageViewController: UICollectionViewDelegate {
    internal func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let fullScreenViewModel = PhotoInFullScreenViewControllerViewModel()
        fullScreenViewModel.selectedPhotoIndex = indexPath.item
        fullScreenViewModel.imageURLs = viewModel.imageURLs
        let fullScreenViewController = PhotoInFullScreenViewController(viewModel: fullScreenViewModel)
        navigationController?.pushViewController(fullScreenViewController, animated: true)
    }
}

extension MainPageViewController {
    enum Section {
        case main
    }
}

