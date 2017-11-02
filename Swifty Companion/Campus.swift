//
//  Campus.swift
//  Swifty Companion
//
//  Created by Junius Lekgwara on 2017/11/02.
//  Copyright © 2017 Junius Lekgwara. All rights reserved.
//

import Foundation

public class Campus {
    public var language : Language?
    public var id : Int = 0
    public var users_count : Int = 0
    public var time_zone : String = ""
    public var name : String = ""
    public var vogsphere_id : Int = 0
    
    func description() -> String {
        return "Language: \(language!.description()), " +
            "ID: \(id), " +
            "Users Count: \(users_count), " +
            "Time zone: \(time_zone), " +
            "Name: \(name), " +
        "Vogsphere id: \(vogsphere_id)"
    }
}
