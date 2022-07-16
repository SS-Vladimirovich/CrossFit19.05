//
//  NewsWeekTableViewController.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 07.04.2022.
//

import UIKit
import Alamofire

class NewsWeekTableViewController: UITableViewController {

    private var news: [NewsModel] = []
    private let service = NetworkingService()

    private var imageService: PhotoService?

    override func viewDidLoad() {
        super.viewDidLoad()
        imageService = PhotoService(container: tableView)

        //register Header
        tableView.register(UINib(nibName: "NewsPostTableViewCell", bundle: nil), forCellReuseIdentifier: "sectionHeader")

        //register Footer
        tableView.register(UINib(nibName: "FooterPostTableViewCell", bundle: nil), forCellReuseIdentifier: "sectionFooter")

        //register Text
        tableView.register(UINib(nibName: "TextPostTableViewCell", bundle: nil), forCellReuseIdentifier: "sectionText")

        //register Foto
        tableView.register(UINib(nibName: "FotoPostTableViewCell", bundle: nil), forCellReuseIdentifier: "sectionFoto")

        //get
        service.getUrl()
            .get({ url in
                print(url)
            })
            .then(on: DispatchQueue.global(), service.getData(_:))
            .then(service.getParsedData(_:))
            .then(service.getNews(_:))
            .done(on: DispatchQueue.main) { news in
                self.news = news
                self.tableView.reloadData()
            }.catch { error in
                print(error)
            }

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        news.count

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "sectionHeader") as? NewsPostTableViewCell else { return UITableViewCell() }
            let item = news[indexPath.section]
            cell.configure(with: item)

            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "sectionText") as? TextPostTableViewCell else { return UITableViewCell() }
                let item = news[indexPath.section]

                cell.textPost.text = item.text

                return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "sectionPhoto") as? PhotoPostTableViewCell else { return UITableViewCell() }
            let item = news[indexPath.section]
            cell.configure(with: item)

            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "sectionFooter") as? FooterPostTableViewCell else { return UITableViewCell() }
                let item = news[indexPath.section]

                return cell
        default:
            return UITableViewCell()
        }
    }
}

