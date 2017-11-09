//
//  InProgressViewController.swift
//  Swifty Companion
//
//  Created by Junius LEKGWARA on 2017/11/06.
//  Copyright © 2017 Junius Lekgwara. All rights reserved.
//

import UIKit

class InProgressViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var inProgressTableView: UITableView!
    
    @IBOutlet weak var noProjects: UILabel!
    var in_progress = Array<ProjectsUser>()
    var showLabel: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let table = UINib(nibName: "ProjectsTableViewCell", bundle: nil)
        inProgressTableView.register(table, forCellReuseIdentifier: "projectsTableViewCell")
        
        // check if there are projects in progress
        if showLabel {
            inProgressTableView.isHidden = true
            noProjects.isHidden = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor.flatYellowColorDark()
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
        // bottom tab bar
        self.tabBarController?.tabBar.tintColor = UIColor.flatYellowColorDark()
        self.tabBarController?.tabBar.barTintColor = UIColor.white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return in_progress.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "projectsTableViewCell", for: indexPath) as! ProjectsTableViewCell
        cell.projectName.text = in_progress[indexPath.row].project?.name
        cell.backgroundColor = UIColor.flatYellowColorDark()
        cell.marks.text = String("🕙")
        return cell
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
