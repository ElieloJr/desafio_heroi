//
//  DetailViewController.swift
//  Hero
//
//  Created by Usr_Prime on 20/04/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    let lightgrey = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
    let moreLightgrey = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
    let darkGrey = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.00)
    
    lazy var characterImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = lightgrey
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var fullNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Full Name:"
        label.font = label.font.withSize(view.frame.width/24)
        label.textColor = moreLightgrey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var toFullNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "..."
        label.font = label.font.withSize(view.frame.width/18)
        label.textColor = .white
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var characterLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Character Name:"
        label.font = label.font.withSize(view.frame.width/24)
        label.textColor = moreLightgrey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var detailsScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.addSubview(characterImageView)
        scrollView.addSubview(fullNameLabel)
        scrollView.addSubview(toFullNameLabel)
        scrollView.addSubview(characterLabel)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let characterImageViewConstraints = [
            characterImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -(view.frame.width/15)),
            characterImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: view.frame.width/25),
            characterImageView.widthAnchor.constraint(equalToConstant: view.frame.width/2.4),
            characterImageView.heightAnchor.constraint(equalToConstant: view.frame.width/1.6)
        ]
        let fullNameLabelConstraints = [
            fullNameLabel.topAnchor.constraint(equalTo: characterImageView.topAnchor),
            fullNameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: view.frame.width/25)
        ]
        let toFullNameLabelConstraints = [
            toFullNameLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor),
            toFullNameLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            toFullNameLabel.widthAnchor.constraint(equalToConstant: view.frame.width/2.2)
        ]
        let characterLabelConstraints = [
            characterLabel.topAnchor.constraint(equalTo: toFullNameLabel.bottomAnchor),
            characterLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor)
        ]
        
        NSLayoutConstraint.activate(characterImageViewConstraints)
        NSLayoutConstraint.activate(fullNameLabelConstraints)
        NSLayoutConstraint.activate(toFullNameLabelConstraints)
        NSLayoutConstraint.activate(characterLabelConstraints)
        
        return scrollView
    }()
    lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .white
        button.setTitle(" Add to Favorites", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(20)
        button.backgroundColor = lightgrey
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addToFavoritesButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = darkGrey
        
        setupView()
        setupConstraints()
    }
    private func setupView() {
        view.addSubview(detailsScrollView)
        view.addSubview(favoriteButton)
    }
    private func setupConstraints() {
        let detailsScrollViewConstraints = [
            detailsScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            detailsScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailsScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailsScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        let favoriteButtonConstraints = [
            favoriteButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(self.view.frame.width/10)),
            favoriteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: self.view.frame.width/5),
            favoriteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(self.view.frame.width/5)),
            favoriteButton.heightAnchor.constraint(equalToConstant:  self.view.frame.width/7.5)
        ]
        
        NSLayoutConstraint.activate(detailsScrollViewConstraints)
        NSLayoutConstraint.activate(favoriteButtonConstraints)
    }
    @objc func addToFavoritesButton() {
        favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    }
}
