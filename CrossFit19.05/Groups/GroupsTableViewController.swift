//
//  GroupsTableViewController.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 27.03.2022.
//

import UIKit

class GroupsTableViewController: UITableViewController {

    //Поиск
    @IBOutlet weak var searchBar: UISearchBar!

    var filterList: [GroupsName] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        filterList = myGroups

        self.searchBar.delegate = self
    }

    //Добавление групп
    @IBAction func addGroup(segue: UIStoryboardSegue) {

        if segue.identifier == "addGroup" {
            let allGroupsController = segue.source as! AllGroupsTableViewController
           if let indexPath = allGroupsController.tableView.indexPathForSelectedRow {
               let group = allGroupsController.allGroups[indexPath.row]
               filterList.append(group)
               tableView.reloadData()
           }
       }
   }

// MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupCell", for: indexPath) as? GroupsTableViewCell {
            let item = filterList[indexPath.row]

            cell.refresh(item)
            cell.imageAvatar.image = UIImage(named: item.imageAvatar)

            return cell
        }

        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            filterList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

//MARK: - Extension

extension GroupsTableViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        filterList = []
        
        if searchText == "" {
            filterList = myGroups
        }

        for grup in myGroups {
            if grup.nameGroups.uppercased().contains(searchText.uppercased()) {
                filterList.append(grup)
            }
        }
        self.tableView.reloadData()
    }
}
