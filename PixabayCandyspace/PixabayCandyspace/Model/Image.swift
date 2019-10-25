//
//  PixabayDataModel.swift
//  PixabayCandyspace
//
//  Created by Param on 23/10/2019.
//  Copyright © 2019 Param. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Enums

// API Key used to authenticate the request
enum Constants {
    static let apiKey = "13197033-03eec42c293d2323112b4cca6"
}

// MARK: - Structs

// JSON structure
struct Images: Codable {
    let totalHits: Int
    let hits: [ImageInfo]
}

// Image properties
struct ImageInfo: Codable {
    let largeImageURL: URL?
    let likes: Int?
    let comments: Int?
    let userImageURL: URL?
    let previewURL: URL?
}

// Error handling cases
enum ImageError: Error {
    case failedToLoad(Error)
    case random(Error)
    case badURL(String)
}
