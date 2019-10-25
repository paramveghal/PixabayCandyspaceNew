//
//  ImageApi.swift
//  PixabayCandyspace
//
//  Created by Param on 25/10/2019.
//  Copyright © 2019 Param. All rights reserved.
//

import Foundation

final class ImageApi {

    /// Completes the network request with the URL endpoint. Decodes the JSON returned in the completion handler and updates the `resultData.hits`.
    /// Error handling:
    /// - parameter searchTerm: Searches on the text that is passed in from the UISearchBar.
    /// - returns: Void.
    static func search(searchTerm: String, completion: @escaping(ImageError?, [ImageInfo]?) -> Void) {
        let urlString = "https://pixabay.com/api/?key=13197033-03eec42c293d2323112b4cca6&q=\(searchTerm)&i%20mage_type=photo"
        guard let url = URL(string: urlString) else {
            completion(ImageError.badURL("Bad URL format"), nil)
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(ImageError.failedToLoad(error), nil)
            } else if let data = data {
                do {
                    let resultData = try JSONDecoder().decode(Images.self, from: data)
                    completion(nil, resultData.hits)
                } catch {
                    completion(ImageError.random(error), nil)
                }
            }
            }.resume()
    }
}
