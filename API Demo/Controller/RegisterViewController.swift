//
//  RegisterViewController.swift
//  API Demo
//
//  Created by Sikandar Ali on 25/08/2021.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var nametxt    :UITextField!
    @IBOutlet weak var emailtxt   :UITextField!
    @IBOutlet weak var passwordtxt:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func Register(_ sender :UIButton){
        guard let fname   = self.nametxt.text     else {  return }
        guard let email   = self.emailtxt.text    else {  return }
        guard let pwd     = self.passwordtxt.text else {  return }
        let registerme = RegisterModel(name: fname, email: email, password: pwd)
        APIManager.shared.callingRegisterAPI(register: registerme){
            isSuccues in
            if isSuccues {
                let alert = UIAlertController(title: "Alert", message: "Thanks you for Registration", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                let vf = self.storyboard?.instantiateViewController(withIdentifier: "welcome") as? welcomeViewController
                self.present(vf!, animated: true, completion: nil)
            }else{
                let alert = UIAlertController(title: "Alert", message: "Please make sure You have typed perfect data", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
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
