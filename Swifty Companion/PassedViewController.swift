//
//  PassedViewController.swift
//  Swifty Companion
//
//  Created by Junius LEKGWARA on 2017/11/06.
//  Copyright © 2017 Junius Lekgwara. All rights reserved.
//

import UIKit

class PassedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var passedTableView: UITableView!
    
    var validated_projects = Array<ProjectsUser>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let table = UINib(nibName: "ProjectsTableViewCell", bundle: nil)
        passedTableView.register(table, forCellReuseIdentifier: "projectsTableViewCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return validated_projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "projectsTableViewCell", for: indexPath) as! ProjectsTableViewCell
        cell.projectName.text = validated_projects[indexPath.row].project?.name
        cell.marks.text = String(validated_projects[indexPath.row].final_mark)
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