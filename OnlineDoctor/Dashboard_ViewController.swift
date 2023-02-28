

import UIKit
import Alamofire

class Dashboard_ViewController: UIViewController {

    @IBOutlet weak var specialist: UILabel!
    @IBOutlet weak var docName: UILabel!
    @IBOutlet weak var docFee: UILabel!
    @IBOutlet weak var myCutomView: UIView!

    @IBOutlet weak var records: UIButton!
    @IBAction func profileBtn(_ sender: UIButton) {
    }
    @IBOutlet weak var hamside: UIView!
    @IBOutlet weak var about: UIButton!

    @IBOutlet weak var message: UIButton!
    
    @IBAction func record(_ sender: Any) {
    }
    
    @IBAction func about(_ sender: Any) {
    }
    
    @IBOutlet weak var logout: UIButton!
    @IBAction func hamMeueBtn(_ sender: UIButton) {
     
        if menueIsShowing {
             var frame = hamside.frame
             frame.size.width = 0
             hamside.frame = frame
             menueIsShowing = false
     
     
            profile.isHidden = true;
            logout.isHidden = true;
            about.isHidden = true;
            records.isHidden = true;
            message.isHidden = true
         } else {
             var frame = hamside.frame
             frame.size.width = 150
             hamside.frame = frame
             menueIsShowing = true
            
             
            profile.isHidden = false;
            logout.isHidden = false;
            about.isHidden = false;
      
            message.isHidden = false;
            
            records.isHidden = false;
            
         }
        
        
        
    }
    
    @IBOutlet weak var profile: UIButton!
    @IBOutlet weak var patientName: UILabel!

    var menueIsShowing = false;
    var data: String?;
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        if let safeData = data {
            patientName.text = "Welcome, \(safeData)"
        } else {
            patientName.text = "Welcome, guest";
        }
     
        var frame = hamside.frame;
        frame.size.width = 0;
        hamside.frame = frame;
        profile.isHidden = true;
        logout.isHidden = true;
        about.isHidden = true;
        records.isHidden = true;
        message.isHidden = true
  
       
    }
    var doctorDetails = [Doctor]()

    struct Doctor: Decodable {
        let DocName: String
        let DocFee: Double
        let DocSpeciality: String
    }

    
    
  
    




}
    
    
    


//88
