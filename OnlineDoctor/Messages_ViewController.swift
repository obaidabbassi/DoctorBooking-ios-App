
import UIKit

class Messages_ViewController: UIViewController {
    var status: String = "";
    
    @IBOutlet weak var confirmationLbl: UILabel!
    
  

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        
        if !status.isEmpty {
            confirm()
          }
      
    }
   



    func confirm()-> Void{
        confirmationLbl.text = "Your appointment is confirmed.."
        confirmationLbl.textColor = UIColor.green
        confirmationLbl.isHidden = false;
        
    }
}
