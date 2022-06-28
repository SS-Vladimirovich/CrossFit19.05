//
//  NewsWeekTableViewController.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 07.04.2022.
//

import UIKit
import Alamofire

class NewsWeekTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //register Header
        tableView.register(UINib(nibName: "NewsPostTableViewCell", bundle: nil), forCellReuseIdentifier: "sectionHeader")

        //register Footer
        tableView.register(UINib(nibName: "FooterPostTableViewCell", bundle: nil), forCellReuseIdentifier: "sectionFooter")

        //register Test
        tableView.register(UINib(nibName: "TextPostTableViewCell", bundle: nil), forCellReuseIdentifier: "sectionText")

        //register Foto
        tableView.register(UINib(nibName: "FotoPostTableViewCell", bundle: nil), forCellReuseIdentifier: "sectionFoto")

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        newsGroups.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "sectionHeader") as? NewsPostTableViewCell {
                let item = newsGroups[indexPath.section]

                cell.imagePost.image = UIImage(named: item.imageAvatar)
                cell.namePost.text = item.nameGroups
                cell.createPost.text = item.creatNews

                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "sectionText") as? TextPostTableViewCell {
                let item = newsGroups[indexPath.section]

                cell.textPost.text = item.textNews

                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "sectionFoto") as? FotoPostTableViewCell {
                let item = newsGroups[indexPath.section]

                cell.imageFotoPost.image = UIImage(named: item.fotoNews)

                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "sectionFooter") as? FooterPostTableViewCell {
                let item = newsGroups[indexPath.section]

                cell.likeCount.text = item.likeCount

                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
}

