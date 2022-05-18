//
//  NetWorkService.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 17.05.2022.
//

import Foundation
import WebKit

class NetWorkServiceGet {

    //Получение списка друзей
    static func getFriends(comletion: @escaping(Any?)-> ()) {

        var urlComponents = URLComponents(string: "https://api.vk.com/method/friends.get")
        urlComponents?.queryItems = [
            URLQueryItem(name: "user_id", value: "\(Session.instance.userId)"),
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "fields", value: "photo_50"),
            URLQueryItem(name: "v", value: "5.131")
        ]

        guard let url = urlComponents?.url else { return }

        NetworkService.shared.sendGetRequest(url: url) { json in
            print(json)
        }
    }

    //Получение фотографий человека
    static func getAllPhotos(userId: Int, completion: @escaping(Any?) -> ()) {

        var urlComponents = URLComponents(string: "https://api.vk.com/method/photos.getAll")
        urlComponents?.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "owner_id", value: "\(userId)"),
            URLQueryItem(name: "v", value: "5.131")
        ]

        guard let url = urlComponents?.url else { return }

        NetworkService.shared.sendGetRequest(url: url) { json in
            print(json)
        }
    }

    //Получение групп текущего пользователя
    static func getAllgroup(userId: Int, completion: @escaping(Any?) -> ()) {

        var urlComponents = URLComponents(string: "https://api.vk.com/method/groups.get")
        urlComponents?.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "user_id", value: "\(userId)"),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "v", value: "5.131")
        ]

        guard let url = urlComponents?.url else { return }

        NetworkService.shared.sendGetRequest(url: url) { json in
            print(json)
        }
    }

    //Получение групп по поисковому запросу
    static func getGroupSearch(search: String, completion: @escaping(Any?) -> ()) {

        var urlComponents = URLComponents(string: "https://api.vk.com/method/groups.search")
        urlComponents?.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "q", value: search),
            URLQueryItem(name: "v", value: "5.131")
        ]

        guard let url = urlComponents?.url else { return }

        NetworkService.shared.sendGetRequest(url: url) { json in
            print(json)
        }
    }
}
