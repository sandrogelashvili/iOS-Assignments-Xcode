//
//  MainPageViewModel.swift
//  23Assignment
//
//  Created by Sandro Gelashvili on 02.05.24.
//

import Foundation
import SimpleNetworking

protocol MainPageViewControllerViewModelDelegate: AnyObject {
    func getRandomFactData(randomFact: String)
        
}

final class MainPageViewControllerViewModel {
    
    weak var delegate: MainPageViewControllerViewModelDelegate?
    var catsFacts: RandomCatsFactModel?
    private var networkService = NetworkService()
    
    init(networkService: NetworkService = NetworkService()) {
            self.networkService = networkService
        }
    
    
    func fetchRandomCatFact() {
            networkService.fetchData(from: "https://catfact.ninja/fact") { (result: Result<RandomCatsFactModel, Error>) in
                switch result {
                case .success(let factModel):
                    self.delegate?.getRandomFactData(randomFact: factModel.fact)
                case .failure(let error):
                    print("Error fetching random cat fact: \(error)")
                }
            }
        }
    
    func buttonForRandomFactTapped() {
        fetchRandomCatFact()
    }
}

