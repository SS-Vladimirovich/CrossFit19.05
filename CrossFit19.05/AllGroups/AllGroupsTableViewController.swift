//
//  AllGroupsTableViewController.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 27.03.2022.
//

import UIKit
import RealmSwift

class AllGroupsTableViewController: UITableViewController {

    private var groupsArray: [RealmGroup] = []
    private var realmNotificationGroup: NotificationToken?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GetDB.shared.loadGroups(userId: Session.instance.userId) { group in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    //MARK: - автоматическое обновление информации при изменении данных в Realm через notifications.
    
    private func makeObserverGroup(realm: Realm) {
        let objs = realm.objects(RealmGroup.self)
        realmNotificationGroup = objs.observe({ changes in
            switch changes {
            case let .initial(objs):
                self.groupsArray = Array(objs)
                self.tableView.reloadData()
            case .error(let error): print(error)
            case let .update(groupsArray, deletions, insertions, modifications):

                DispatchQueue.main.sync { [self] in
                    self.groupsArray = Array(groupsArray)

                    let deletionIndexSet = deletions.reduce(into: IndexSet(), { $0.insert($1) })
                    let insertIndexSet = insertions.reduce(into: IndexSet(), { $0.insert($1) })
                    let modificationIndexSet = modifications.reduce(into: IndexSet(), { $0.insert($1) })
                    
                }
                break
            }
        })
    }

    var allGroups: [GroupsName] = [
        GroupsName(nameGroups: "CrossFit-19.05", imageAvatar: "avatarGroup1"),
        GroupsName(nameGroups: "NewAlhogol", imageAvatar: "avatarGroup2"),
        GroupsName(nameGroups: "Любители Пивасика", imageAvatar: "avatarGroup3"),
        GroupsName(nameGroups: "CrossFit-Newada", imageAvatar: "avatarGroup4"),
        GroupsName(nameGroups: "OldAlhogol", imageAvatar: "avatarGroup5"),
        GroupsName(nameGroups: "Любители Coca-Cola", imageAvatar: "avatarGroup6")
    ]
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupCell", for: indexPath) as? AllGroupsTableViewCell {
            let item = allGroups[indexPath.row]

            cell.refresh(item)
            cell.imageAvatar.image = UIImage(named: item.imageAvatar)

            return cell
        }

        return UITableViewCell()
    }
}
