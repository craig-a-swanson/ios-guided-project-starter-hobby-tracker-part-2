//
//  AddFriendViewController.swift
//  HobbyTracker
//
//  Created by Craig Swanson on 9/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol AddFriendDelegate {
    func friendWasCreated(_ friend: Friend)
}

class AddFriendViewController: UIViewController {

    // Outlets go at the top of class before viewdidload
    // Only make outlets for things you intend to affect
    // e.g. don't need outlets for labels we won't change
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var hometownTextField: UITextField!
    @IBOutlet weak var hobby1TextField: UITextField!
    @IBOutlet weak var hobby2TextField: UITextField!
    @IBOutlet weak var hobby3TextField: UITextField!
    
    var delegate: AddFriendDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    // Methods go after viewdidload()
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let name = nameTextField.text,
            let hometown = hometownTextField.text,
            !name.isEmpty,
            !hometown.isEmpty else { return }
        
        var friend = Friend(name: name, hometown: hometown, hobbies: [])
        
        if let hobby1 = hobby1TextField.text,
            !hobby1.isEmpty {
            friend.hobbies.append(hobby1)
        }
        
        if let hobby2 = hobby1TextField.text,
            !hobby2.isEmpty {
            friend.hobbies.append(hobby2)
        }
        
        if let hobby3 = hobby1TextField.text,
            !hobby3.isEmpty {
            friend.hobbies.append(hobby3)
        }
        
        // if there's no delegate, this won't run and the app won't crash.
        // if there is a delegate, it will pass the friend.
        delegate?.friendWasCreated(friend)
    }
}

// Using an extension to visually separate this code.
extension AddFriendViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text,
            !text.isEmpty {
            switch textField {
            case nameTextField:
                hometownTextField.becomeFirstResponder()
            case hometownTextField:
                hobby1TextField.becomeFirstResponder()
            case hobby1TextField:
                hobby2TextField.becomeFirstResponder()
            case hobby2TextField:
                hobby3TextField.becomeFirstResponder()
            default:
                textField.resignFirstResponder()
            }
        }
        
        return false
    }
}
