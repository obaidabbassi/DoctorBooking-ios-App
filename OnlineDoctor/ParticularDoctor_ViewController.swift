//
//  ParticularDoctor_ViewController.swift
//  OnlineDoctor
//
//  Created by macos on 08/02/23.
//

import UIKit
import Alamofire
class ParticularDoctor_ViewController: UIViewController {
    

    @IBAction func checkStatusBtn(_ sender: Any) {

             
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Messages_ViewController") as! Messages_ViewController
        viewController.status = "appointment confirmed.."
        present(viewController, animated: true, completion: nil)
        

    }
    @IBOutlet weak var successLbl: UILabel!
    
    @IBOutlet weak var viewLbl: UIView!
    



    @IBAction func BookAction(_ sender: UIButton) {
      
        Booking()
    }
    @IBOutlet weak var doctorSpecialistLable: UILabel!;
    @IBOutlet weak var doctorFeeLable: UILabel!;
    @IBOutlet weak var doctorNameLable: UILabel!;
    
    var selectedDoctor: (name: String, fee: Int, speciality: String,id: String) = ("", 0, "","")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewLbl.isHidden = true;
        successLbl.isHidden = true;
        
        
        doctorNameLable.text = selectedDoctor.name
        doctorFeeLable.text = "\(selectedDoctor.fee)"
        doctorSpecialistLable.text = selectedDoctor.speciality
        print("doctor id is \(selectedDoctor.id)")
        let userID = UserDefaults.standard.string(forKey: "userID");
        
        
        if let PatientID = userID{
       
            print((PatientID))
        }
        
   

    }
    

    
    func Booking() -> Void {
        
        
     
        let userID = UserDefaults.standard.string(forKey: "userID")
        if let patientID = userID {
            
     

            let parameters: Parameters = [
                "patientID": patientID.trimmingCharacters(in: .whitespacesAndNewlines),
                "doctorID": selectedDoctor.id,
                "doctorName": selectedDoctor.name,
                "doctorSpeciality": selectedDoctor.speciality
            ]
  
            
        print(parameters)
            let url = "http://192.168.88.128/api/Booking.php";
            AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default)
                               .responseData { response in
                                   switch response.result {
                                   case .success:
                                    print("Data Inserted Successfully");
                                    self.viewLbl.isHidden = false;
                                    self.successLbl.isHidden = false;
                                   case .failure:
                                    print("error");
                                   
                                   }
                           }
        }

  
    
        
        
        
        
}
    func hide() ->Void {
        
        successLbl.isHidden = true;
        viewLbl.isHidden = true;

    }


    
    
}
