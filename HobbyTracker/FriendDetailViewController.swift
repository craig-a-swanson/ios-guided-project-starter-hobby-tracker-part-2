//
//  FriendDetailViewController.swift
//  HobbyTracker
//
//  Created by Craig Swanson on 9/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hometownLabel: UILabel!
    @IBOutlet weak var hobbyListTextView: UITextView!
    
    // Friend has to be optional right now because we don't know what the value is.
    var friend: Friend?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    private func updateViews() {
        guard let friend = friend else { return }
        
        nameLabel.text = friend.name
        hometownLabel.text = friend.hometown
        var hobbyText = ""
        for hobby in friend.hobbies {
            hobbyText += "• \(hobby)\n"
        }
        hobbyListTextView.text = hobbyText
    }

 
}
