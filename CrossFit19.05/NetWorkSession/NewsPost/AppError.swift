//
//  AppError.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 04.07.2022.
//

import Foundation

enum AppError: Error {
    case noDataProvided
    case failedToDecode
    case errorTask
    case notCorrectUrl
}
