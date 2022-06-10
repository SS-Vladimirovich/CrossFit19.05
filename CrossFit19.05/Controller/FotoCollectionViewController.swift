//
//  FotoCollectionViewController.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 28.03.2022.
//

import UIKit
import RealmSwift

class FotoCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private var photoArray: [RealmPhoto] = []
    private var realmNotificationFoto: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        GetDB.shared.loadPhotos(userId: Session.instance.userId) { photos in
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    //MARK: - автоматическое обновление информации при изменении данных в Realm через notifications.

    private func makeObserverPhoto(realm: Realm) {
            let objs = realm.objects(RealmPhoto.self)
            realmNotificationFoto = objs.observe({ changes in
                switch changes {
                case let .initial(objs):
                    self.photoArray = Array(objs)
                    self.collectionView.reloadData()
                case .error(let error): print(error)
                case let .update(photoArray, deletions, insertions, modifications):

                    DispatchQueue.main.sync { [self] in
                        self.photoArray = Array(photoArray)

                        let deletionIndexSet = deletions.reduce(into: IndexSet(), { $0.insert($1) })
                        let insertIndexSet = insertions.reduce(into: IndexSet(), { $0.insert($1) })
                        let modificationIndexSet = modifications.reduce(into: IndexSet(), { $0.insert($1) })

                    }
                    break
                }
            })
        }

    //MARK: - Отображение на экране

    var friendsIndex: Int = 0

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friends[friendsIndex].photos.count

    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fotoCell", for: indexPath) as? FotoCollectionViewCell
        let photo = friends[friendsIndex].photos[indexPath.row]
        
        cell?.fotoFriends.image = UIImage(named: photo.imageFoto)
        cell?.likeControl.isSelected = photo.isLiked

        cell?.likePhoto = { isSelected in
            friends[self.friendsIndex].photos[indexPath.row].isLiked = isSelected
        }

        return cell ?? UICollectionViewCell()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let slideVC = segue.destination as? SlideShowViewController {
            slideVC.photos = friends[friendsIndex].photos
        }
    }
}
