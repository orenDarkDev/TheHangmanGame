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
        
        NSLayoutConstraint.activate([
            lettersView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            lettersView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor),
            lettersView.heightAnchor.constraint(equalToConstant: 90),
            lettersView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        let height = 150
        let width = 80
        
        for  letters in 0..<numberOfLetters {
            var lettersLabel = UILabel()
            lettersLabel.translatesAutoresizingMaskIntoConstraints = false
            lettersLabel.font = UIFont.systemFont(ofSize: 18)
            lettersLabel.textAlignment = .center
            lettersLabel.text = ""
            
            
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

