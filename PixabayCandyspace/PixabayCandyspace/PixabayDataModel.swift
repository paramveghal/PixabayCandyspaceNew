//
//  PixabayDataModel.swift
//  PixabayCandyspace
//
//  Created by Param on 23/10/2019.
//  Copyright © 2019 Param. All rights reserved.
//

import Foundation

// MARK: - Structs

struct ImageResponse: Decodable {
    var hits: Images
}

struct Images: Decodable {
    var images: [ImageInfo]
}

struct ImageInfo: Decodable {
    var largeImageURL: String?
    var likes: String?
    var tags: String?
    var comments: String?
    var userImageURL: String?
    var previewURL: String?
}
