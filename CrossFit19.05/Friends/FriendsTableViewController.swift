//
//  FriendsTableViewController.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 27.03.2022.
//

import UIKit

//MARK: -  Структура для сортировки

struct GroupFriends {

    let character: Character
    var friends: [Friends]

}

//MARK: - Class

class FriendsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var groupFriends: [GroupFriends] {

        var result = [GroupFriends]()

        for group in friends {
            guard let character = group.name.first else {
                continue
            }

            if let groupIndex = result.firstIndex(where: {$0.character == character}) {
                result[groupIndex].friends.append(group)
            } else {
                let groupFriend = GroupFriends(character: character, friends: [group])
                result.append(groupFriend)
            }
        }
        return result
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return groupFriends.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let groupFriend = groupFriends[section]
        return groupFriend.friends.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let groupFriend = groupFriends[section]
        return String(groupFriend.character)
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath) as? FriendsTableViewCell {
            let groupFriend = groupFriends[indexPath.section]
            let group = groupFriend.friends[indexPath.row]

            cell.friendsNameLabel.text = group.name
            cell.imageAvatar.image = UIImage(named: group.imageAvatar)

            return cell
        }
        return UITableViewCell()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let cell = sender as? FriendsTableViewCell,
            let index = tableView.indexPath(for: cell),
            let photosViewController = segue.destination as? FotoCollectionViewController
        else {
            return
        }
        let groupFriend = groupFriends[index.section]
        let group = groupFriend.friends[index.row]

        var indexFren = -1

        for (index, frend) in friends.enumerated() where frend.name == group.name {
            indexFren = index
        }

        photosViewController.title = group.name
        photosViewController.friendsIndex = indexFren

    }
}
