//
//  Result.swift
//  m6-evaluation
//
//  Created by Marion Curtil on 01/08/2019.
//  Copyright © 2019 Zenika. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case error(Error)
}
