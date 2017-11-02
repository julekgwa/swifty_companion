//
//  Skills.swift
//  Swifty Companion
//
//  Created by Junius Lekgwara on 2017/11/02.
//  Copyright © 2017 Junius Lekgwara. All rights reserved.
//

import Foundation

public class Skills {
    public var id : Int = 0
    public var name : String = ""
    public var level : Double = 0.0
    
    func description() -> String {
        return "ID: \(id), " +
            "name: \(name), " +
        "level: \(level)"
    }
}
