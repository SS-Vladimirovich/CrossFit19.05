//
//  FotoCollectionViewController.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 28.03.2022.
//

import UIKit

class FotoCollectionViewController: UICollectionViewController {

    var friendsIndex: Int = 0

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friends[friendsIndex].photos.count

    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fotoCell", for: indexPath) as? FotoCollectionViewCell
        let photo = friends[friendsIndex.row].photos[indexPath.row]
        
        cell?.imageView.image = UIImage(named: photo.imageFoto)

        return cell ?? UICollectionViewCell()
    }
}
