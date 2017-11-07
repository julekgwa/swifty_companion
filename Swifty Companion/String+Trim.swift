//
//  String+Trim.swift
//  Swifty Companion
//
//  Created by Junius LEKGWARA on 2017/11/07.
//  Copyright © 2017 Junius Lekgwara. All rights reserved.
//

import UIKit

extension String
{
    func trim() -> String
    {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
}
