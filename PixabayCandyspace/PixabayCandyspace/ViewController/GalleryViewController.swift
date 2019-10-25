//
//  GalleryViewController.swift
//  PixabayCandyspace
//
//  Created by Param on 23/10/2019.
//  Copyright © 2019 Param. All rights reserved.
//

import Foundation
import UIKit

final class GalleryViewController: UIViewController {

    let searchViewController = SearchViewController()

    @IBOutlet weak var tableView: UITableView!

    // reloads data when images get updated
    var images = [ImageInfo]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // if nothing is searched images of cars are shown by default
        searchForImages(text: "car")
    }

    /// Completes the network request with the URL endpoint. Decodes the JSON returned in the completion handler and updates the `resultData.hits`.
    /// Error handling:
    /// - parameter text: Searches on the text that is passed in from the UISearchBar.
    /// - returns: Void.
    func searchForImages(text: String) {
        guard let encodedKeyword = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        ImageApi.search(searchTerm: encodedKeyword) { (error, images) in
            if let error = error {
                preconditionFailure("test error \(error)")
            } else
                if let images = images {
                    self.images = images
            }
        }
    }
}
    extension GalleryViewController: UITableViewDataSource {

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return images.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)
                    let image = images[indexPath.row]
                    cell.textLabel?.text = "image.comments"
                    cell.detailTextLabel?.text = "image.comments"
                    fetchImageForCell(cell: cell, image: image)
                    return cell
        }

    private func fetchImageForCell(cell: UITableViewCell, image: ImageInfo) {
        DispatchQueue.global().async {
            do {
                let test = URL(string: "")
                let imageData = try Data(contentsOf: image.largeImageURL ?? test!)
                    cell.imageView?.image = UIImage(data: imageData)
            } catch {
                print("contents of url error: \(error)")
            }
        }
    }
}
