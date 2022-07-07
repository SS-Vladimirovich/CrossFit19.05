//
//  Session.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 25.04.2022.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseMessaging

//MARK: - Session

struct Session {

    static var instance = Session()

    private init(){}

    var token = ""
    var userId = 0
}

//MARK: - NetworkConstants
struct NetworkConstants {
    let scheme = "https"
    let host = "api.vk.com"

    let clientID = "7437299"
    let scope = "401502"
    let versionAPI = "5.131"
}
