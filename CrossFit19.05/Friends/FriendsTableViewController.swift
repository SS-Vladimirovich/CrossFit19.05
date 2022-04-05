//
//  FriendsTableViewController.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 27.03.2022.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath) as? FriendsTableViewCell {
            let item = friends[indexPath.row]

            cell.friendsNameLabel.text = item.name
            cell.imageAvatar.image = UIImage(named: item.imageAvatar)

            return cell
        }
        return UITableViewCell()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? FriendsTableViewCell,
              let index = tableView.indexPath(for: cell)?.row,
              let photosVC = segue.destination as? FotoCollectionViewController else {
            return
        }

        let friend = friends[index]
        photosVC.friendsPhotos = friend.photos
    }
}
