//
//  Kanji.swift
//  m6-evaluation
//
//  Created by Marion Curtil on 05/08/2019.
//  Copyright © 2019 Zenika. All rights reserved.
//

import Foundation

final class Kanji: Codable {
    let name: String
    let pronunciation: String
    let imageUrlString: String

    private enum CodingKeys: String, CodingKey {
        case name
        case pronunciation = "text"
        case imageUrlString = "image"
    }
}
