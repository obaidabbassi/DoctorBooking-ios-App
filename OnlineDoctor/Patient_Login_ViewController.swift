//
//  Patient_Login_ViewController.swift
//  OnlineDoctor
//
//  Created by macos on 29/01/23.
//

import UIKit
import Alamofire

class Patient_Login_ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var successLbl: UILabel!
 
    
    @IBAction func loginAction(_ sender: UIButton) {

        isValidUser();
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func isValidUser() -> Void{
//        /192.168.88.128
       
        let parameters: [String: Any] = ["email": email.text!, "password": password.text!]

        AF.request("http://192.168.88.128/api/checkValidPatient.php", method: .post, parameters: parameters, encoding: URLEncoding.default)
            .responseString { response in
                switch response.result {
             
                case .success:
                    if response.value!.contains("OK") {
                        
                        let responseString = response.value!
                               let parts = responseString.components(separatedBy: "OK_")
                        if parts.count > 1 && parts[1].count > 0 {
                                 let id = parts[1]
                                 print("login correct, user ID: \(id)")
                                 // Store the user ID for later use
                            
                            UserDefaults.standard.set(id, forKey: "userID")

                            
                            
                             }
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let dashboardVC = storyboard.instantiateViewController(withIdentifier: "Dashboard_ViewController") as! Dashboard_ViewController
                        dashboardVC.data = self.email.text;
                        self.present(dashboardVC, animated: true, completion: nil)

                        UserDefaults.standard.set(self.email.text, forKey: "Username")
                        
                        
                        
                        
                    } else {
                        print(response);
                        self.successLbl.textColor = .red
                        self.successLbl.text = "Invalid login credentials."
                    }
                case .failure(let error):
                    print("error: \(error)")
                }
        }

                                
                                
                                
                            
                     }
        
    
    
    
    
    
    }

