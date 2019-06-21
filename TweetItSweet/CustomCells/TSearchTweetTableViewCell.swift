//
//  TSearchTweetTableViewCell.swift
//  TweetItSweet
//
//  Created by Randhir Kumar on 17/06/19.
//  Copyright © 2019 Randhir Kumar. All rights reserved.
//

import UIKit
import SDWebImage

class TSearchTweetTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var aContainerView: UIView!
    @IBOutlet weak private var aProfileImageView: UIImageView!
    @IBOutlet weak private var aFullNameLabel: UILabel!
    @IBOutlet weak private var ahandleLabel: UILabel!
    @IBOutlet weak private var aDescLabel: UILabel!
    @IBOutlet weak private var aReTweetButton: UIButton!
    @IBOutlet weak private var aLikeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    fileprivate func setupUI() {
        aContainerView.setCornerRadius(value: 15)
        aReTweetButton.imageView?.contentMode = .scaleAspectFit
        aLikeButton.imageView?.contentMode = .scaleAspectFit
    }
    
    func configCell(model: SearchResultResponse)  {
        if let user = model.user {
            self.aFullNameLabel.text = "\(user.name ?? "")"
            self.ahandleLabel.text = "@\(user.screen_name ?? "")"
            if let urlString = user.profile_image_url, let url = URL(string: urlString) {
                self.aProfileImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "profileIcon"), options: .continueInBackground, completed: nil)
            }
        }
        self.aDescLabel.text = model.text ?? ""
        
        if let tweetCount = model.retweet_count {
            self.aReTweetButton.setTitle("\(tweetCount.formatUsingAbbrevation())", for: .normal)
        }
        
        if let favouriteCount = model.favorite_count {
            self.aLikeButton.setTitle("\(favouriteCount.formatUsingAbbrevation())", for: .normal)
        }
    }
    
}
