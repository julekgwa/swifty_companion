//
//  Language.swift
//  Swifty Companion
//
//  Created by Junius Lekgwara on 2017/11/02.
//  Copyright © 2017 Junius Lekgwara. All rights reserved.
//

import Foundation

public class Language {
    public var id : Int = 0
    public var updated_at : String = ""
    public var name : String = ""
    public var identifier : String = ""
    public var created_at : String = ""
    
    func description() -> String {
        return "ID: \(id), " +
            "Updated at: \(updated_at), " +
            "name: \(name), " +
            "Identifier: \(identifier), " +
        "created at: \(created_at)"
    }
}
