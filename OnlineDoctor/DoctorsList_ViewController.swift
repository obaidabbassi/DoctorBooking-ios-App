
import UIKit
import Alamofire
class DoctorsList_ViewController: UIViewController {
    @IBOutlet weak var TableViewLbl: UITableView!
    
    var doctors = [(name: String, fee: Int, speciality: String,id:String)]()

    override func viewDidLoad() {
        super.viewDidLoad()

     fetchDoctors()
    }
    

    func fetchDoctors() {
            let url = "http://192.168.88.128/api/fetchDoctors.php"
            


       AF.request(url).responseJSON { (response) in
            if let jsonData = response.data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [[String: Any]] {
                        for doctor in json {
                            
                            let id = doctor["DocID"] as? String ?? ""
                            let name = doctor["DocName"] as? String ?? ""
                            let fee = doctor["DocFee"] as? String ?? ""
                            let speciality = doctor["DocSpeciality"] as? String ?? ""
                            if let feeInt = Int(fee) {
                                self.doctors.append((name: name, fee: feeInt, speciality: speciality,id: id))
                               }
                            print("Doctor Name: \(name)")
                            print("Doctor Fee: \(fee)")
                            print("Doctor Speciality: \(speciality)")
                            print("Doctor ID: \(id)")
                        }
                        self.TableViewLbl.reloadData()
                    }
                } catch let error {
                    print(error)
                }
            }
        }

        
    }
        
        
        
}







extension DoctorsList_ViewController: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctors.count
    }
    

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                let doctor = doctors[indexPath.row]
                cell.textLabel?.text = doctor.name
                cell.detailTextLabel?.text = "\(doctor.fee) | \(doctor.speciality)"
                return cell
    }

 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
        let selectedDoctor = doctors[indexPath.row]
        print("Selected Doctor: \(selectedDoctor.name)")
        

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ParticularDoctor") as! ParticularDoctor_ViewController
        viewController.selectedDoctor = selectedDoctor
        present(viewController, animated: true, completion: nil)
        

    }

    
    

    
    
    
    
    
    
}
