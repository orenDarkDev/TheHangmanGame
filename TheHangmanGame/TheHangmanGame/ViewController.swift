//
//  ViewController.swift
//  TheHangmanGame
//
//  Created by Oren Pelosof on 15/03/23.
//

import UIKit

class ViewController: UIViewController {
    var numberOfLetters: Int = 1
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .orange
        
        let lettersView = UIView()
        lettersView.translatesAutoresizingMaskIntoConstraints = false
        lettersView.backgroundColor = .lightGray
        lettersView.layer.borderWidth = 1
        lettersView.layer.borderColor = UIColor.black.cgColor
        view.addSubview(lettersView)
        
        let height = 150
        let width = 80
        
        
            var lettersLabel = UILabel()
            lettersLabel.translatesAutoresizingMaskIntoConstraints = false
            lettersLabel.backgroundColor = .white
            lettersLabel.font = UIFont.systemFont(ofSize: 18)
            lettersLabel.textAlignment = .center
            lettersLabel.text = "?"
            lettersView.addSubview(lettersLabel)
            
            
        
        NSLayoutConstraint.activate([
            lettersView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            lettersView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor),
            lettersView.heightAnchor.constraint(equalToConstant: 90),
            lettersView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            lettersLabel.heightAnchor.constraint(equalToConstant: 70),
            lettersLabel.widthAnchor.constraint(equalToConstant: 50),
            lettersLabel.leadingAnchor.constraint(equalTo: lettersView.leadingAnchor, constant: 10),
            lettersLabel.centerYAnchor.constraint(equalTo: lettersView.centerYAnchor)
        
        ])
        
   }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

