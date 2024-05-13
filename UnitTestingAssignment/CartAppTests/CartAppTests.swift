//
//  CartAppTests.swift
//  CartAppTests
//
//  Created by Sandro Gelashvili on 12.05.24.
//

import XCTest
@testable import UnitTestingAssignment

final class CartAppTests: XCTestCase {
    
    var cartViewModel: CartViewModel!
    
    override func setUpWithError() throws {
        cartViewModel = CartViewModel()
    }
    
    override func tearDownWithError() throws {
        cartViewModel = nil
    }
    
    func testAddProductWithID() {
        let productID = 123
        let productToAdd = Product(id: productID, title: "Test Product", description: "Test Description", price: 10.0, selectedQuantity: 1)
        cartViewModel.allproducts = [productToAdd]
        cartViewModel.addProduct(withID: productID)
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
        XCTAssertEqual(cartViewModel.selectedProducts.first?.id, productID)
    }
    
    func testAddProduct() {
        let productToAdd = Product(id: 456, title: "Test Product", description: "Test Description", price: 15.0, selectedQuantity: 2)
        cartViewModel.addProduct(product: productToAdd)
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
        XCTAssertEqual(cartViewModel.selectedProducts.first?.id, 456)
        XCTAssertEqual(cartViewModel.selectedProducts.first?.selectedQuantity, 2)
    }
    
    func testAddRandomProduct() {
        let mockAllProducts = [Product(id: 1), Product(id: 2), Product(id: 3)]
        cartViewModel.allproducts = mockAllProducts
        cartViewModel.addRandomProduct()
        XCTAssertNotNil(cartViewModel.selectedProducts.first)
        XCTAssertTrue(mockAllProducts.contains(where: { $0.id == cartViewModel.selectedProducts.first?.id }))
    }
    
    func testRemoveProductWithID() {
        let productIDToRemove = 123
        cartViewModel.selectedProducts = [Product(id: productIDToRemove), Product(id: 456)]
        cartViewModel.removeProduct(withID: productIDToRemove)
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
        XCTAssertFalse(cartViewModel.selectedProducts.contains(where: { $0.id == productIDToRemove }))
    }
    
    func testClearCart() {
        cartViewModel.selectedProducts = [Product(id: 1), Product(id: 2), Product(id: 3)]
        cartViewModel.clearCart()
        XCTAssertTrue(cartViewModel.selectedProducts.isEmpty)
    }
    
    func testSelectedItemsQuantity() {
        cartViewModel.selectedProducts = [Product(selectedQuantity: 2), Product(selectedQuantity: 3)]
        XCTAssertEqual(cartViewModel.selectedItemsQuantity, 5)
    }

    func testTotalPrice() {
        cartViewModel.selectedProducts = [Product(price: 10.0, selectedQuantity: 2), Product(price: 15.0, selectedQuantity: 3)]
        XCTAssertEqual(cartViewModel.totalPrice, 2 * 10.0 + 3 * 15.0)
    }
}

