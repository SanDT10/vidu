//
//  ViewController.swift
//  Lesson15
//
//  Created by SAN10 on 3/13/22.
//

import UIKit
import Toast_Swift
import Firebase
import FirebaseAuth
import FirebaseDatabase
class ViewController: BaseViewController {

    @IBOutlet weak var btForgot: UIButton!
    @IBOutlet weak var btRegister: UIButton!
    @IBOutlet weak var btLogin: UIButton!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var tfEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        roundCorner(views: [btLogin,btRegister,btForgot], radius: 10)
       //startAnimating()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        stopAnimating()
    }

    @IBAction func tapOnLogin(_ sender: Any) {
        view.endEditing(true)
        startAnimating()
        if tfEmail.text == "" {
            self.view.makeToast("pls enter email")
            self.stopAnimating()
            return
        }
        if tfPassword.text == "" {
            self.view.makeToast("pls enter password")
            self.stopAnimating()
            return
        }
        // CALL SIGNIN FUNCTION
        Auth.auth().signIn(withEmail: tfEmail.text!, password: tfPassword.text!) { result , error in
            if error != nil {
                self.view.makeToast(error?.localizedDescription)
                self.stopAnimating()
            }else {
               let vc = HomeVC(nibName: "HomeVC", bundle: nil)
                vc.modalTransitionStyle = .flipHorizontal
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func tapOnForgot(_ sender: Any) {
        let vc = FotgotVC(nibName: "FotgotVC", bundle: nil)
        present(vc, animated: true, completion: nil)
}

}
