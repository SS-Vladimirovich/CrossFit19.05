//
//  NewsWeekTableViewCell.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 07.04.2022.
//

import UIKit

class NewsWeekTableViewCell: UITableViewCell {

    @IBOutlet weak var imageAvatarGroup: UIImageView!
    @IBOutlet weak var nameGroup: UILabel!
    @IBOutlet weak var createNews: UILabel!
    @IBOutlet weak var textNews: UILabel!
    @IBOutlet weak var fotoNews: UIImageView!
    @IBOutlet weak var likeImage: UIImageView!
    @IBOutlet weak var countLikeNews: UILabel!
    @IBOutlet weak var commentsNews: UIImageView!
    @IBOutlet weak var countCommentsNews: UILabel!
    @IBOutlet weak var arrowsNews: UIImageView!
    @IBOutlet weak var countArrowsNews: UILabel!
    @IBOutlet weak var viewNews: UIImageView!
    @IBOutlet weak var countViewNews: UILabel!
    @IBAction func clickBatton(_ sender: Any) {
    }


    override func awakeFromNib() {
        super.awakeFromNib()

    fotoNews.systemLayoutSizeFitting(CGSize(width: contentView.frame.width, height: UIView.layoutFittingExpandedSize.height),
                                         withHorizontalFittingPriority: .required,
                                         verticalFittingPriority: .fittingSizeLevel)
    }
}
