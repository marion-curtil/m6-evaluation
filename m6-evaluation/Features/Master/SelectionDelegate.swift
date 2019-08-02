//
//  SelectionDelegate.swift
//  m6-evaluation
//
//  Created by Marion Curtil on 31/07/2019.
//  Copyright © 2019 Zenika. All rights reserved.
//

import Foundation

protocol SelectionDelegate: class {
    /// Pass data from the master to the detail
    func selected(_ model: ImageTextCellModel)
}
