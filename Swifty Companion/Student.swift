//
//  Student.swift
//  Swifty Companion
//
//  Created by Junius Lekgwara on 2017/11/02.
//  Copyright © 2017 Junius Lekgwara. All rights reserved.
//

import Foundation

public class Student {
    public var campus_users = Array<CampusUser>()
    public var partnerships : Array<String>?
    public var correction_point : Int = 0
    public var pool_month : String = ""
    public var displayname : String = ""
    public var patroning : Array<String>?
    public var languages_users = Array<LanguagesUser>()
    public var last_name : String = ""
    public var id : Int = 0
    public var phone : String = ""
    public var projects_users = Array<ProjectsUser>()
    public var image_url : String = ""
    public var expertises_users = Array<ExpertisesUser>()
    public var url : String = ""
    public var email : String = ""
    public var pool_year = ""
    public var wallet : Int = 0
    public var cursus_users = Array<CursusUser>()
    public var patroned : Array<String>?
    public var campus = Array<Campus>()
    public var groups : Array<String>?
    public var location : String = ""
    public var login : String = ""
    public var staff: Bool = false
    public var achievements : Array<String>?
    public var first_name : String = ""
    public var titles : Array<String>?
    
    func setCampusUsers(data: [[String: AnyObject]]) {
        for item in data {
            let campus_user = CampusUser()
            campus_user.id = item["id"] as? Int ?? 0
            campus_user.user_id = item["user_id"] as? Int ?? 0
            campus_user.is_primary = item["is_primary"] as? Bool ?? false
            campus_user.campus_id = item["campus_id"] as? Int ?? 0
            
            campus_users.append(campus_user)
        }
    }
    
    func setLanguagesUsers(data: [[String: AnyObject]]) {
        for item in data {
            let language_user = LanguagesUser()
            language_user.position = item["position"] as? Int ?? 0
            language_user.language_id = item["language_id"] as? Int ?? 0
            language_user.id = item["id"] as? Int ?? 0
            language_user.user_id = item["user_id"] as? Int ?? 0
            language_user.created_at = item["created_at"] as? String ?? ""
            languages_users.append(language_user)
        }
    }
    
    func setProjectsUsers(data: [[String: AnyObject]]) {
        for item in data {
            let project_user = ProjectsUser()
            let project = Project()
            
            // project user
            project_user.status = (item["status"] as? String)!
            project_user.occurrence = item["occurrence"] as? Int ?? 0
            project_user.id = (item["id"] as? Int)!
            project_user.final_mark = item["final_mark"] as? Int ?? 0
            project_user.validated = item["validated"] as? Bool ?? false
            project_user.current_team_id = item["current_team_id"] as? Int ?? 0
            project_user.cursus_ids = (item["cursus_ids"] as? Array)!
            
            // project
            project.id = item["project"]?["id"] as? Int ?? 0
            project.parent_id = item["project"]?["parent_id"] as? Int ?? 0
            project.slug = item["project"]?["slug"] as? String ?? ""
            project.name = item["project"]?["name"] as? String ?? ""
            project_user.project = project
            
            // append data
            projects_users.append(project_user)
            
        }
    }
    
    func setExpertisesUsers(data: [[String: AnyObject]]) {
        for item in data {
            let expertise_user = ExpertisesUser()
            expertise_user.id = item["id"] as? Int ?? 0
            expertise_user.created_at = item["created_at"] as? String ?? ""
            expertise_user.expertise_id = item["expertise_id"] as? Int ?? 0
            expertise_user.contact_me = item["contact_me"] as? Bool ?? false
            expertise_user.value = item["value"] as? Int ?? 0
            expertise_user.user_id = item["user_id"] as? Int ?? 0
            expertise_user.interested = item["interested"] as? Bool ?? false
            
            expertises_users.append(expertise_user)
        }
    }
    
    func setCursusUsers(data: [[String: AnyObject]]) {
        for item in data {
            let cursus_user = CursusUser()
            let skills = Skills()
            let user = User()
            let cursus = Cursus()
            
            cursus_user.begin_at = item["begin_at"] as? String ?? ""
            cursus_user.end_at = item["end_at"] as? String ?? ""
            cursus_user.id = item["id"] as? Int ?? 0
            cursus_user.grade = item["grade"] as? String ?? ""
            cursus_user.level = item["level"] as? Double ?? 0.0
            cursus_user.cursus_id = item["cursus_id"] as? Int ?? 0
            
            skills.id = item["skills"]?["id"] as? Int ?? 0
            skills.level = item["skills"]?["level"] as? Double ?? 0.0
            skills.name = item["skills"]?["name"] as? String ?? ""
            user.id = item["user"]?["id"] as? Int ?? 0
            user.login = item["user"]?["login"] as? String ?? ""
            user.url = item["user"]?["url"] as? String ?? ""
            cursus.id = item["cursus"]?["id"] as? Int ?? 0
            cursus.name = item["cursus"]?["name"] as? String ?? ""
            cursus.slug = item["cursus"]?["slug"] as? String ?? ""
            cursus.created_at = item["cursus"]?["created_at"] as? String ?? ""
            
            cursus_user.skills.append(skills)
            cursus_user.user = user
            cursus_user.cursus = cursus
            
            cursus_users.append(cursus_user)
            
        }
    }
    
    func setCampus(data: [[String: AnyObject]]) {
        for item in data {
            let language = Language()
            let camp = Campus()
            
            camp.id = item["id"] as? Int ?? 0
            camp.users_count = item["users_count"] as? Int ?? 0
            camp.time_zone = item["time_zone"] as? String ?? ""
            camp.name = item["name"] as? String ?? ""
            camp.vogsphere_id = item["vogsphere_id"] as? Int ?? 0
            
            language.created_at = item["language"]?["created_at"] as? String ?? ""
            language.name = item["language"]?["name"] as? String ?? ""
            language.identifier = item["language"]?["identifier"] as? String ?? ""
            language.updated_at = item["language"]?["updated_at"] as? String ?? ""
            language.id = item["language"]?["id"] as? Int ?? 0
            
            camp.language = language
            
            campus.append(camp)
            
        }
    }
    
    func description() -> String {
        return "Campus Users:\t\t \(campus_users)\n" +
            "Correction points:\t \(correction_point)\n" +
            "Pool Month:\t\t\t \(pool_month)\n" +
            "Display name:\t\t \(displayname)\n" +
            "Languages Users:\t \(languages_users)\n" +
            "Last Name:\t\t\t \(last_name)\n" +
            "ID:\t\t\t\t\t \(id)\n" +
            "Phone:\t\t \(phone)\n" +
            "Projects Users:\t\t \(projects_users)\n" +
            "Image URL:\t\t\t \(image_url)\n" +
            "Expertises Users:\t \(expertises_users)\n" +
            "URL:\t\t\t\t \(url)\n" +
            "Email:\t\t\t\t \(email)\n" +
            "Pool year:\t\t\t \(pool_year)\n" +
            "Wallet:\t\t\t\t \(wallet)\n" +
            "Cursus Users:\t\t \(cursus_users)\n" +
            "Campus:\t\t\t\t \(campus)\n" +
            "Login:\t\t\t\t \(login)\n" +
        "First Name:\t\t\t \(first_name)"
    }
}
