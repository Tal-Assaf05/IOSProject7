//
//  DetailViewController.swift
//  ios101-project6-tumblr
//
//  Created by Tal Assaf on 4/10/25.
//
import UIKit
import Nuke

class DetailViewController: UIViewController {
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var captionTextView: UITextView!

    var post: Post?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Safely unwrap post
        guard let post = post else {
            print("❌ ERROR: post was not set")
            return
        }

        title = post.summary
        captionTextView.text = post.caption.trimHTMLTags()

        if let firstPhoto = post.photos.first {
            let url = firstPhoto.originalSize.url
            Nuke.loadImage(with: url, into: detailImageView)
        }
    }

}
