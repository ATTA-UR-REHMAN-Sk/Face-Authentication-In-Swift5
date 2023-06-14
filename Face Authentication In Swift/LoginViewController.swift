//
//  ViewController.swift
//  Face Authentication In Swift
//
//  Created by apple on 12/06/2023.
//

import UIKit
import LocalAuthentication

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginbtn: UIButton!
    
    @IBOutlet weak var imgviewSet: UIImageView!
    var context = LAContext()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginbtn.layer.cornerRadius = 20
        imgviewSet.layer.cornerRadius = 20
        
        context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
        if loginbtn.titleLabel?.text == "Login"{
            context = LAContext()
            var error : NSError?
            if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error){
                let reason = "Login into the App.."
                context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { (success, error) in
                    if success {
                        DispatchQueue.main.async {
                            //self.loginbtn.setTitle("Logout", for: .normal)
                            let vc  = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
                            
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                    }else {
                        print("ERROR : \(error?.localizedDescription ?? "")")
                    }
                }
                
            }else {
                print("Error : \(error?.localizedDescription ?? "Nothing Found")")
            }
        }else {
            print("You had Already Login")
        }
    }
}

