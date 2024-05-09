//
//  MainPageModel.swift
//  24Assignment
//
//  Created by Sandro Gelashvili on 08.05.24.
//

import Foundation

struct PhotoGalleryModel: Decodable {
    let urls: Urls
}

struct Urls: Codable {
    let raw, full, regular, small: String
    
}
