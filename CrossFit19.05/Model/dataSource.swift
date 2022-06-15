//
//  dataSource.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 01.04.2022.
//

import Foundation

//MARK: - Friends

var friends: [Friends] = [
    Friends(name: "Белоусов Александр",
            imageAvatar: "avatarOne",
            photos: [FotoFriends(imageFoto: "fotoFour", isLiked: false),
                     FotoFriends(imageFoto: "fotoLegasi", isLiked: false),
                     FotoFriends(imageFoto: "fotoSix", isLiked: false),
                     FotoFriends(imageFoto: "fotoOne", isLiked: false),
                     FotoFriends(imageFoto: "fotoTwo", isLiked: false),
                     FotoFriends(imageFoto: "fotoTree", isLiked: false)]),
    Friends(name: "Текунов Станислав",
            imageAvatar: "avatarTwo",
            photos: [FotoFriends(imageFoto: "fotoFour", isLiked: false),
                     FotoFriends(imageFoto: "fotoLegasi", isLiked: false),
                     FotoFriends(imageFoto: "fotoSix", isLiked: false),
                     FotoFriends(imageFoto: "fotoOne", isLiked: false),
                     FotoFriends(imageFoto: "fotoTwo", isLiked: false),
                     FotoFriends(imageFoto: "fotoTree", isLiked: false)]),
    Friends(name: "Соколов Сергей",
            imageAvatar: "avatarTree",
            photos: [FotoFriends(imageFoto: "fotoTree", isLiked: false),
                     FotoFriends(imageFoto: "fotoTwo", isLiked: false),
                     FotoFriends(imageFoto: "fotoLegasi", isLiked: false)]),
    Friends(name: "Журихин Александр",
            imageAvatar: "avatarGroup1",
            photos: [FotoFriends(imageFoto: "fotoOne", isLiked: false),
                     FotoFriends(imageFoto: "fotoTwo", isLiked: false),
                     FotoFriends(imageFoto: "fotoTree", isLiked: false)]),
    Friends(name: "Васин Алексей",
            imageAvatar: "avatarGroup2",
            photos: [FotoFriends(imageFoto: "fotoFour", isLiked: false),
                     FotoFriends(imageFoto: "fotoLegasi", isLiked: false),
                     FotoFriends(imageFoto: "fotoSix", isLiked: false)]),
    Friends(name: "Комолов Владимир",
            imageAvatar: "avatarGroup3",
            photos: [FotoFriends(imageFoto: "fotoTree", isLiked: false),
                     FotoFriends(imageFoto: "fotoTwo", isLiked: false),
                     FotoFriends(imageFoto: "fotoLegasi", isLiked: false)]),
    Friends(name: "Критсарзов Сергей",
            imageAvatar: "avatarGroup4",
            photos: [FotoFriends(imageFoto: "fotoOne", isLiked: false),
                     FotoFriends(imageFoto: "fotoTwo", isLiked: false),
                     FotoFriends(imageFoto: "fotoTree", isLiked: false)]),
    Friends(name: "Лестунов Алексей",
            imageAvatar: "avatarGroup5",
            photos: [FotoFriends(imageFoto: "fotoFour", isLiked: false),
                     FotoFriends(imageFoto: "fotoLegasi", isLiked: false),
                     FotoFriends(imageFoto: "fotoSix", isLiked: false)]),
]

//MARK: - Groups

var myGroups: [GroupsName] = [
    GroupsName(nameGroups: "CrossFit-19.05", imageAvatar: "avatarGroup1"),
    GroupsName(nameGroups: "NewAlhogol", imageAvatar: "avatarGroup2"),
    GroupsName(nameGroups: "Любители Пивасика", imageAvatar: "avatarGroup3"),
]

var allGroups: [GroupsName] = [
    GroupsName(nameGroups: "CrossFit-19.05", imageAvatar: "avatarGroup1"),
    GroupsName(nameGroups: "NewAlhogol", imageAvatar: "avatarGroup2"),
    GroupsName(nameGroups: "Любители Пивасика", imageAvatar: "avatarGroup3"),
    GroupsName(nameGroups: "CrossFit-Newada", imageAvatar: "avatarGroup4"),
    GroupsName(nameGroups: "OldAlhogol", imageAvatar: "avatarGroup5"),
    GroupsName(nameGroups: "Любители Coca-Cola", imageAvatar: "avatarGroup6")
]

var newsGroups: [NewsGroup] = [
NewsGroup(nameGroups: "CrossFit-19.05",
          imageAvatar: "avatarGroup1",
          creatNews: "12.04.2022",
          textNews: "Пикачу́ (яп. ピカチュウ Пикатю:, англ. Pikachu) — существо из серии игр, манги и аниме «Покемон», принадлежащей компаниям Nintendo и Game Freak.",
          fotoNews: "fotoLegasi")]

var newsPost: [PostNews] = [
    PostNews (imagePost: "fotoOne",
              namePost: "BagsBany",
              createPost: "15.06.2022",
              textPost: "Пикачу́ (яп. ピカチュウ Пикатю:, англ. Pikachu) — существо из серии игр, манги и аниме «Покемон», принадлежащей компаниям Nintendo и Game Freak.",
              fotoPost: "fotoOne",
              likeCountPost: 333,
              comentsCountPost: 333,
              forwardCountPost: 333,
              viewCountPost: 333)]
