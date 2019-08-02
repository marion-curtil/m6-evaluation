//
//  ImageTextCell.swift
//  m6-evaluation
//
//  Created by Marion Curtil on 30/07/2019.
//  Copyright © 2019 Zenika. All rights reserved.
//

import UIKit
import SDWebImage

class ImageTextCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageHolder: UIImageView!

    func setup(with model: ImageTextCellModel) {
        label.text = model.text
        imageHolder.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imageHolder.sd_setImage(with: model.imageUrl)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            let touchView = UIView()
            touchView.backgroundColor = UIColor(red: 222/255, green: 100/255, blue: 100/255, alpha: 1.0)
            backgroundView = touchView
            label.textColor = .white
        } else {
            backgroundView = nil
            label.textColor = .black
        }
    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)

        if highlighted {
            let touchView = UIView()
            touchView.backgroundColor = UIColor(red: 148/255, green: 178/255, blue: 227/255, alpha: 1.0)
            backgroundView = touchView
            label.textColor = .white
        } else {
            backgroundView = nil
            label.textColor = .black
        }
    }
}
