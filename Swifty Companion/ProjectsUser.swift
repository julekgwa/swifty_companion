//
//  ProjectsUser.swift
//  Swifty Companion
//
//  Created by Junius Lekgwara on 2017/11/02.
//  Copyright © 2017 Junius Lekgwara. All rights reserved.
//

import Foundation

public class ProjectsUser {
    var status = ""
    var occurrence = 0
    var id = 0
    var final_mark = 0
    var validated = false
    var current_team_id = 0
    var cursus_ids = Array<Int>()
    var project : Project?
    
    func description() -> String {
        return "Status: \(status), " +
            "Occurrence: \(occurrence), " +
            "Id: \(id), " +
            "Final Mark: \(final_mark), " +
            "Validated: \(validated), " +
            "Current team id: \(current_team_id), " +
            "Cursus id: \(cursus_ids), " +
        "Project: \(project!.description())"
    }
}
