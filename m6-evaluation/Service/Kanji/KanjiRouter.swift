//
//  KanjiRouter.swift
//  m6-evaluation
//
//  Created by Marion Curtil on 05/08/2019.
//  Copyright © 2019 Zenika. All rights reserved.
//

import Foundation

struct KanjiRouter: Router {
    public let name: String

    public init(name: String) {
        self.name = name
    }

    var parameters: [String: String]? {
        return ["name": name]
    }

    var urlString: String {
        return "http://dev.tapptic.com/test/json.php"
    }

    var method: RequestMethod {
        return .get
    }
}
