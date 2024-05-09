//
//  CollectionViewCellForPhotoViewModel.swift
//  24Assignment
//
//  Created by Sandro Gelashvili on 09.05.24.
//

import Foundation
//
//final class CollectionViewCellForPhotoViewModel {
//    
//    var imageURL: String
//    
//    init(imageURL: String) {
//        self.imageURL = imageURL
//    }
//    
//    func loadImage(completion: @escaping (UIImage?) -> Void) {
//        guard let url = URL(string: imageURL) else {
//            completion(nil)
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data, let image = UIImage(data: data) else {
//                completion(nil)
//                return
//            }
//            
//            DispatchQueue.main.async {
//                completion(image)
//            }
//        }
//        task.resume()
//    }
//}
