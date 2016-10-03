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
        return true
    }
    
    func addButtonPressed(word: String?) {
        guard let word = word else {
            return
        }
        
        attempToAddMnemomicWord(word: word)
    }
    
    func attempToAddMnemomicWord(word: String) {
        if validateMnemonicWord(word: word) {
            potentialMnemonic.appendMnemonic(word: word)
        } else {
            showErronousMnemonicAlert()
        }
    }
    
    func showErronousMnemonicAlert() {
        
    }
}

// TextField Delegate
extension NewMnemonicViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addButtonPressed(word: textField.text)
        return false
    }
    
}
