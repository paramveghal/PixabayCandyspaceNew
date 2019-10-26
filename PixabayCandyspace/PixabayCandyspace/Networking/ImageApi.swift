//
//  ImageApi.swift
//  PixabayCandyspace
//
//  Created by Param on 25/10/2019.
//  Copyright © 2019 Param. All rights reserved.
//

import Foundation
import UIKit

final class ImageApi {

    /// Completes the network request with the URL endpoint. Decodes the JSON returned in the completion handler and updates the `resultData.hits`.
    /// Error handling:
    /// - parameter searchTerm: Searches on the text that is passed in from the UISearchBar.
    /// - returns: Void.
    static func search(searchTerm: String, completion: @escaping(ImageError?, [ImageInfo]?) -> Void) {
        let urlString = "https://pixabay.com/api/?key=\(Constants.apiKey)&q=\(searchTerm)&image_type=photo"
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

// After completing the search logic I started working on the logic for caching image
// I realised I wasn't going to be able to cache using the method I had (which was requesting for the entire JSON structure and then using the URL for the image) - Above
// I should've gone for the approach below using `UIImage` for the completion handler type; instead of requesting for the entire JSON.


/*
    static func testImage(searchTerm: String, completion: @escaping(ImageError?, UIImage?) -> Void) {
        let urlString = "https://pixabay.com/api/?key=\(Constants.apiKey)&q=\(searchTerm)&image_type=photo"
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
                    let imageData = try Data(contentsOf: resultData.hits)
                    completion(nil, UIImage(data: imageData))
                } catch {
                    completion(ImageError.random(error), nil)
                }
            }
        }.resume()
    }
 */
}
