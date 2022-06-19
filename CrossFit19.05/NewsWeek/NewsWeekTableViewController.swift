//
//  NewsWeekTableViewController.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 07.04.2022.
//

import UIKit

class NewsWeekTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return newsGroups.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NewsGroups", for: indexPath) as? NewsWeekTableViewCell {
            let item = newsGroups[indexPath.row]

            cell.imageAvatarGroup.image = UIImage(named: item.imageAvatar)
            cell.nameGroup.text = item.nameGroups
            cell.createNews.text = item.creatNews
            cell.textNews.text = item.textNews
            cell.fotoNews.image = UIImage(named: item.fotoNews)

            return cell
        }

        return UITableViewCell()
    }
}
