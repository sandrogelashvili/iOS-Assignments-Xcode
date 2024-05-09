//
//  PhotoInFullScreenViewControllerViewModel.swift
//  24Assignment
//
//  Created by Sandro Gelashvili on 09.05.24.
//

import Foundation

class PhotoInFullScreenViewControllerViewModel {
    var imageURLs: [String] = []
    var selectedPhotoIndex: Int = 0
    var totalPhotosCount: Int {
        return imageURLs.count
    }
    
    func loadPhoto(atIndex index: Int) -> String? {
        guard index >= 0 && index < imageURLs.count else {
            return nil
        }
        return imageURLs[index]
    }
    
    func updatePhotoCountLabel() -> String {
        return "\(selectedPhotoIndex + 1)/\(totalPhotosCount)"
    }
}
