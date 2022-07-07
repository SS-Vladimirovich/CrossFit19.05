//
//  FotoCollectionViewController.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 28.03.2022.
//

import UIKit
import RealmSwift

class FotoCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()

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
