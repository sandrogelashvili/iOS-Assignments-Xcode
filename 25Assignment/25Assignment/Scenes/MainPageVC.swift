//
//  MainPageVC.swift
//  25Assignment
//
//  Created by Sandro Gelashvili on 10.05.24.
//

import UIKit

final class CircularProgressBar: UIProgressView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2
        clipsToBounds = true
    }
}

 final class MainPageVC: UIViewController {
    // MARK: - Properties
    private let viewModel: MainPageViewModel
    private var isPlaying = false
    private var currentProgress: Float = 0.0
    private let durationInSeconds: Float = 218
    private var progressIncrement: Float = 0.0
    private var progressTimer: Timer?
    
    // MARK: - UI Components
    private let blurImageForKHatia: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Khatia")
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = image.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        image.addSubview(blurEffectView)
        return image
    }()
    
    private let imageForKHatia: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Khatia")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        return image
    }()
    
    private let songName: UILabel = {
        let label = UILabel()
        label.text = "ნაშა ბიჭები"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let performerName: UILabel = {
        let label = UILabel()
        label.text = "ხატია წერეთელი"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    private let progressBar: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.trackTintColor = .systemGray
        progress.progressTintColor = .systemBlue
        progress.setProgress(0, animated: false)
        return progress
    }()
    
    private let currentTime: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let totalTime: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private let shuffleButton: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "shuffle")
        image.contentMode = .scaleAspectFit
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let previousButton: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "backward.end")
        image.contentMode = .scaleAspectFit
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
     
     private let circularProgressBar: CircularProgressBar = {
         let progressBar = CircularProgressBar(progressViewStyle: .default)
         progressBar.progressTintColor = .systemBlue
         progressBar.trackTintColor = .clear
         progressBar.translatesAutoresizingMaskIntoConstraints = false
         return progressBar
     }()
     
     private let playStopButton: UIButton = {
         let button = UIButton()
         button.setImage(UIImage(named: "startButton"), for: .normal)
         button.contentMode = .scaleAspectFill
         button.tintColor = .systemBlue
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
     }()
     
    private let nextButton: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "forward.end")
        image.contentMode = .scaleAspectFit
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let repeatButton: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "repeat")
        image.contentMode = .scaleAspectFit
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let backgroundOnBottom: UIView = {
        let backview = UIView()
        backview.backgroundColor = UIColor(named: "ColorForbottomBack")
        backview.layer.cornerRadius = 30
        backview.clipsToBounds = true
        return backview
    }()
    
    private let houseSymbol: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "house")
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let musicNoteSymbol: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "music.note")
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
        
    private let heartSymbol: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "heart")
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: Lifecycle
    
    init(viewModel: MainPageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        addActionToPlayStopButton()
        updateTimeLabels()
        setUpTapGestureRecognizers()
    }
    // MARK: - UI Setup
    private func setUpUI() {
        let views = [blurImageForKHatia, imageForKHatia, songName, performerName, backgroundOnBottom, stackView, progressBar, currentTime, totalTime, circularProgressBar]
        views.forEach { view in
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        backgroundOnBottom.addSubview(houseSymbol)
        backgroundOnBottom.addSubview(heartSymbol)
        backgroundOnBottom.addSubview(musicNoteSymbol)
        stackView.addArrangedSubview(shuffleButton)
        stackView.addArrangedSubview(previousButton)
        stackView.addArrangedSubview(playStopButton)
        stackView.addArrangedSubview(nextButton)
        stackView.addArrangedSubview(repeatButton)
        NSLayoutConstraint.activate([
            blurImageForKHatia.topAnchor.constraint(equalTo: view.topAnchor),
            blurImageForKHatia.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurImageForKHatia.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blurImageForKHatia.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageForKHatia.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            imageForKHatia.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageForKHatia.widthAnchor.constraint(equalToConstant: 304),
            imageForKHatia.heightAnchor.constraint(equalToConstant: 350),
            songName.topAnchor.constraint(equalTo: imageForKHatia.bottomAnchor, constant: 34),
            songName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            performerName.topAnchor.constraint(equalTo: songName.bottomAnchor),
            performerName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundOnBottom.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backgroundOnBottom.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            backgroundOnBottom.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            backgroundOnBottom.heightAnchor.constraint(equalToConstant: 85),
            houseSymbol.centerYAnchor.constraint(equalTo: backgroundOnBottom.centerYAnchor),
            houseSymbol.widthAnchor.constraint(equalToConstant: 30),
            houseSymbol.heightAnchor.constraint(equalToConstant: 30),
            houseSymbol.leadingAnchor.constraint(equalTo: backgroundOnBottom.leadingAnchor, constant: 37),
            musicNoteSymbol.centerYAnchor.constraint(equalTo: backgroundOnBottom.centerYAnchor),
            musicNoteSymbol.widthAnchor.constraint(equalToConstant: 30),
            musicNoteSymbol.heightAnchor.constraint(equalToConstant: 30),
            musicNoteSymbol.centerXAnchor.constraint(equalTo: backgroundOnBottom.centerXAnchor),
            heartSymbol.centerYAnchor.constraint(equalTo: backgroundOnBottom.centerYAnchor),
            heartSymbol.widthAnchor.constraint(equalToConstant: 30),
            heartSymbol.heightAnchor.constraint(equalToConstant: 30),
            heartSymbol.trailingAnchor.constraint(equalTo: backgroundOnBottom.trailingAnchor, constant: -37),
            stackView.bottomAnchor.constraint(equalTo: backgroundOnBottom.topAnchor, constant: -40),
            stackView.heightAnchor.constraint(equalToConstant: 75),
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            shuffleButton.widthAnchor.constraint(equalToConstant: 25),
            shuffleButton.heightAnchor.constraint(equalToConstant: 25),
            previousButton.widthAnchor.constraint(equalToConstant: 27),
            previousButton.heightAnchor.constraint(equalToConstant: 27),
            playStopButton.widthAnchor.constraint(equalToConstant: 60),
            playStopButton.heightAnchor.constraint(equalToConstant: 55),
            nextButton.widthAnchor.constraint(equalToConstant: 27),
            nextButton.heightAnchor.constraint(equalToConstant: 27),
            repeatButton.widthAnchor.constraint(equalToConstant: 25),
            repeatButton.heightAnchor.constraint(equalToConstant: 25),
            progressBar.topAnchor.constraint(equalTo: performerName.bottomAnchor, constant: 34),
            progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
            currentTime.leadingAnchor.constraint(equalTo: progressBar.leadingAnchor),
            currentTime.topAnchor.constraint(equalTo: progressBar.bottomAnchor),
            totalTime.trailingAnchor.constraint(equalTo: progressBar.trailingAnchor),
            totalTime.topAnchor.constraint(equalTo: progressBar.bottomAnchor),
            circularProgressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circularProgressBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
            circularProgressBar.widthAnchor.constraint(equalToConstant: 100),
            circularProgressBar.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    // MARK: Methods
    private func addActionToPlayStopButton() {
        playStopButton.addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else {return}
            if self.isPlaying {
                self.playStopButton.setImage(UIImage(named: "pauseButton"), for: .normal)
                self.startProgressBar()
                self.animateImageShrink()
                self.animateCircleProgressBar()
            } else {
                self.playStopButton.setImage(UIImage(named: "startButton"), for: .normal)
                self.stopProgressBar()
            }
            self.isPlaying.toggle()
        }), for: .touchUpInside)
    }
    
    private func startProgressBar() {
        progressIncrement = 1.0 / durationInSeconds
        progressTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.progressBar.progress += self.progressIncrement
            if self.progressBar.progress >= 1.0 {
                timer.invalidate()
            }
            self.updateTimeLabels()
        }
    }
    
    private func updateTimeLabels() {
        let currentTimes = Int (progressBar.progress * durationInSeconds)
        let totalTimes = Int (durationInSeconds)
        currentTime.text = formattedTime(seconds: currentTimes)
        totalTime.text = formattedTime(seconds: totalTimes)
    }
    
    private func formattedTime(seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
     
     private func stopProgressBar() {
         progressTimer?.invalidate()
         currentProgress = progressBar.progress
     }
     
     private func setUpTapGestureRecognizers() {
         let houseTapGesture = UITapGestureRecognizer(target: self, action: #selector(houseSymbolTapped))
         houseSymbol.addGestureRecognizer(houseTapGesture)
         houseSymbol.isUserInteractionEnabled = true
         
         let musicNoteTapGesture = UITapGestureRecognizer(target: self, action: #selector(musicNoteSymbolTapped))
         musicNoteSymbol.addGestureRecognizer(musicNoteTapGesture)
         musicNoteSymbol.isUserInteractionEnabled = true
         
         let heartTapGesture = UITapGestureRecognizer(target: self, action: #selector(heartSymbolTapped))
         heartSymbol.addGestureRecognizer(heartTapGesture)
         heartSymbol.isUserInteractionEnabled = true
     }
     
     @objc private func houseSymbolTapped() {
         animateSymbolTap(symbol: houseSymbol)
     }
     
     @objc private func musicNoteSymbolTapped() {
         animateSymbolTap(symbol: musicNoteSymbol)
     }
     
     @objc private func heartSymbolTapped() {
         animateSymbolTap(symbol: heartSymbol)
     }
     
     private func animateSymbolTap(symbol: UIImageView) {
         UIView.animate(withDuration: 0.3, animations: {
             symbol.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
             symbol.tintColor = .systemBlue
         }, completion: { _ in
             UIView.animate(withDuration: 0.1) {
                 symbol.transform = .identity
                 symbol.tintColor = .white
             }
         })
     }
     
     private func animateImageShrink() {
         UIView.animate(withDuration: 1, animations: {
             self.imageForKHatia.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
         }) { _ in
             UIView.animate(withDuration: 1) {
                 self.imageForKHatia.transform = .identity
             }
         }
     }
     private func animateCircleProgressBar() {
         print("Circular progress bar added to view")
         circularProgressBar.backgroundColor = UIColor.red.withAlphaComponent(0.5)
         UIView.animate(withDuration: 2.0, delay: 0.1, options: [], animations: {
             self.circularProgressBar.setProgress(0.5, animated: true)
         }) { _ in
             print("Animation completed")
             self.circularProgressBar.removeFromSuperview()
             print("Circular progress bar removed from view")
         }
     }
     
 }


#Preview {
    MainPageVC(viewModel: MainPageViewModel())
}
