//
//  ViewController.swift
//  Swifty Companion
//
//  Created by Junius Lekgwara on 2017/10/31.
//  Copyright © 2017 Junius Lekgwara. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

enum AlertType {
    case LoginEmpty
    case TokenError
}

class ViewController: UIViewController {

    // outlets
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchView: UIView!
    
    // app constant 
    let CLIENT_ID = "8383f6623925fb65ea043331f7da34028a8a4261e5218f5fe5ba7d5d0397fb54"
    let CLIENT_SECRET = "743967a026896fbee7a2b6c60851e6e597e2e06e5ee60048607a5727d25068ad"
    let TOKEN_URL = "https://api.intra.42.fr/oauth/token"
    let API_URL = "https://api.intra.42.fr/v2/"
    
    // access token
    var access_token = ""
    var studentInfo = Student()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // get and set access token
        getToken()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getToken() {
        // show progress HUD
        SVProgressHUD.show()
        let parameters: Parameters = ["grant_type": "client_credentials", "client_id": CLIENT_ID, "client_secret": CLIENT_SECRET]
        Alamofire.request(TOKEN_URL, method: .post, parameters: parameters).responseJSON { response in
            SVProgressHUD.dismiss()
            if response.result.isSuccess {
                let token : JSON = JSON(response.result.value!)
                self.access_token = token["access_token"].string!
                 self.searchView.isHidden = false
            } else if response.result.isFailure {
                self.showAlert(title: "Token Error", msg: "Unable to get token", alertType: .TokenError)
            }
        }
    }
    
    func isValid(str: String) -> Bool {
        if str.characters.count > 0 {
            return true
        }
        return false
    }


    @IBAction func showDetailsBtn(_ sender: Any) {
//        performSegue(withIdentifier: "showDetails", sender: self)
        SVProgressHUD.show()
        guard let login : String = searchTextField.text?.trim(), isValid(str: login) else {
            SVProgressHUD.dismiss()
            showAlert(title: "No Login", msg: "Login can't be empty", alertType: .LoginEmpty)
            return }
        let parameters: Parameters = ["access_token": access_token]
        searchView.isHidden = true
        Alamofire.request("\(API_URL)users/\(login)", method: .get, parameters: parameters).responseJSON { response in
            SVProgressHUD.dismiss()
            self.searchView.isHidden = false
            if ((response.result.value) != nil) {
                let student = Student()
                
                let swifty = JSON(response.result.value!)
                guard swifty.count != 0 else {
                    SVProgressHUD.showError(withStatus: "Unable to find login")
                    return
                }
                
                if let resData = swifty["projects_users"].arrayObject {
                    let data = resData as! [[String: AnyObject]]
                    student.setProjectsUsers(data: data)
                }
                
                if let resData = swifty["campus_users"].arrayObject {
                    let data = resData as! [[String: AnyObject]]
                    student.setCampusUsers(data: data)
                }
                
                if let resData = swifty["languages_users"].arrayObject {
                    let data = resData as! [[String: AnyObject]]
                    student.setLanguagesUsers(data: data)
                }
                
                if let resData = swifty["expertises_users"].arrayObject {
                    let data = resData as! [[String: AnyObject]]
                    student.setExpertisesUsers(data: data)
                }
                
                if let resData = swifty["cursus_users"].arrayObject {
                    let data = resData as! [[String: AnyObject]]
                    student.setCursusUsers(data: data)
                }
                
                if let resData = swifty["campus"].arrayObject {
                    let data = resData as! [[String: AnyObject]]
                    student.setCampus(data: data)
                }
                
                if let resData = swifty["correction_point"].int {
                    student.correction_point = resData
                }
                
                if let resData = swifty["pool_month"].string {
                    student.pool_month = resData
                }
                
                if let resData = swifty["displayname"].string {
                    student.displayname = resData
                }
                
                if let resData = swifty["last_name"].string {
                    student.last_name = resData
                }
                
                if let resData = swifty["image_url"].string {
                    student.image_url = resData
                }
                
                if let resData = swifty["url"].string {
                    student.url = resData
                }
                
                if let resData = swifty["email"].string {
                    student.email = resData
                }
                
                if let resData = swifty["pool_year"].string {
                    student.pool_year = resData
                }
                
                if let resData = swifty["wallet"].int {
                    student.wallet = resData
                }
                
                if let resData = swifty["login"].string {
                    student.login = resData
                }
                
                if let resData = swifty["staff?"].bool {
                    student.staff = resData
                }
                
                if let resData = swifty["first_name"].string {
                    student.first_name = resData
                }
                
                self.studentInfo = student
                
                self.searchTextField.text = ""
                self.performSegue(withIdentifier: "studentInfo", sender: self)
            }else {
                self.showAlert(title: "Search Error", msg: "Unable to complete your request", alertType: .LoginEmpty)
            }
            
        }

    }
    
    func showAlert(title: String, msg: String, alertType: AlertType) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        if case alertType = AlertType.LoginEmpty {
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
                (action) in
                alert.dismiss(animated: true, completion: nil)
            }))
        } else if case alertType = AlertType.TokenError {
            alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.default, handler: {
                (action) in
                self.getToken()
            }))
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: {
                (action) in
                alert.dismiss(animated: true, completion: nil)
            }))
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "studentInfo" {
            let barViewControllers = segue.destination as! UITabBarController
            let destinationViewController = barViewControllers.viewControllers?[0] as! StudentInfoViewController
            destinationViewController.studentInfo = studentInfo
            
            let failedVC = barViewControllers.viewControllers?[1] as! FailedViewController
            failedVC.failed_projects = studentInfo.failed_projects
            
            let in_progressVC = barViewControllers.viewControllers?[3] as! InProgressViewController
            in_progressVC.in_progress = studentInfo.in_progress
            
            let validatedVC = barViewControllers.viewControllers?[2] as! PassedViewController
            validatedVC.validated_projects = studentInfo.validated_projects
        }
    }
}

