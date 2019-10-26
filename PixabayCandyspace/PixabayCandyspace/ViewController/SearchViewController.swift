//
//  ViewController.swift
//  PixabayCandyspace
//
//  Created by Param on 23/10/2019.
//  Copyright © 2019 Param. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - Properties

    var imageText = ""

    // MARK: - IBOutlets

    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.image = UIImage(named: "appleLogo")
        }
    }
    @IBOutlet weak var searchBar: UISearchBar!

    @IBAction func onClick(_ sender: Any) {
        imageText = searchBar.text!
        performSegue(withIdentifier: "image", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! GalleryViewController
        vc.finalImageName = self.imageText
    }

    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
