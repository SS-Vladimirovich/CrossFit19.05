//
//  RealmDB.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 27.05.2022.
//

import Foundation
import RealmSwift

class RealmDB {

    private init() {}

    static let shared = RealmDB()

    //MARK: - Save BD
    func makeObserver<T>(_: T.Type,
                         completion: @escaping () -> Void) -> NotificationToken? where T: Object {

        guard let realm = try? Realm() else { return nil }
        let realmObjects = realm.objects(T.self)
        let realmNotification = realmObjects.observe { changes in
            switch changes {
            case .initial(_), .update(_,_,_,_):
                completion()
            case .error(let error):
                print(error)
            }
        }
        return realmNotification
    }

    //MARK: - Photo, Group, Users

    //Photo
    func savePhotos(photos: [PhotoModel], userId: Int) {

        let realmPhotos: [RealmPhoto] = photos.map { photo in
            let realmPhoto = RealmPhoto()

            realmPhoto.idUser = userId
            realmPhoto.text = photo.text
            realmPhoto.likesCount = photo.likes.count
            realmPhoto.userLikes = photo.likes.userLikes
            realmPhoto.repostsCount = photo.reposts.count
            realmPhoto.photo = photo.getUrlBigPhoto()

            return realmPhoto
        }
    }

    // Group
    func saveGroups(groups: [GroupModel]) {

        let realmGroups: [RealmGroup] = groups.map { group in
            let realmGroup = RealmGroup()

            realmGroup.id = group.id
            realmGroup.photo50 = group.photo50
            realmGroup.isMember = group.isMember
            realmGroup.name = group.name

            return realmGroup
        }
    }

    //Users
    func saveUser(users: [GetUsers]) {

        let realmUsers: [RealmUser] = users.map { users in
            let realmUsers = RealmUser()

            realmUsers.id = users.id
            realmUsers.name = users.name
            realmUsers.photo50 = users.photo50
            realmUsers.firstName = users.firstName
            realmUsers.lastName = users.lastName

            return realmUsers
        }
    }

    //MARK: - get Photo, Group, User

    //Photo
    func restorePhotos(userId: Int) throws -> [PhotoModel] {
        let realm = try Realm()
        let objects = realm.objects(RealmPhoto.self).filter { $0.idUser == userId }
        let photo = Array(
            objects.map{
                PhotoModel(
                    sizes: [SizeModel(height: 1, width: 1, url: $0.photo , type: "BD")],
                    text: $0.text,
                    likes: LikeModel(count: $0.likesCount, userLikes: $0.userLikes),
                    reposts: RepostModel(count: $0.repostsCount)
                )
            }
        )
        return photo

    }

    //Group
    func restoreGroups() throws -> [GroupModel] {
        let realm = try Realm()
        let objects = realm.objects(RealmGroup.self)
        let groups = Array(
            objects.map{
                GroupModel(
                    id: $0.id,
                    isMember: $0.isMember,
                    name: $0.name,
                    photo50: $0.photo50
                )
            }
        )
        return groups

    }

    //User
    func restoreUser() throws -> [GetUsers] {
        let realm = try Realm()
        let objects = realm.objects(RealmUser.self)
        let user = Array(
            objects.map{
                GetUsers(
                    id: $0.id,
                    name: $0.name,
                    photo50: $0.photo50,
                    firstName: $0.firstName,
                    lastName: $0.lastName
                )
            }
        )
        return user

    }
}

