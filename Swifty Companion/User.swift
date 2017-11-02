//
//  User.swift
//  Swifty Companion
//
//  Created by Junius Lekgwara on 2017/11/02.
//  Copyright © 2017 Junius Lekgwara. All rights reserved.
//

import Foundation

public class User {
    public var id : Int = 0
    public var login : String = ""
    public var url : String = ""
    
    func description() -> String {
        return "ID: \(id), " +
            "login: \(login), " +
        "url: \(url)"
    }
}
