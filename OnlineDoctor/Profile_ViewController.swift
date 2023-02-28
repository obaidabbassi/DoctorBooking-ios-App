//
//  Profile_ViewController.swift
//  OnlineDoctor
//
//  Created by macos on 02/02/23.
//

import UIKit

class Profile_ViewController: UIViewController {
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var pro: UILabel!
    
    let username = UserDefaults.standard.string(forKey: "Username")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLbl.text = username

    }
    


}
