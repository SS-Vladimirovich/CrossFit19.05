//
//  Session.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 25.04.2022.
//

import UIKit

struct Session {

    static var instance = Session()

    private init(){}

    var token = ""
    var userId = 0
}
