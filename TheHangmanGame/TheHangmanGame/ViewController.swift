//
//  ViewController.swift
//  TheHangmanGame
//
//  Created by Oren Pelosof on 15/03/23.
//

import UIKit

class ViewController: UIViewController {
    var numberOfLetters = 0
    var chosenLetters: [String] = []
    var word = ""
  
    override func loadView() {
        view = UIView()
        view.backgroundColor = .orange
        
        let lettersView = UIView()
        lettersView.translatesAutoresizingMaskIntoConstraints = false
        lettersView.backgroundColor = .lightGray
        lettersView.layer.borderWidth = 1
        lettersView.layer.borderColor = UIColor.black.cgColor
        view.addSubview(lettersView)
        
     
        var lettersLabel = UILabel()
            lettersLabel.translatesAutoresizingMaskIntoConstraints = false
            lettersLabel.backgroundColor = .white
            lettersLabel.font = UIFont.systemFont(ofSize: 50)
            lettersLabel.textAlignment = .center
            lettersLabel.text = "\(word)"
            lettersView.addSubview(lettersLabel)
        
        let choosingLettersButton = UIButton()
        choosingLettersButton.translatesAutoresizingMaskIntoConstraints = false
        choosingLettersButton.setTitle("GUESS A LETTER!", for: .normal)
        choosingLettersButton.addTarget(self, action: #selector(guess), for: .touchUpInside)
        choosingLettersButton.backgroundColor = .darkGray
        view.addSubview(choosingLettersButton)
        
            
        
        NSLayoutConstraint.activate([
            lettersView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            lettersView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor),
            lettersView.heightAnchor.constraint(equalToConstant: 90),
            lettersView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            lettersLabel.heightAnchor.constraint(equalTo: lettersView.heightAnchor, constant: -20),
            lettersLabel.widthAnchor.constraint(equalTo: lettersView.widthAnchor, constant: -20),
            lettersLabel.centerXAnchor.constraint(equalTo: lettersView.centerXAnchor),
            lettersLabel.centerYAnchor.constraint(equalTo: lettersView.centerYAnchor),
            
            choosingLettersButton.topAnchor.constraint(equalTo: lettersView.bottomAnchor, constant: 30),
            choosingLettersButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            choosingLettersButton.widthAnchor.constraint(equalToConstant: 200)
        
        ])
        
   }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func guess() {
        let ac = UIAlertController(title: "GUESS!", message: nil, preferredStyle: .alert)
        ac.addTextField()
        let aa = UIAlertAction(title: "Submit", style: .default) {
            [weak self, weak ac] _ in
            
        }
    }
    
    func play() {
        word = "Jabuticaba"
        
        
    }


}


