//
//  CursusUser.swift
//  Swifty Companion
//
//  Created by Junius Lekgwara on 2017/11/02.
//  Copyright © 2017 Junius Lekgwara. All rights reserved.
//

import Foundation

public class CursusUser {
    public var skills = Array<Skills>()
    public var begin_at : String = ""
    public var end_at : String = ""
    public var id : Int = 0
    public var user : User?
    public var grade : String = ""
    public var level : Double = 0.0
    public var cursus : Cursus?
    public var cursus_id : Int = 0
    
    func description() -> String {
        return "Skills: \(skills), " +
            "Begin at: \(begin_at), " +
            "End at: \(end_at), " +
            "ID: \(id), " +
            "User: \(user!.description()), " +
            "Grade: \(grade), " +
            "Level: \(level), " +
            "Cursus: \(cursus!.description()), " +
        "Cursus id: \(cursus_id)"
    }
}
