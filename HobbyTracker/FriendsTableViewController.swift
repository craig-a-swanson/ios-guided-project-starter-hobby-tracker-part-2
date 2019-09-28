//
//  FriendsTableViewController.swift
//  HobbyTracker
//
//  Created by Ben Gohlke on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class FriendsTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var friends: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // This is called Dependency Injection
    // At the time the plus button is tapped and the segue runs, the segue tells the Add Friend VC that
    // If you have something to give to the table VC, give it to me and we'll take care of it.
    // This table VC is acting as the delegate.  We comform to the protocol. "Self" refers to this class.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddFriendModalSegue" {
            if let addFriendVC = segue.destination as? AddFriendViewController {
                addFriendVC.delegate = self
            }
        } else if segue.identifier == "ShowFriendDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow,
                let friendDetailVC = segue.destination as? FriendDetailViewController {
                friendDetailVC.friend = friends[indexPath.row]
            }
        }
    }
}

extension FriendsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as?
            FriendTableViewCell else { return UITableViewCell() }
        
        let friend = friends[indexPath.row]
        cell.friend = friend
        
        return cell
    }
}

// The tableviewcontroller knows a friend was created and now need to know what to do with it.
extension FriendsTableViewController: AddFriendDelegate {
    
    func friendWasCreated(_ friend: Friend) {
        friends.append(friend)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    
    
}
