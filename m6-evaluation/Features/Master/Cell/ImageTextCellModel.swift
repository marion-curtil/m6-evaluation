//
//  ImageTextCellModel.swift
//  m6-evaluation
//
//  Created by Marion Curtil on 30/07/2019.
//  Copyright © 2019 Zenika. All rights reserved.
//

import UIKit

struct ImageTextCellModel {
    let imageUrl: URL?
    let text: String

    init(imageUrl: URL?, text: String) {
        self.imageUrl = imageUrl
        self.text = text
    }
}
