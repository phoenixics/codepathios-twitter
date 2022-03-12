//
//  LoginViewController.swift
//  Twitter
//
//  Created by Star Wong on 3/11/22.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    // action - this will run everytime user taps a button
    @IBAction func onLoginButton(_ sender: Any) {
        
        let myUrl = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client!.login(url: myUrl) {
            
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        } failure: { Error in
            print("Could not login.")
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
