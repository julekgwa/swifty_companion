//
//  CampusUser.swift
//  Swifty Companion
//
//  Created by Junius Lekgwara on 2017/11/02.
//  Copyright © 2017 Junius Lekgwara. All rights reserved.
//

import Foundation

public class CampusUser {
    public var id : Int = 0
    public var user_id : Int = 0
    public var is_primary : Bool = false
    public var campus_id : Int = 0
    
    func description() -> String {
        return "Campus id: \(campus_id), " +
            "Id: \(id), " +
            "Is Primary: \(is_primary), " +
        "User ID: \(user_id)"
    }
}
