//
//  MainPageViewModel.swift
//  24Assignment
//
//  Created by Sandro Gelashvili on 08.05.24.
//

import Foundation
import SimpleNetworking

protocol MainPageViewControllerViewModelDelegate: AnyObject {
    func getPhotosForGallery(_ imageURLs: [String])
    
}

final class MainPageViewModel {
    
    weak var delegate: MainPageViewControllerViewModelDelegate?
    var photoGalleryModel: [PhotoGalleryModel]?
    var imageURLs: [String] = []
    private var networkService = NetworkService()
    
    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchImages() {
        networkService.fetchData(from: "https://api.unsplash.com/photos/?per_page=40&client_id=ol2VSKW_lagWen25tp71nfxto1REobIQ4cmUztijjTY") { (result: Result<[PhotoGalleryModel], Error>) in
            switch result {
            case .success(let photoModels):
                self.photoGalleryModel = photoModels
                let imageURLs = photoModels.compactMap { $0.urls.small }
                self.delegate?.getPhotosForGallery(imageURLs)
            case .failure(let error):
                print("Error fetching photos: \(error)")
            }
        }
    }
    
}
