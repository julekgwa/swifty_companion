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

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    // app constant 
    let CLIENT_ID = "8383f6623925fb65ea043331f7da34028a8a4261e5218f5fe5ba7d5d0397fb54"
    let CLIENT_SECRET = "743967a026896fbee7a2b6c60851e6e597e2e06e5ee60048607a5727d25068ad"
    let TOKEN_URL = "https://api.intra.42.fr/oauth/token"
    let API_URL = "https://api.intra.42.fr/v2/"
    
    // access token
    var access_token = ""
    
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
            if response.result.isSuccess {
                let token : JSON = JSON(response.result.value!)
                self.access_token = token["access_token"].string!
            }
            // dismiss progress HUD
            SVProgressHUD.dismiss()
        }
    }


    @IBAction func showDetailsBtn(_ sender: Any) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
}

