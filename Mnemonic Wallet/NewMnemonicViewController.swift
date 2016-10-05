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
        field.translatesAutoresizingMaskIntoConstraints = false
        field.applyBorder(color: .black, width: 1)
        field.applyCornerRadius(radius: 5)
        field.delegate = self
        return field
    }()
    
    lazy var qrButton: UIButton = {
        let qrButton = UIButton(type: .custom)
        qrButton.translatesAutoresizingMaskIntoConstraints = false
        qrButton.backgroundColor = .purple
        qrButton.addTarget(self, action: #selector(qrButtonPress), for: UIControlEvents.touchUpInside)
        return qrButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
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

// QR Button
extension NewMnemonicViewController {
    
    func qrButtonPress() {
        
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

// UI Setup
extension NewMnemonicViewController {
    
    func setupUI() {
        view.backgroundColor = .white
        
        addQRButton()
        addTextfield()
    }
    
    private func addTextfield() {
        if inputField.superview == nil {
            view.addSubview(inputField)
            NSLayoutConstraint.activate(constraintsForTextField(field: inputField, toQRButton: qrButton))
        }
    }
    
    private func addQRButton() {
        if qrButton.superview == nil {
            view.addSubview(qrButton)
            NSLayoutConstraint.activate(constraintsForQRButton(button: qrButton))
        }
    }
}

// Custom Constraints
extension NewMnemonicViewController {
    
    func constraintsForTextField(field: UITextField, toQRButton: UIButton) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        
        let views = ["field": field, "button": toQRButton]
        
        let horizontalConstraintsVisualFormat = "H:|-\(10)-[field]-\(10)-[button]"
        let verticalConstraintsVisualFormat = "V:|-\(30)-[field(==30)]"
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintsVisualFormat, options: [], metrics: nil, views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintsVisualFormat, options: [], metrics: nil, views: views)
        
        constraints.append(contentsOf: horizontalConstraints)
        constraints.append(contentsOf: verticalConstraints)
        
        return constraints
    }
    
    func constraintsForQRButton(button: UIButton) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        
        let views = ["button": button]
        
        let horizontalConstraintsVisualFormat = "H:[button(40)]-\(10)-|"
        let verticalConstraintsVisualFormat = "V:|-\(25)-[button(==40)]"
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintsVisualFormat, options: [], metrics: nil, views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintsVisualFormat, options: [], metrics: nil, views: views)
        
        constraints.append(contentsOf: horizontalConstraints)
        constraints.append(contentsOf: verticalConstraints)
        
        return constraints
    }
}
