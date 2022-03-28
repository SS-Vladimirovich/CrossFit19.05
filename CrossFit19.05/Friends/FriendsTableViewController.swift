//
//  FriendsTableViewController.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 27.03.2022.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    var itemArray = [FriendsName] ()

    override func viewDidLoad() {
        super.viewDidLoad()

        itemArray.append(FriendsName(fullName: "Sregey Sokolov", imageAvatar: "avatarOne"))
        itemArray.append(FriendsName(fullName: "Stanislav Tekunov", imageAvatar: "avatarTwo"))
        itemArray.append(FriendsName(fullName: "Vladimir Cvetkov", imageAvatar: "avatarTree"))

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath) as? FriendsTableViewCell {

            let item = itemArray[indexPath.row]

            cell.friendsNameLabel.text = item.fullName
            cell.imageAvatar.image = UIImage(named: item.imageAvatar)

            return cell
        }

        return UITableViewCell()

    }
}

