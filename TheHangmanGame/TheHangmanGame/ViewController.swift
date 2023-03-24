//
//  ViewController.swift
//  TheHangmanGame
//
//  Created by Oren Pelosof on 15/03/23.
//

import UIKit

class ViewController: UIViewController {
    var numberOfLetters = 0
    var playButton = UIButton(type: .system)
    let lettersView = UIView()
    let lettersLabel = UILabel()
    let choosingLettersButton = UIButton(type: .system)
    var chosenLetters: [String] = []
    var word = "CANALHA"
    var promptWord = ""
    var score = 0
    var wrongAnswers = 0
    
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .orange
        
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.setTitle("PLAY", for: .normal)
        playButton.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        playButton.tintColor = .white
        playButton.backgroundColor = .systemGreen
        playButton.layer.borderColor = UIColor.white.cgColor
        playButton.layer.borderWidth = 4
        playButton.layer.cornerRadius = 50
        playButton.addTarget(self, action: #selector(play), for: .touchUpInside)
        view.addSubview(playButton)
        
        lettersView.translatesAutoresizingMaskIntoConstraints = false
        lettersView.backgroundColor = .lightGray
        lettersView.layer.borderWidth = 1
        lettersView.layer.borderColor = UIColor.black.cgColor
        view.addSubview(lettersView)
        
        lettersLabel.translatesAutoresizingMaskIntoConstraints = false
        lettersLabel.textAlignment = .center
        lettersLabel.text = "THE HANGMAN GAME!"
        lettersLabel.font = UIFont.systemFont(ofSize: 30)
        lettersLabel.backgroundColor = .black
        lettersLabel.textColor = .systemGreen
        lettersView.addSubview(lettersLabel)
        
        choosingLettersButton.translatesAutoresizingMaskIntoConstraints = false
        choosingLettersButton.setTitle("GUESS A LETTER!", for: .normal)
        choosingLettersButton.addTarget(self, action: #selector(guess), for: .touchUpInside)
        choosingLettersButton.backgroundColor = .white
        choosingLettersButton.tintColor = .black
        choosingLettersButton.layer.cornerRadius = 15
        choosingLettersButton.layer.borderWidth = 2
        choosingLettersButton.layer.borderColor = UIColor.black.cgColor
        view.addSubview(choosingLettersButton)
        
        
        
        NSLayoutConstraint.activate([
            lettersView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            lettersView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor),
            lettersView.heightAnchor.constraint(equalToConstant: 90),
            lettersView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            lettersLabel.heightAnchor.constraint(equalTo: lettersView.heightAnchor, constant: -20),
            lettersLabel.widthAnchor.constraint(equalTo: lettersView.widthAnchor, constant: -20),
            lettersLabel.centerXAnchor.constraint(equalTo: lettersView.centerXAnchor),
            lettersLabel.centerYAnchor.constraint(equalTo: lettersView.centerYAnchor),
            
            choosingLettersButton.topAnchor.constraint(equalTo: lettersView.bottomAnchor, constant: 30),
            choosingLettersButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            choosingLettersButton.widthAnchor.constraint(equalToConstant: 200),
            
            playButton.topAnchor.constraint(equalTo: choosingLettersButton.bottomAnchor, constant: 50),
            playButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 100),
            playButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -100),
            playButton.heightAnchor.constraint(equalToConstant: 120)
            
        ])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.backgroundColor = .cyan
        title = "Score: \(score)"
        
        
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
        if oneLetter(chosenLetter) {
            chosenLetters.append(chosenLetter)
        } else {
            let ac = UIAlertController(title: "X", message: "1 letter only!", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Return", style: .default))
            present(ac, animated: true)
        }
        
        
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
    
    func oneLetter(_ letter: String) -> Bool {
        if letter.count == 1 {
            return true
        } else {
            return false
        }
    }
    
    @objc func play() {
        numberOfLetters = word.count
        for _ in 0..<word.count {
            promptWord += "*"
        }
        lettersLabel.text = promptWord
        promptWord = ""
        }

}


