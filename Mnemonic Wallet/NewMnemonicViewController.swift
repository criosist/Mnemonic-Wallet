//
//  NewMnemonicViewController.swift
//  Mnemonic Wallet
//
//  Created by Sean Lintern on 03/10/2016.
//  Copyright © 2016 Sean Lintern. All rights reserved.
//

import UIKit

class NewMnemonicViewController: UIViewController {
    
    var potentialMnemonic = PotentialMnemonic()
    
    lazy var inputField: UITextField = {
        let field = UITextField()
        field.delegate = self
        return field
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        
    }
    
    func validateMnemonicWord(word: String) -> Bool {
        return false
    }
    
    func addButtonPressed(word: String?) {
        guard let word = word else {
            return
        }
        
        attempToAddMnemomicWord(word: word)
    }
    
    func attempToAddMnemomicWord(word: String) {
        if validateMnemonicWord(word: word) {
            addNewMnemonic(word: word)
        } else {
            showErronousMnemonicAlert()
        }
    }
    
    func addNewMnemonic(word: String) {
        potentialMnemonic.appendMnemonic(word: word)
        clearTextField()
    }
    
    func clearTextField() {
        inputField.text = ""
    }
    
    func showErronousMnemonicAlert() {
        let errorAlert = UIAlertController(title: "Error", message: "The word contains illegal characters. (Allowed characters are a - z)", preferredStyle: .alert)
        errorAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(errorAlert, animated: true, completion: nil)
    }
}

// TextField Delegate
extension NewMnemonicViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addButtonPressed(word: textField.text)
        return false
    }
    
}
