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
}

extension FriendsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as?
            FriendTableViewCell else { return UITableViewCell() }
        
        let friend = friends[indexPath.row]
        
    }
    
    
}

// The tableviewcontroller knows a friend was created and now need to know what to do with it.
extension FriendsTableViewController: AddFriendDelegate {
    
    func friendWasCreated(_ friend: Friend) {
        friends.append(friend)
        tableView.reloadData()
    }
    
    
}
