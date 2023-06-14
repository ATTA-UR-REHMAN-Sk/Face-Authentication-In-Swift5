//
//  ProfileViewController.swift
//  Face Authentication In Swift
//
//  Created by apple on 13/06/2023.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var profileView: UIView!
    
    @IBOutlet weak var profileViewWidth: NSLayoutConstraint!
    
    @IBOutlet weak var ProfileImg: UIImageView!
    
    @IBOutlet weak var profileBtn: UIButton!
    
    
    @IBOutlet weak var proffii: UIImageView!
    
    
    @IBOutlet weak var logoutbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        profileViewWidth.constant = 0
        profileView.isHidden = true
        ProfileImg.layer.cornerRadius = 20
    }
    

    @IBAction func ProfileBtn(_ sender: UIButton) {
        profileViewWidth.constant = 183
        profileView.isHidden = false
        profileView.layer.cornerRadius = 10
        profileBtn.isHidden = true
        proffii.layer.cornerRadius = 30
        view.layer.isOpaque = true
        
    }
    
    
    @IBAction func logoutBtn(_ sender: UIButton) {
        profileViewWidth.constant = 0
        DispatchQueue.main.async {
            self.logoutbtn.setTitle("Logout", for: .normal)
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
}
