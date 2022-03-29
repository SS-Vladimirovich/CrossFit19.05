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

    var myGroups = [GroupsName]()

    override func viewDidLoad() {
        super.viewDidLoad()

}


// MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups.count
}

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupCell", for: indexPath) as? AllGroupsTableViewCell {
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





















//
//    var itemArray = [GroupsName] ()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        itemArray.append(GroupsName(nameGroups: "CrossFit-19.05", imageAvatar: "avatarGroup1"))
//        itemArray.append(GroupsName(nameGroups: "NewAlhogol", imageAvatar: "avatarGroup2"))
//        itemArray.append(GroupsName(nameGroups: "Любители Пивасика", imageAvatar: "avatarGroup3"))
//
//    }
//
//    // MARK: - Table view data source
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return itemArray.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "groupsCell", for: indexPath) as? GroupsTableViewCell {
//
//            let item = itemArray[indexPath.row]
//
//            cell.refresh(item)
//            cell.imageAvatar.image = UIImage(named: item.imageAvatar)
//
//            return cell
//        }
//
//        return UITableViewCell()
//    }
//
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//    if editingStyle == .delete {
//        itemArray.remove(at: indexPath.row)
//    tableView.deleteRows(at: [indexPath], with: .fade) }
//    }
//}
