//
//  ViewController.swift
//  TheHangmanGame
//
//  Created by Oren Pelosof on 15/03/23.
//

import UIKit

class ViewController: UIViewController {
    let lettersView = UIView()
    let lettersLabel = UILabel()
    let choosingLettersButton = UIButton(type: .system)
    var numberOfLetters = 0
    var chosenLetters: [String] = []
    var word = "CANALHA"
    var promptWord = ""
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .orange
        
        
        lettersView.translatesAutoresizingMaskIntoConstraints = false
        lettersView.backgroundColor = .lightGray
        lettersView.layer.borderWidth = 1
        lettersView.layer.borderColor = UIColor.black.cgColor
        view.addSubview(lettersView)
        
        lettersLabel.translatesAutoresizingMaskIntoConstraints = false
        lettersLabel.backgroundColor = .white
        lettersLabel.font = UIFont.systemFont(ofSize: 50)
        lettersLabel.textAlignment = .center
        lettersLabel.text = "\(word)"
        lettersView.addSubview(lettersLabel)
        
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
        
        play()
        // Do any additional setup after loading the view.
    }
    
    @objc func guess(_ sender: UIButton) {
        let ac = UIAlertController(title: "GUESS A LETTER!", message: nil, preferredStyle: .alert)
        ac.addTextField()
        let submitAction = UIAlertAction(title: "Submit", style: .default) {
            [weak self, weak ac] _ in
            guard let chosenLetter = ac?.textFields?[0].text?.uppercased() else { return }
            self?.submit(chosenLetter)
        }
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ chosenLetter: String ) {
        chosenLetters.append(chosenLetter)
        
        for letter in word {
            let stringLetter = String(letter)
            if chosenLetters.contains(stringLetter) {
                promptWord += stringLetter
            } else {
                promptWord += "*"
            }
         }
        lettersLabel.text? = promptWord.uppercased()
        promptWord = ""
    }
    
    func play() {
        lettersLabel.font = UIFont.systemFont(ofSize: 30)
        lettersLabel.text = "THE HANGMAN GAME!"
        lettersLabel.backgroundColor = .black
        lettersLabel.textColor = .systemGreen
    }
    
}


