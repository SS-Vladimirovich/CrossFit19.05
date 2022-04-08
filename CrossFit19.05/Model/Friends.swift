//
//  Friends.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 27.03.2022.
//

import Foundation

//MARK: - Structure

struct Friends {

    var name: String
    var imageAvatar: String
    var photos: [FotoFriends]

}

struct GroupsName {

    var nameGroups: String
    var imageAvatar: String

}

struct FotoFriends {

    var imageFoto: String
    var isLiked: Bool
}
