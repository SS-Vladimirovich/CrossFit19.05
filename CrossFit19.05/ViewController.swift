//
//  ViewController.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 22.03.2022.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    var userArray: [RealmUser] = []
    private var realmNotificationUser: NotificationToken?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GetDB.shared.loadUser(userId: Session.instance.userId) { users in
            DispatchQueue.main.async {
            }
        }
    }

    //MARK: - автоматическое обновление информации при изменении данных в Realm через notifications.

    private func makeObserverGroup(realm: Realm) {
        let objs = realm.objects(RealmUser.self)
        realmNotificationUser = objs.observe({ changes in
            switch changes {
            case let .initial(objs):
                self.userArray = Array(objs)
            case .error(let error): print(error)
            case let .update(groupsArray, deletions, insertions, modifications):

                DispatchQueue.main.sync { [self] in
                    self.userArray = Array(groupsArray)

                    let deletionIndexSet = deletions.reduce(into: IndexSet(), { $0.insert($1) })
                    let insertIndexSet = insertions.reduce(into: IndexSet(), { $0.insert($1) })
                    let modificationIndexSet = modifications.reduce(into: IndexSet(), { $0.insert($1) })

                }
                break
            }
        })
    }

    //MARK: - Отображение на экране
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBAction func logIn(_ sender: Any) {
    }



    @objc func keyboardWasShown(notification: Notification) {

        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)

        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets }

    @objc func keyboardWillBeHidden(notification: Notification) {
    }
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)

        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) { super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func hideKeyboard() { self.scrollView?.endEditing(true)
    }
}


