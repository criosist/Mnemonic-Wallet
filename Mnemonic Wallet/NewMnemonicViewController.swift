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
    
    lazy var titleField: UITextField = {
        let field = NewMnemonicViewController.textFieldFactory(placeholder: "Title", borderColor: .black, borderWidth: 1, cornerRadius: 5, delegate: self)
        return field
    }()
    
    lazy var descriptionField: UITextField = {
        let field = NewMnemonicViewController.textFieldFactory(placeholder: "Description", borderColor: .black, borderWidth: 1, cornerRadius: 5, delegate: self)
        return field
    }()
    
    lazy var mnemonicField: UITextField = {
        let field = NewMnemonicViewController.textFieldFactory(placeholder: "Mnemonic Word", borderColor: .black, borderWidth: 1, cornerRadius: 5, delegate: self)
        return field
    }()
    
    lazy var qrButton: UIButton = {
        let qrButton = UIButton(type: .custom)
        qrButton.translatesAutoresizingMaskIntoConstraints = false
        qrButton.backgroundColor = .purple
        qrButton.addTarget(self, action: #selector(qrButtonPress), for: UIControlEvents.touchUpInside)
        return qrButton
    }()
    
    fileprivate class func textFieldFactory(placeholder: String, borderColor: UIColor, borderWidth: CGFloat, cornerRadius: CGFloat, delegate: UITextFieldDelegate) -> UITextField {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.applyBorder(color: borderColor, width: borderWidth)
        field.applyCornerRadius(radius: cornerRadius)
        field.placeholder = placeholder
        return field
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func showErronousMnemonicAlert() {
        let errorAlert = UIAlertController(title: "Error", message: "The word contains illegal characters. (Allowed characters are a - z)", preferredStyle: .alert)
        errorAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(errorAlert, animated: true, completion: nil)
    }
}

// Mnemonic Methods
extension NewMnemonicViewController {
    
    func validateMnemonicWord(word: String) -> Bool {
        return word.containsOnlyCharacters()
    }
    
    func attempToAddMnemomicWord(word: String?) {
        guard let word = word else {
            return
        }
        
        if validateMnemonicWord(word: word) {
            addNewMnemonic(word: word)
        } else {
            showErronousMnemonicAlert()
        }
    }
    
    func addNewMnemonic(word: String) {
        potentialMnemonic.appendMnemonic(word: word)
        clearTextField(field: mnemonicField)
    }

}

// Navigation Button
extension NewMnemonicViewController {
    
    func doneButtonPressed() {
        
    }
    
    func cancelButtonPressed() {
        
    }
}

// QR Button
extension NewMnemonicViewController {
    
    func qrButtonPress() {
        
    }
    
}

// TextField Delegate
extension NewMnemonicViewController: UITextFieldDelegate {
    
    func clearTextField(field: UITextField) {
        field.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == titleField {
            descriptionField.becomeFirstResponder()
        } else if textField == descriptionField {
            mnemonicField.becomeFirstResponder()
        } else if textField == mnemonicField {
            attempToAddMnemomicWord(word: textField.text)
        }
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Check we are editing the Mnemonic field, else allows any characters.
        if textField != mnemonicField {
            return true
        }
        
        // If the string is an empty space we consider this a return.
        if string == " " {
            attempToAddMnemomicWord(word: textField.text)
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
        
        configureNavigationItem()
        addTitleTextfield()
        addDescriptionTextfield()
        addMnemonicTextfield(hasQRButton: true)
        addQRButton(leftView: mnemonicField, aboveView: descriptionField)
    }
    
    private func configureNavigationItem() {
        navigationItem.title = "New Mnemonic"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonPressed))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelButtonPressed))
    }
    
    private func addQRButton(leftView: UIView, aboveView: UIView) {
        if qrButton.superview == nil {
            view.addSubview(qrButton)
            NSLayoutConstraint.activate(constraintsForQRButton(button: qrButton, leftView: leftView, aboveView: aboveView))
        }
    }
    
    private func addTitleTextfield() {
        if titleField.superview == nil {
            view.addSubview(titleField)
            NSLayoutConstraint.activate(constraintsForTextField(field: titleField, hasQRButton: false, aboveView: nil))
        }
    }
    
    private func addDescriptionTextfield() {
        if descriptionField.superview == nil {
            view.addSubview(descriptionField)
            NSLayoutConstraint.activate(constraintsForTextField(field: descriptionField, hasQRButton: false, aboveView: titleField))
        }
    }
    
    private func addMnemonicTextfield(hasQRButton: Bool) {
        if mnemonicField.superview == nil {
            view.addSubview(mnemonicField)
            NSLayoutConstraint.activate(constraintsForTextField(field: mnemonicField, hasQRButton: true, aboveView: descriptionField))
        }
    }
}

// Custom Constraints
extension NewMnemonicViewController {
    
    func constraintsForTextField(field: UITextField, hasQRButton: Bool, aboveView: UIView?) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        
        var views: [String: Any] = ["field": field, "topLayoutGuide": topLayoutGuide]
        
        var rightViewString = "-10-|"
        var aboveViewString = "[topLayoutGuide]-30-"
        
        if hasQRButton {
            rightViewString = "-50-|"
        }
        
        if let aboveView = aboveView {
            views["aboveView"] = aboveView
            aboveViewString = "[aboveView]-10-"
        }
        
        let horizontalConstraintsVisualFormat = "H:|-\(10)-[field]\(rightViewString)"
        let verticalConstraintsVisualFormat = "V:\(aboveViewString)[field(==30)]"
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintsVisualFormat, options: [], metrics: nil, views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintsVisualFormat, options: [], metrics: nil, views: views)
        
        constraints.append(contentsOf: horizontalConstraints)
        constraints.append(contentsOf: verticalConstraints)
        
        return constraints
    }
    
    func constraintsForQRButton(button: UIButton, leftView: UIView, aboveView: UIView) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        
        let views = ["button": button, "leftView": leftView, "aboveView": aboveView]
        
        let horizontalConstraintsVisualFormat = "H:[leftView]-10-[button]-\(10)-|"
        let verticalConstraintsVisualFormat = "V:[aboveView]-\(10)-[button]"
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintsVisualFormat, options: [], metrics: nil, views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: verticalConstraintsVisualFormat, options: [], metrics: nil, views: views)
        
        constraints.append(contentsOf: horizontalConstraints)
        constraints.append(contentsOf: verticalConstraints)
        
        constraints.append(NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: button, attribute: .height, multiplier: 1, constant: 0))
        
        return constraints
    }
}
