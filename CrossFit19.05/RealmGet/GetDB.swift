//
//  GetDB.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 29.05.2022.
//

import Foundation

enum LoadData {

    case photo
    case group
    case user

}

class GetDB {

    static let shared = GetDB()

    private init() {}

    //Photo
    func loadPhotos(userId: Int, completion: @escaping([PhotoModel]) -> ()) {

        do {
            let photos = try RealmDB.shared.restorePhotos(userId: userId)

            if photos.isEmpty {
                NetWorkServiceGet.getAllPhotos(userId: userId) { photos in
                    RealmDB.shared.savePhotos(photos: photos, userId: userId)

                    guard let photo = try? RealmDB.shared.restorePhotos(userId: userId) else { return }

                    completion(photo)
                }

            } else {
                completion(photos)
            }
        } catch {
            print(error)
        }

    }

    //Group
    func loadGroups(userId: Int, completion: @escaping([GroupModel]) -> ()) {

        do {
            let groups = try RealmDB.shared.restoreGroups()

            if groups.isEmpty {
                NetWorkServiceGet.getAllgroup(userId: userId) { groups in
                    RealmDB.shared.saveGroups(groups: groups)

                    guard let group = try? RealmDB.shared.restoreGroups() else { return }

                    completion(group)
                }
            } else {
                completion(groups)
            }
        } catch {
            print(error)
        }

    }

    //User
    func loadUser(userId: Int, completion: @escaping([GetUsers]) -> ()) {

        do {
            let users = try RealmDB.shared.restoreUser()

            if users.isEmpty {
                NetWorkServiceGet.getUsers(userId: userId) { users in
                    RealmDB.shared.saveUser(users: users)

                    guard let user = try? RealmDB.shared.restoreUser() else { return }

                    completion(user)
                }
            } else {
                completion(users)
            }
        } catch {
            print(error)
        }

    }
}
