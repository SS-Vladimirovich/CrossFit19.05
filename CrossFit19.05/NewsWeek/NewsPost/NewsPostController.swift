//
//  NewsPostController.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 28.06.2022.
//

import UIKit

class NewsPostController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var newsPost: [NewsGroup] = [
        NewsGroup(nameGroups: "CrossFit-19.05",
              imageAvatar: "avatarGroup1",
              creatNews: "12.04.2022",
              textNews: "Пикачу́ (яп. ピカチュウ Пикатю:, англ. Pikachu) — существо из серии игр, манги и аниме «Покемон», принадлежащей компаниям Nintendo и Game Freak.",
              fotoNews: "fotoLegasi"),
        NewsGroup(nameGroups: "CrossFit-19.05",
              imageAvatar: "avatarGroup1",
              creatNews: "12.04.2022",
              textNews: "Пикачу́ (яп. ピカチュウ Пикатю:, англ. Pikachu) — существо из серии игр, манги и аниме «Покемон», принадлежащей компаниям Nintendo и Game Freak.",
              fotoNews: "fotoLegasi"),
        NewsGroup(nameGroups: "CrossFit-19.05",
              imageAvatar: "avatarGroup1",
              creatNews: "12.04.2022",
              textNews: "Пикачу́ (яп. ピカチュウ Пикатю:, англ. Pikachu) — существо из серии игр, манги и аниме «Покемон», принадлежащей компаниям Nintendo и Game Freak.",
              fotoNews: "fotoLegasi")
    ]


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return newsPost.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    }
}
