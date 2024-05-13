//
//  Models.swift
//  UnitTestingAssignment
//
//  Created by Chuck Norris on 11.05.1992.
//

import Foundation

//class ProductsResponse: Decodable {
//    
//    var products: [Product]?
//    
//    static let dummyProducts = [
//            Product(id: 1, title: "iPhone 9", description: "An apple mobile which is nothing like apple", price: 549),
//            Product(id: 2, title: "iPhone X", description: "SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...", price: 899),
//            Product(id: 3, title: "Samsung Universe 9", description: "Samsung's new variant which goes beyond Galaxy to the Universe", price: 1249),
//            Product(id: 4, title: "OPPOF19", description: "OPPO F19 is officially announced on April 2021.", price: 280),
//            Product(id: 5, title: "Huawei P30", description: "Huawei’s re-badged P30 Pro New Edition was officially unveiled yesterday in Germany and now the device has made its way to the UK.", price: 499),
//            Product(id: 6, title: "MacBook Pro", description: "MacBook Pro 2021 with mini-LED display may launch between September, November", price: 1749),
//            Product(id: 7, title: "Samsung Galaxy Book", description: "Samsung Galaxy Book S (2020) Laptop With Intel Lakefield Chip, 8GB of RAM Launched", price: 1499),
//            Product(id: 8, title: "Microsoft Surface Laptop 4", description: "Style and speed. Stand out on HD video calls backed by Studio Mics. Capture ideas on the vibrant touchscreen.", price: 1499),
//            Product(id: 9, title: "Infinix INBOOK", description: "Infinix Inbook X1 Ci3 10th 8GB 256GB 14 Win10 Grey – 1 Year Warranty", price: 1099),
//            Product(id: 10, title: "HP Pavilion 15-DK1056WM", description: "HP Pavilion 15-DK1056WM Gaming Laptop 10th Gen Core i5, 8GB, 256GB SSD, GTX 1650 4GB, Windows 10", price: 1099),
//            Product(id: 11, title: "perfume Oil", description: "Mega Discount, Impression of Acqua Di Gio by GiorgioArmani concentrated attar perfume Oil", price: 13),
//            Product(id: 12, title: "Brown Perfume", description: "Royal_Mirage Sport Brown Perfume for Men & Women - 120ml", price: 40),
//            Product(id: 13, title: "Fog Scent Xpressio Perfume", description: "Product details of Best Fog Scent Xpressio Perfume 100ml For Men cool long lasting perfumes for Men", price: 13),
//            Product(id: 14, title: "Non-Alcoholic Concentrated Perfume Oil", description: "Original Al Munakh® by Mahal Al Musk | Our Impression of Climate | 6ml Non-Alcoholic Concentrated Perfume Oil", price: 120),
//            Product(id: 15, title: "Eau De Perfume Spray", description: "Genuine  Al-Rehab spray perfume from UAE/Saudi Arabia/Yemen High Quality", price: 30)
//    ]
//}

struct Sasass: Decodable {
    let products: [Product]
}

class Product: Decodable {
    
    var id: Int?
    var title: String?
    var description: String?
    var price: Double?
    var selectedQuantity: Int? = 0
    
    init(id: Int? = nil, title: String? = nil, description: String? = nil, price: Double? = nil, selectedQuantity: Int? = nil) {
        self.id = id
        self.title = title
        self.description = description
        self.price = price
        self.selectedQuantity = selectedQuantity
    }
}

