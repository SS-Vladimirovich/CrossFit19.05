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

    private var urlConstructor = URLComponents()
    private let configuration: URLSessionConfiguration!
    private let session: URLSession!

    init() {
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        configuration = URLSessionConfiguration.default
        session = URLSession(configuration: configuration)
    }

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

    //Получение новостей Групп пользователя
    func getNews(completion: @escaping ([NewsModel]) -> Void, onError: @escaping (Error) -> Void) {

        // 1. Создаем URL для запроса
        var urlComponents = URLComponents(string: "https://api.vk.com/method/newsfeed.get")
        urlConstructor.queryItems = [
            URLQueryItem(name: "filters", value: "post"),
            URLQueryItem(name: "start_from", value: "next_from"),
            URLQueryItem(name: "count", value: "20"),
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: "5.131"),
        ]

        // 2. Создаем запрос
        let task = session.dataTask(with: urlConstructor.url!) {  (data, response, error) in

            // 3. Ловим ошибку
            if error != nil {
                onError(AppError.errorTask)
            }
            // 4 Проверяем есть ли data
            guard let data = data else {
                onError(AppError.noDataProvided)
                return
            }
            // 5 Парсим data
            guard var news = try? JSONDecoder().decode(ResponseNews.self, from: data).response.items else {
                onError(AppError.failedToDecode)
                return
            }
            guard let profiles = try? JSONDecoder().decode(ResponseNews.self, from: data).response.profiles else {
                onError(AppError.failedToDecode)
                print("Error profiles")
                return
            }
            guard let groups = try? JSONDecoder().decode(ResponseNews.self, from: data).response.groups else {
                onError(AppError.failedToDecode)
                print("Error groups")
                return
            }

            // 6 Объединяю массивы
            for index in 0..<news.count {
                if news[index].sourceID < 0 {
                    let group = groups.first(where: { $0.id == -news[index].sourceID })
                    news[index].avatarURL = group?.avatarURL
                    news[index].creatorName = group?.name
                } else {
                    let profile = profiles.first(where: { $0.id == news[index].sourceID })
                    news[index].avatarURL = profile?.avatarURL
                    news[index].creatorName = (profile?.firstName ?? "") + (profile?.lastName ?? "")
                }
            }

            DispatchQueue.main.async {
                completion(news)
            }
        }
        task.resume()
    }

    func getNewsResult(completion: @escaping (Swift.Result<[NewsModel], AppError>) -> Void) {

        // 1. Создаем URL для запроса
        var urlComponents = URLComponents(string: "https://api.vk.com/method/newsfeed.get")
        urlConstructor.queryItems = [
            URLQueryItem(name: "filters", value: "post"),
            URLQueryItem(name: "start_from", value: "next_from"),
            URLQueryItem(name: "count", value: "20"),
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: "5.131"),
        ]

        // 2. Создаем запрос
        let task = session.dataTask(with: urlConstructor.url!) {  (data, response, error) in

            // 3. Ловим ошибку
            if error != nil {
                completion(.failure(AppError.errorTask))
            }
            // 4 Проверяем есть ли data
            guard let data = data else {
                completion(.failure(AppError.noDataProvided))
                return
            }
            // 5 Парсим data
            guard var news = try? JSONDecoder().decode(ResponseNews.self, from: data).response.items else {
                completion(.failure(AppError.failedToDecode))
                return
            }
            guard let profiles = try? JSONDecoder().decode(ResponseNews.self, from: data).response.profiles else {
                completion(.failure(AppError.failedToDecode))
                print("Error profiles")
                return
            }
            guard let groups = try? JSONDecoder().decode(ResponseNews.self, from: data).response.groups else {
                completion(.failure(AppError.failedToDecode))
                print("Error groups")
                return
            }

            // 6 Объединяю массивы
            for index in 0..<news.count {
                if news[index].sourceID < 0 {
                    let group = groups.first(where: { $0.id == -news[index].sourceID })
                    news[index].avatarURL = group?.avatarURL
                    news[index].creatorName = group?.name
                } else {
                    let profile = profiles.first(where: { $0.id == news[index].sourceID })
                    news[index].avatarURL = profile?.avatarURL
                    news[index].creatorName = (profile?.firstName ?? "") + (profile?.lastName ?? "")
                }
            }

            DispatchQueue.main.async {
                completion(.success(news))
            }
        }
        task.resume()
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
