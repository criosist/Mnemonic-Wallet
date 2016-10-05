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
        addTextfield()
    }
    
    private func addTextfield() {
        if inputField.superview == nil {
            view.addSubview(inputField)
            NSLayoutConstraint.activate(constraintsForTextField(field: inputField))
        }
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // If the string is an empty space we consider this a return.
        if string == " " {
            addButtonPressed(word: textField.text)
            return false
        }
        
        // Check the string contains valid characters, or the use has attempted to paste an invalid string.
        if !string.containsOnlyCharacters() || string.containsSpaces() {
            return false
        }
        
        return true
    }
}

// Custom Constraints
extension NewMnemonicViewController {
    
    func constraintsForTextField(field: UITextField) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        
        let views = ["field": field]
        
        let horizontalConstraintsVisualFormat = "H:|-\(10)-[field]-\(10)-|"
        let verticalConstraintsVisualFormat = "V:|-\(30)-[field(==30)]"
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintsVisualFormat, options: [], metrics: nil, views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintsVisualFormat, options: [], metrics: nil, views: views)
        
        constraints.append(contentsOf: horizontalConstraints)
        constraints.append(contentsOf: verticalConstraints)
        
        return constraints

    }
    
}
