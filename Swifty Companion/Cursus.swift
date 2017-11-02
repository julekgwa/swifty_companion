//
//  Cursus.swift
//  Swifty Companion
//
//  Created by Junius Lekgwara on 2017/11/02.
//  Copyright © 2017 Junius Lekgwara. All rights reserved.
//

import Foundation

public class Cursus {
    public var id : Int = 0
    public var slug : String = ""
    public var name : String = ""
    public var created_at : String = ""
    
    func description() -> String {
        return "ID: \(id), " +
            "slug: \(slug), " +
            "name: \(name), " +
        "created at: \(created_at)"
    }
}
