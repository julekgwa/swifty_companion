//
//  SecondViewController.swift
//  Swifty Companion
//
//  Created by Junius Lekgwara on 2017/11/01.
//  Copyright © 2017 Junius Lekgwara. All rights reserved.
//

import UIKit
import SDWebImage

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {

    // remove me
    var studentInfo = Student()
    var studentArray = Array<Student>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//      var iter = 0
//        while iter < studentInfo.studentSkills.count {
//            print(studentInfo.studentSkills[iter].description())
//            iter = iter + 1
//        }
        studentArray.removeAll()
        studentArray.append(studentInfo)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        
        cell.fullName.text = "\(studentArray[indexPath.row].first_name) \(studentArray[indexPath.row].last_name.uppercased())"
        cell.username.text = studentArray[indexPath.row].login
        cell.email.text = studentArray[indexPath.row].email
        cell.wallet.text = "Wallet: \(studentArray[indexPath.row].wallet)"
        let level : Double = studentArray[indexPath.row].cursus_users[indexPath.row].level
        cell.progressBar.setProgress(0.0, animated: true)
        let percentage = level.truncatingRemainder(dividingBy: 1)
        cell.progressBar.setProgress(Float(percentage), animated: true)
        cell.progressBar.progress = Float(percentage)
        cell.level.text = "Level: \(level)"
        cell.corrections.text = "Correction Points: \(studentArray[indexPath.row].correction_point)"
        cell.profilePic.sd_setImage(with: URL(string: studentArray[indexPath.row].image_url), placeholderImage: UIImage(named: "placeholder.png"))
        cell.profilePic.layer.cornerRadius = cell.profilePic.frame.size.width / 2
        cell.profilePic.clipsToBounds = true
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return studentArray[0].cursus_users[0].skills.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let view = collectionView.dequeueReusableCell(withReuseIdentifier: "skills", for: indexPath) as! SkillsCollectionViewCell
        
        view.skillName.text = studentArray[0].cursus_users[0].skills[indexPath.row].name
        view.skillLevel.text = String(studentArray[0].cursus_users[0].skills[indexPath.row].level)
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
