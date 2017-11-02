//
//  LanguagesUser.swift
//  Swifty Companion
//
//  Created by Junius Lekgwara on 2017/11/02.
//  Copyright © 2017 Junius Lekgwara. All rights reserved.
//

import Foundation

public class LanguagesUser {
    public var created_at : String = ""
    public var id : Int = 0
    public var user_id : Int = 0
    public var position : Int = 0
    public var language_id : Int = 0
    
    func description() -> String {
        return "Created at: \(created_at), " +
            "Id: \(id), " +
            "User ID: \(user_id)" +
            "Position: \(position), " +
        "Language ID: \(language_id)"
    }
}
