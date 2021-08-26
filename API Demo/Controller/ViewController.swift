//
//  ViewController.swift
//  API Demo
//
//  Created by Sikandar Ali on 25/08/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emaillogin   :UITextField!
    @IBOutlet weak var passwordlogin:UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }
    @IBAction func login(_ sender:UIButton){
        guard let lemail   = self.emaillogin.text     else {  return }
        guard let lpwd     = self.passwordlogin.text    else {  return }
        let modellogin     = LoginModel(login: lemail, password:lpwd )
        APIManager.shared.callingLoginAPI(login: modellogin){
            (result) in
            switch result{
            case  .success(let jsondatas):
            print(jsondatas as AnyObject )
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "welcome") as! welcomeViewController
                self.present(vc, animated: true, completion: nil)
            case .failure(let eerr):
            print(eerr.localizedDescription)
        }
        }

    }
    
}

