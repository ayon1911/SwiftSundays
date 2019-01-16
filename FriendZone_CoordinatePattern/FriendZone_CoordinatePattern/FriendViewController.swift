//
//  FriendViewController.swift
//  FriendZone_CoordinatePattern
//
//  Created by krAyon on 15.01.19.
//  Copyright © 2019 DocDevs. All rights reserved.
//

import UIKit

class FriendViewController: UITableViewController, UISearchBarDelegate, Storyboarded {
    var coordinator: MainCoordinator?
    
    var friend: Friend!
    
    var timezones = [TimeZone]()
    var filteredTimeZone = [TimeZone]()
    var selectedTimeZone = 0
    
    var nameEditingCell: TextTableViewCell? {
        let indexPath = IndexPath(row: 0, section: 0)
        return tableView.cellForRow(at: indexPath) as? TextTableViewCell
    }
    
    let searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.searchBarStyle = .minimal
        sb.placeholder = "Look for timezone"
        return sb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let identifiers = TimeZone.knownTimeZoneIdentifiers
        for indentifire in identifiers {
            if let timezone = TimeZone(identifier: indentifire) {
                timezones.append(timezone)
            }
        }
        let now = Date()
        timezones.sort {
            let ourDifference = $0.secondsFromGMT(for: now)
            let otherDifference = $1.secondsFromGMT(for: now)
            if ourDifference == otherDifference {
                return $0.identifier < $1.identifier
            } else {
                return ourDifference < otherDifference
            }
        }
        selectedTimeZone = timezones.index(of: friend.timeZone) ?? 0
        
        navigationItem.titleView = searchBar
        searchBar.delegate = self
        filteredTimeZone = timezones
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        coordinator?.updateFriend(friend: friend)
    }
    
    @IBAction func nameChanged(_ sender: UITextField) {
        friend.name = sender.text ?? ""
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : filteredTimeZone.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Name your friend" : "Select your time zone"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "name", for: indexPath) as? TextTableViewCell else {
                fatalError("Couldn't create tableview cells")
            }
            cell.textField.text = friend.name
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "timezone", for: indexPath)
            let timezone = filteredTimeZone[indexPath.row]
            cell.textLabel?.text = timezone.identifier.replacingOccurrences(of: "_", with: " ")
            cell.detailTextLabel?.text = timezone.secondsFromGMT(for: Date()).timeString()
            
            if indexPath.row == selectedTimeZone {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexPath.section == 0 ? startEditingname() : selectRow(at: indexPath)
    }
    
    func startEditingname() {
        nameEditingCell?.textField.becomeFirstResponder()
    }
    func selectRow(at indexPath: IndexPath) {
        nameEditingCell?.textField.resignFirstResponder()
        
        for cell in tableView.visibleCells {
            cell.accessoryType = .none
        }
        selectedTimeZone = indexPath.row
        friend.timeZone = filteredTimeZone[indexPath.row]
        
        let selected = tableView.cellForRow(at: indexPath)
        selected?.accessoryType = .checkmark
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredTimeZone = timezones
            tableView.reloadData()
            return
        }
        filteredTimeZone = timezones.filter({$0.identifier.lowercased().contains((searchText.lowercased()))})
        tableView.reloadData()
    }
}


