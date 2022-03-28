//
//  AllGroupsTableViewController.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 27.03.2022.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {

    var itemArray = [GroupsName] ()

    override func viewDidLoad() {
        super.viewDidLoad()

        itemArray.append(GroupsName(nameGroups: "CrossFit-Newada", imageAvatar: "avatarGroup4"))
        itemArray.append(GroupsName(nameGroups: "OldAlhogol", imageAvatar: "avatarGroup5"))
        itemArray.append(GroupsName(nameGroups: "Любители Coca-Cola", imageAvatar: "avatarGroup6"))
        
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "allGroups", for: indexPath) as? AllGroupsTableViewCell {

            let item = itemArray[indexPath.row]

            cell.refresh(item)
            cell.imageAvatar.image = UIImage(named: item.imageAvatar)

            return cell
        }

        return UITableViewCell()
    }

}
