//
//  ViewController.swift
//  UnitTestingAssignment
//
//  Created by Chuck Norris on 11.05.1992.
//

import UIKit

final class ViewController: UIViewController {
    
    private let cartViewModel = CartViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        cartViewModel.viewDidLoad()
    }
}

