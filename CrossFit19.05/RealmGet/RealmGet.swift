//
//  RealmGet.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 24.05.2022.
//

import Foundation
import RealmSwift

//MARK: - Photo

class RealmPhoto: Object {
    @Persisted var idUser: Int
    @Persisted var text: String
    @Persisted var likesCount: Int
    @Persisted var userLikes: Int
    @Persisted var repostsCount: Int
    @Persisted var photo: String
}

//MARK: - Group

class RealmGroup: Object {
    @Persisted var id: Int
    @Persisted var isMember: Int
    @Persisted var name: String
    @Persisted var photo50: String
}

//MARK: - User

class RealmUser: Object {
    @Persisted var id: Int
    @Persisted var name: String
    @Persisted var photo50: String
}
