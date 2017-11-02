//
//  SecondViewController.swift
//  Swifty Companion
//
//  Created by Junius Lekgwara on 2017/11/01.
//  Copyright © 2017 Junius Lekgwara. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    // remove me
    var studentInfo = Student()
    var studentArray = Array<Student>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        studentArray = Array<Student>()
        studentArray.append(studentInfo)
        print(studentArray.count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
