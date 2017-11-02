//
//  Project.swift
//  Swifty Companion
//
//  Created by Junius Lekgwara on 2017/11/02.
//  Copyright © 2017 Junius Lekgwara. All rights reserved.
//

import Foundation

public class Project {
    var parent_id = 0
    var id = 0
    var name = ""
    var slug = ""
    
    func description() -> String {
        return "Parent id: \(parent_id), " +
            "Id: \(id), " +
            "Name: \(name), " +
        "Slug: \(slug)"
    }
}
