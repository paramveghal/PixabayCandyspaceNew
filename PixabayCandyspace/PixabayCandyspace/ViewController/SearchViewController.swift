//
//  ViewController.swift
//  PixabayCandyspace
//
//  Created by Param on 23/10/2019.
//  Copyright © 2019 Param. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!

    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
}

// MARK: - UISearchBarDelegate

extension SearchViewController: UISearchBarDelegate {

    // on hitting return: the text in the searchBar will be passed to `searchForImages`
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
       // galleryViewController.searchForImages(text: searchText)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "GalleryViewController") as! GalleryViewController
        self.present(newViewController, animated: true, completion: nil)
    }
}
