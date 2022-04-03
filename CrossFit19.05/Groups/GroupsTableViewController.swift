//
//  GroupsTableViewController.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 27.03.2022.
//

import UIKit

class GroupsTableViewController: UITableViewController {

    @IBAction func addGroup(segue: UIStoryboardSegue) {

         if segue.identifier == "addGroup" {
             let allGroupsController = segue.source as! AllGroupsTableViewController
            if let indexPath = allGroupsController.tableView.indexPathForSelectedRow {
                let group = allGroupsController.allGroups[indexPath.row]
                myGroups.append(group)
                tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

}


// MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups.count
}

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupCell", for: indexPath) as? GroupsTableViewCell {
            let item = myGroups[indexPath.row]

            cell.refresh(item)
            cell.imageAvatar.image = UIImage(named: item.imageAvatar)

            return cell
        }

        return UITableViewCell()
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
