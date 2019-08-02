//
//  IUDevice+Extension.swift
//  m6-evaluation
//
//  Created by Marion Curtil on 31/07/2019.
//  Copyright © 2019 Zenika. All rights reserved.
//

import UIKit

extension UIDevice {
    public static var isIpadPortrait: Bool {
        return [.portrait, .portraitUpsideDown].contains(UIDevice.current.orientation) && UIDevice.current.userInterfaceIdiom == .pad
    }
}
