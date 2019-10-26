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
    let total: Int
}

// Image properties
struct ImageInfo: Codable {
    let largeImageURL: URL
    let likes: Int?
    let tags: String?
    let comments: Int?
    let previewURL: URL?
}

// Error handling cases
enum ImageError: Error {
    case failedToLoad(Error)
    case random(Error)
    case badURL(String)
}

// MARK: - JSON Example

/*
 {  
 "totalHits": 500,
 "hits": [
 {
 "largeImageURL": "https://pixabay.com/get/52e3d14a4b5ab108f5d084609629347f1c38dee6504c704c722d7ad5934dc25b_1280.jpg",
 "webformatHeight": 429,
 "webformatWidth": 640,
 "likes": 1155,
 "imageWidth": 2165,
 "id": 434918,
 "user_id": 2323,
 "views": 449438,
 "comments": 185,
 "pageURL": "https://pixabay.com/photos/legs-window-car-dirt-road-relax-434918/",
 "imageHeight": 1453,
 "webformatURL": "https://pixabay.com/get/52e3d14a4b5ab108f5d084609629347f1c38dee6504c704c722d7ad5934dc25b_640.jpg",
 "type": "photo",
 "previewHeight": 100,
 "tags": "legs, window, car",
 "downloads": 174596,
 "user": "Greyerbaby",
 "favorites": 1503,
 "imageSize": 587598,
 "previewWidth": 150,
 "userImageURL": "https://cdn.pixabay.com/user/2014/11/14/05-39-07-629_250x250.jpg",
 "previewURL": "https://cdn.pixabay.com/photo/2014/09/03/20/15/legs-434918_150.jpg"
 },
 */
