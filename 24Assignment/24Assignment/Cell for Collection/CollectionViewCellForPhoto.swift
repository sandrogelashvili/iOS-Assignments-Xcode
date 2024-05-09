//
//  CollectionViewCellForPhoto.swift
//  24Assignment
//
//  Created by Sandro Gelashvili on 08.05.24.
//

import UIKit

class CollectionViewCellForPhoto: UICollectionViewCell {
    static let identifier = "CollectionViewCellForPhoto"
    
    let imageForGallery: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpUI() {
        addSubview(imageForGallery)
        NSLayoutConstraint.activate([
            imageForGallery.topAnchor.constraint(equalTo: topAnchor),
            imageForGallery.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageForGallery.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageForGallery.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension UIImageView {
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data, let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self?.image = image
            }
        }
        task.resume()
    }
}

