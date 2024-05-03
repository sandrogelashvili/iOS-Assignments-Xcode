//
//  MainPageViewController.swift
//  23Assignment
//
//  Created by Sandro Gelashvili on 02.05.24.
//

import UIKit

final class MainPageViewController: UIViewController {
    
    var viewModel: MainPageViewControllerViewModel
    
    // MARK: - UI Components
    private var imageForCat: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "catsBackgroundImage")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var titleForRandomFact: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.text = "Random facts"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private var textForRandomFact: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textContainerInset = UIEdgeInsets(top: 20, left: 8, bottom: 8, right: 8)
        text.font = .systemFont(ofSize: 16)
        text.backgroundColor = UIColor(named: "CostumeColor")
        text.layer.masksToBounds = true
        text.layer.cornerRadius = 15
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.systemGray.cgColor
        return text
    }()
    
    private var buttonForRandomFact: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.setTitle("MeoW", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    // MARK: Lifecycle
    
    init(viewModel: MainPageViewControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpUI()
        setUpData()
    }
    // MARK: - UI Setup
    private func setUpUI() {
        view.addSubview(imageForCat)
        view.addSubview(textForRandomFact)
        view.addSubview(buttonForRandomFact)
        view.addSubview(titleForRandomFact)
        NSLayoutConstraint.activate([
            imageForCat.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageForCat.topAnchor.constraint(equalTo: view.topAnchor),
            imageForCat.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageForCat.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -400),
            titleForRandomFact.topAnchor.constraint(equalTo: imageForCat.bottomAnchor, constant: 40),
            titleForRandomFact.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textForRandomFact.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textForRandomFact.topAnchor.constraint(equalTo: imageForCat.bottomAnchor, constant: 75),
            textForRandomFact.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            textForRandomFact.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            buttonForRandomFact.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            buttonForRandomFact.topAnchor.constraint(equalTo: textForRandomFact.bottomAnchor, constant: 30),
            buttonForRandomFact.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            buttonForRandomFact.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        ])
    }
    
    
    // MARK: Methods
    private func setUpData() {
        viewModel.delegate = self
        buttonForRandomFact.addAction(UIAction(handler: { _ in
            self.viewModel.buttonForRandomFactTapped()
        }), for: .touchUpInside)
    }
}
    // MARK: Extensions
extension MainPageViewController: MainPageViewControllerViewModelDelegate {
    func getRandomFactData(randomFact: String) {
        self.textForRandomFact.text = randomFact
    }
    
}


#Preview {
    MainPageViewController(viewModel: MainPageViewControllerViewModel())
}
