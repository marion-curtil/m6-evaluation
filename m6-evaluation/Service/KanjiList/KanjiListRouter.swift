//
//  KanjiListRouter.swift
//  m6-evaluation
//
//  Created by Marion Curtil on 31/07/2019.
//  Copyright © 2019 Zenika. All rights reserved.
//

import Foundation

struct KanjiListRouter: Router {
    var parameters: [String : String]? {
        return nil
    }

    var urlString: String {
        return "http://dev.tapptic.com/test/json.php"
    }

    var method: RequestMethod {
        return .get
    }
}
