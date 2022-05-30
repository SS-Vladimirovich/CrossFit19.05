//
//  NetWorkService.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 17.05.2022.
//

import Foundation
import WebKit
import SwiftUI
import RealmSwift

class NetWorkServiceGet {

    //Получение фотографий человека
    static func getAllPhotos(userId: Int, completion: @escaping([PhotoModel]) -> ()) {

        var urlComponents = URLComponents(string: "https://api.vk.com/method/photos.getAll")
        urlComponents?.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "owner_id", value: "\(userId)"),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "v", value: "5.131")
        ]

        guard let url = urlComponents?.url else { return }

        NetworkService.shared.sendGetRequest(url: url) { data in

            guard let photos = try? JSONDecoder().decode(ArrayResponse<PhotoModel>.self, from: data) else { return }
            completion(photos.response)
        }
    }

    //Получение групп текущего пользователя
    static func getAllgroup(userId: Int, completion: @escaping([GroupModel]) -> ()) {

        var urlComponents = URLComponents(string: "https://api.vk.com/method/groups.get")
        urlComponents?.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "user_id", value: "\(userId)"),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "v", value: "5.131")
        ]

        guard let url = urlComponents?.url else { return }

        NetworkService.shared.sendGetRequest(url: url) { data in

            guard let groups = try? JSONDecoder().decode(ArrayResponse<GroupModel>.self, from: data) else { return }
            completion(groups.response)
        }
    }

    //Получение групп Users пользователя
    static func getUsers(userId: Int, completion: @escaping([GetUsers]) -> ()) {

        var urlComponents = URLComponents(string: "https://api.vk.com/method/users.get")
        urlComponents?.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "user_ids", value: "screen_name"),
            URLQueryItem(name: "fields", value: "photo_50"),
            URLQueryItem(name: "v", value: "5.131")
        ]

        guard let url = urlComponents?.url else { return }

        NetworkService.shared.sendGetRequest(url: url) { data in

            guard let users = try? JSONDecoder().decode(ArrayResponse<GetUsers>.self, from: data) else { return }
            completion(users.response)
        }
    }
}

// MARK: - Struct

//PhotoModel

struct PhotoModel: Decodable {

    let sizes: [SizeModel]
    let text: String
    let likes: LikeModel
    let reposts: RepostModel

    func getUrlBigPhoto() -> String {

        let sort = sizes.sorted(by: { $0.type > $1.type })

        return sort.first?.url ?? ""
    }
}

struct SizeModel: Decodable {

    let height: Int
    let width: Int
    let url: String
    let type: String
}

struct LikeModel: Decodable {

    let count: Int
    let userLikes: Int

    enum CodingKeys: String, CodingKey {

        case count
        case userLikes = "user_likes"
    }
}

struct RepostModel: Decodable {

    let count: Int
}

//GroupModel
struct GroupModel: Decodable {

    let id: Int
    let isMember: Int
    let name: String
    let photo50: String

    enum CodingKeys: String, CodingKey {
        case id
        case isMember = "is_member"
        case name
        case photo50 = "photo_50"
    }
}

//getUsers
struct GetUsers: Decodable {

    let id: Int
    let name: String
    let photo50: String
    let firstName: String
    let lastName: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo50 = "photo_50"
        case firstName
        case lastName
    }
}
