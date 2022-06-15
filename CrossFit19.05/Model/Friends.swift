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

struct NewsGroup {

    var nameGroups: String
    var imageAvatar: String
    var creatNews: String
    var textNews: String
    var fotoNews: String

}

struct PostNews {

    var imagePost: String
    var namePost: String
    var createPost: String
    var textPost: String
    var fotoPost: String
    var likeCountPost: Int
    var comentsCountPost: Int
    var forwardCountPost: Int
    var viewCountPost: Int

}
