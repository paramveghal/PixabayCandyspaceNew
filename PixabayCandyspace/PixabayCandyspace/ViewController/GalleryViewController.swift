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

    var finalImageName = ""
    let searchViewController = SearchViewController()

    @IBOutlet weak var tableView: UITableView!

    // reloads data when images get updated
    var images = [ImageInfo]() {
        didSet {
            // dispatch back to the main thread
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchForImages(text: finalImageName)
    }

    /// Completes the network request with the URL endpoint. Decodes the JSON returned in the completion handler and updates the `resultData.hits`.
    /// Error handling:
    /// - parameter text: Searches on the text that is passed in from the UISearchBar.
    /// - returns: Void.
    func searchForImages(text: String) {
        ImageApi.search(searchTerm: text) { (error, images) in
            if let error = error {
                DispatchQueue.main.async {
                self.showAlert(title: "Error 😞", message: "\(error.localizedDescription)")
                }
            } else if let images = images {
                    self.images = images
            }
        }
    }

    // Alert view
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let okActionView = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okActionView)
        present(alertController, animated: true, completion: nil)
    }
}
    extension GalleryViewController: UITableViewDataSource {

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return images.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)
                    let image = images[indexPath.row]

                    let likes: Int = image.likes ?? 0
                    let likesToString = String(likes)
                    let imageTags = image.tags ?? "No tags available 😢"
                    cell.textLabel?.text = "\(likesToString) 👍🏻 likes"
                    cell.detailTextLabel?.text = "#️⃣ \(imageTags)"
                    fetchImageForCell(cell: cell, image: image)
                    return cell
        }

    private func fetchImageForCell(cell: UITableViewCell, image: ImageInfo) {
                DispatchQueue.global().async {
            do {
                let imageData = try Data(contentsOf: image.largeImageURL)
                DispatchQueue.main.async {
                    cell.imageView?.image = UIImage(data: imageData)
                }
            } catch {
                print("contents of url error: \(error)")
            }
        }
    }
}
