//
//  Patient_Registration_ViewController.swift
//  OnlineDoctor
//
//  Created by macos on 29/01/23.
//

import UIKit
import Alamofire
class Patient_Registration_ViewController: UIViewController {

    @IBAction func PRegisterAction(_ sender: UIButton) {
        
        registerPatient()
        
        
    }
    @IBOutlet weak var patientName: UITextField!
    
    @IBOutlet weak var patientPassword: UITextField!
    
    @IBOutlet weak var patientEmail: UITextField!
    
    @IBOutlet weak var patientPhone: UITextField!
    
    @IBOutlet weak var patientAge: UITextField!
    
    @IBOutlet weak var successLbl: UILabel!
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    func registerPatient() ->Void{
       
        
        
 
        let parameters: [String: Any] = ["username": patientName.text!, "email": patientEmail.text!, "password": patientPassword.text!, "phone": patientPhone.text!, "age": patientAge.text!];

        let url = "http://192.168.88.128/api/patientRegister.php";

        
        
   
        
        
        
        
        
        
        
        AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default)
                    .responseData { response in
                        switch response.result {
                        case .success:
                            print("Data Inserted Successfully")
                            self.successLbl.text = "Data successfully inserted";
                        case .failure(let error):
                            print("Data Insertion Failed with error: \(error)");
                           
                            self.successLbl.textColor = .red;
                            self.successLbl.text = "Failed to insert";
                        }
                }

        
        
        
    }
   

}
