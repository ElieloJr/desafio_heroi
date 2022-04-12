//
//  HomeViewController.swift
//  Hero
//
//  Created by Usr_Prime on 11/04/22.
//

import UIKit

class HomeViewController: UIViewController {

    let lightgrey = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
    let darkGrey = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.00)
    let moreLightgrey = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = darkGrey
        
        setNavigationItem()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    func setNavigationItem() {
        let leftButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 60))
        leftButton.setImage(UIImage(systemName: "person.fill"), for: .normal)
        leftButton.tintColor = .white
        leftButton.backgroundColor = lightgrey
        leftButton.contentVerticalAlignment = .fill
        leftButton.contentHorizontalAlignment = .fill
        leftButton.layer.cornerRadius = 10
        leftButton.addTarget(self, action: #selector(exitButton), for: .touchUpInside)
        
        let rightButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 45, height: 40))
        rightButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        rightButton.tintColor = .white
        rightButton.contentVerticalAlignment = .fill
        rightButton.contentHorizontalAlignment = .fill
        rightButton.addTarget(self, action: #selector(searchButton), for: .touchUpInside)
        
        let leftItem = UIBarButtonItem(customView: leftButton)
        let rightItem = UIBarButtonItem(customView: rightButton)
        self.navigationItem.leftBarButtonItem = leftItem
        self.navigationItem.rightBarButtonItem = rightItem
        
        self.navigationItem.title = "My Hero"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: self.view.frame.height/30)!
        ]
    }
    
    @objc func exitButton() {
        // print("Saiu")
        dismiss(animated: true, completion: nil)
    }
    @objc func searchButton() {
        print("Busca")
    }
}
