//
//  FotoCollectionViewController.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 28.03.2022.
//

import UIKit

class FotoCollectionViewController: UICollectionViewController {

    var itemArray = [FotoFriends] ()

    override func viewDidLoad() {
        super.viewDidLoad()

        itemArray.append(FotoFriends(imageFoto: "fotoOne"))
        itemArray.append(FotoFriends(imageFoto: "fotoTwo"))
        itemArray.append(FotoFriends(imageFoto: "fotoTree"))
        itemArray.append(FotoFriends(imageFoto: "fotoFour"))
        itemArray.append(FotoFriends(imageFoto: "fotoLegasi"))
        itemArray.append(FotoFriends(imageFoto: "fotoSix"))

    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1

    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6

    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fotoCell", for: indexPath) as? FotoCollectionViewCell
        cell?.fotoFriends.image = UIImage(named: "fotoLegasi")

        return cell ?? UICollectionViewCell()
    }
}
