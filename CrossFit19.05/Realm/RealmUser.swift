//
//  RealmUser.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 24.05.2022.
//

import Foundation
import RealmSwift
import Alamofire

class RealmUser: Object {

    @Persisted var userIds: String
    @Persisted var fields: String

}
