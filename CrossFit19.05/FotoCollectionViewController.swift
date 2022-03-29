//
//  FotoCollectionViewController.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 28.03.2022.
//

import UIKit

class FotoCollectionViewController: UICollectionViewController {

    var friendsPhotos: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendsPhotos.count

    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fotoCell", for: indexPath) as? FotoCollectionViewCell
        let friendPhoto = friendsPhotos[indexPath.item]
        cell?.fotoFriends.image = UIImage(named: friendPhoto)

        return cell ?? UICollectionViewCell()
    }
}
