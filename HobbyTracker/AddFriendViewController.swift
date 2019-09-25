//
//  AddFriendViewController.swift
//  HobbyTracker
//
//  Created by Craig Swanson on 9/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class AddFriendViewController: UIViewController {

    // Outlets go at the top of class before viewdidload
    // Only make outlets for things you intend to affect
    // e.g. don't need outlets for labels we won't change
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var hometownTextField: UITextField!
    @IBOutlet weak var hobby1TextField: UITextField!
    @IBOutlet weak var hobby2TextField: UITextField!
    @IBOutlet weak var hobby3TextField: UITextField!
    
    
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
        
        
    }
    
    
    
}
