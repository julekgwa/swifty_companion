//
//  StudentInfoViewController.swift
//  Swifty Companion
//
//  Created by Junius Lekgwara on 2017/11/04.
//  Copyright © 2017 Junius Lekgwara. All rights reserved.
//

import UIKit
import SDWebImage
import ChameleonFramework

class StudentInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var projectsCountLabel: UILabel!
    @IBOutlet weak var skillCountLabel: UILabel!
    @IBOutlet weak var skillsView: UICollectionView!
    @IBOutlet weak var noSkillsLabel: UILabel!
    
    @IBOutlet weak var noProjectsLabel: UICollectionView!
    @IBOutlet weak var skillLabel: UILabel!
    @IBOutlet weak var projectView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var projectLabel: UILabel!
    
    var studentInfo = Student()
    var studentArray = Array<Student>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentArray.removeAll()
        studentArray.append(studentInfo)
        
        // add nib files
        let table = UINib(nibName: "ProfileViewCell", bundle: nil)
        let skills = UINib(nibName: "SkillCollectionViewCell", bundle: nil)
        let project = UINib(nibName: "ProjectCollectionViewCell", bundle: nil)
        skillsView.register(skills, forCellWithReuseIdentifier: "skills")
        projectView.register(project, forCellWithReuseIdentifier: "projects")
        tableView.register(table, forCellReuseIdentifier: "profile")
        
        // change background colors
//        skillsView.backgroundColor = UIColor.flatWhite()
//        projectView.backgroundColor = UIColor.flatWhite()
        
        // hide collection view if there's no info to display
        hideObject()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func hideObject() {
        if studentArray[0].cursus_users[0].skills.count == 0 {
            skillsView.isHidden = true
            noSkillsLabel.isHidden = false
        }
        
        if studentArray[0].projects_users.count == 0 {
            projectView.isHidden = true
            noProjectsLabel.isHidden = false
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profile", for: indexPath) as! ProfileViewCell
        
        cell.name.text = "\(studentArray[indexPath.row].first_name) \(studentArray[indexPath.row].last_name.uppercased())"
        cell.username.text = "@\(studentArray[indexPath.row].login)"
        let skillCount = String(studentArray[indexPath.row].cursus_users[0].skills.count)
        let projectCount = String(studentArray[indexPath.row].projects_users.count)
        cell.skillsCount.text = skillCount
        cell.projectsCount.text = projectCount
        skillCountLabel.text = "\(skillCount) SKILLS"
        projectsCountLabel.text = "\(projectCount) PROJECTS"
        let email = studentArray[indexPath.row].email
        cell.wallet.text = "\(studentArray[indexPath.row].wallet)"
        let level : Double = studentArray[indexPath.row].cursus_users[indexPath.row].level
        cell.progress.setProgress(0.0, animated: true)
        let percentage = level.truncatingRemainder(dividingBy: 1)
        cell.progress.setProgress(Float(percentage), animated: true)
        cell.progress.progress = Float(percentage)
        cell.level.text = "Level: \(level)"
        cell.correctionPoints.text = "Correction Points: \(studentArray[indexPath.row].correction_point)"
        cell.profilePic.sd_setImage(with: URL(string: studentArray[indexPath.row].image_url), placeholderImage: UIImage(named: "medium_default.png"))
        cell.profilePic.layer.cornerRadius = cell.profilePic.frame.size.width / 2
        cell.profilePic.clipsToBounds = true
        cell.campus.text = "\(studentArray[indexPath.row].campus[0].name), \(email)"
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return studentArray[0].cursus_users[0].skills.count
        }
        return studentArray[0].projects_users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1 {
            let view = collectionView.dequeueReusableCell(withReuseIdentifier: "skills", for: indexPath) as! SkillCollectionViewCell
            
            if studentArray[0].cursus_users[0].skills.count > 0 {
                view.projectName.text = studentArray[0].cursus_users[0].skills[indexPath.row].name
                view.level.text = String(studentArray[0].cursus_users[0].skills[indexPath.row].level)
                let level : Double = studentArray[0].cursus_users[0].skills[indexPath.row].level
                view.projectProgress.setProgress(0.0, animated: true)
                let percentage = level.truncatingRemainder(dividingBy: 1)
                view.projectProgress.setProgress(Float(percentage), animated: true)
                
                view.projectProgress.progress = Float(percentage)
            }
            return view
        }
        
        let view = collectionView.dequeueReusableCell(withReuseIdentifier: "projects", for: indexPath) as! ProjectCollectionViewCell
        
        if studentArray[0].projects_users.count > 0 {
            let project = studentArray[0].projects_users[indexPath.row]
            view.projectName.text = project.project?.name
            if project.status == "in_progress" {
                view.percentage.text = String("🕙")
            }else if project.status == "creating_group" {
                view.percentage.text = String("👨‍👩‍👧‍👧")
            }else {
                view.percentage.text = String("\(project.final_mark)%")
            }
            if project.validated == true {
                view.percentage.textColor = UIColor.flatGreen()
            }else {
                view.percentage.textColor = UIColor.flatRed()
            }
        }
        
        return view
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
