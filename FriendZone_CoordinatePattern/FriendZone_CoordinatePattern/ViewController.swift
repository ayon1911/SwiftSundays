//
//  ViewController.swift
//  FriendZone_CoordinatePattern
//
//  Created by krAyon on 15.01.19.
//  Copyright © 2019 DocDevs. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, Storyboarded {
    
    var coordinator: MainCoordinator?
    
    var friends = [Friend]()
    var selectedFriend: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        title = "Friend Zone"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFriend))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let friend = friends[indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = friend.timeZone
        dateFormatter.timeStyle = .short
        
        cell.textLabel?.text = friend.name
        cell.detailTextLabel?.text = dateFormatter.string(from: Date())
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedFriend = indexPath.row
        coordinator?.configureFriend(friend: friends[indexPath.row])
    }
    
    func loadData() {
        let defaults = UserDefaults.standard
        guard let saveData = defaults.data(forKey: "friends") else { return }
        let decoder = JSONDecoder()
        guard let saveFriends = try? decoder.decode([Friend].self, from: saveData) else { return }
        friends = saveFriends
    }
    func saveData() {
        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()
        
        guard let saveData = try? encoder.encode(friends) else {
            fatalError("Could not save data")
        }
        defaults.set(saveData, forKey: "friends")
    }
    
    @objc func addFriend() {
        let friend = Friend()
        friends.append(friend)
        tableView.insertRows(at: [IndexPath(row: friends.count - 1, section: 0)], with: .automatic)
        saveData()
        selectedFriend = friends.count - 1
        coordinator?.configureFriend(friend: friend)
    }
    
    func updateFriend(friend: Friend) {
        guard let selectedFriend = selectedFriend else { return }
        friends[selectedFriend] = friend
        tableView.reloadData()
        saveData()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            friends.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
            saveData()
            tableView.reloadData()
        }
    }
}

