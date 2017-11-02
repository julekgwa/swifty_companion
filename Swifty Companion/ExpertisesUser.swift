//
//  ExpertisesUser.swift
//  Swifty Companion
//
//  Created by Junius Lekgwara on 2017/11/02.
//  Copyright © 2017 Junius Lekgwara. All rights reserved.
//

import Foundation

public class ExpertisesUser {
    public var id : Int = 0
    public var created_at : String = ""
    public var expertise_id : Int = 0
    public var contact_me : Bool = false
    public var value : Int = 0
    public var user_id : Int = 0
    public var interested : Bool = false
    
    func description() -> String {
        return "ID: \(id), " +
            "Created at: \(created_at), " +
            "Expertise ID: \(expertise_id)" +
            "Contact me: \(contact_me), " +
            "Value: \(value), " +
            "User ID: \(user_id), " +
        "Interested: \(interested)"
    }
}
