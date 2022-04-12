//
//  RegisterVC.swift
//  Lesson15
//
//  Created by SAN10 on 3/16/22.
//

import UIKit
import Toast_Swift
import Firebase
import FirebaseAuth
import FirebaseDatabase
class RegisterVC: BaseViewController {

    @IBOutlet weak var btRegister: UIButton!
    @IBOutlet weak var tfConfirmPw: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        roundCorner(views: [btRegister], radius: 10)
        
    }
    
    @IBAction func tapOnRegister(_ sender: Any) {
        view.endEditing(true)
        startAnimating()
        if tfEmail.text == ""{
            self.view.makeToast("Please enter email!!!")
        
        stopAnimating()
        return
        }
        if tfPassword.text == ""{
            self.view.makeToast("Pls enter  password")
            stopAnimating()
            return
        }
        if tfConfirmPw.text == "" {
            self.view.makeToast("pls enter confirm confirm password !")
            stopAnimating()
            return
        }
        
        if tfPassword.text != tfConfirmPw.text {
            self.view.makeToast("password not match")
            stopAnimating()
            return
        }
        
        //REGISTER USER
        Auth.auth().createUser(withEmail: tfEmail.text!, password: tfPassword.text!) { result, error in
            if error != nil {
                self.view.makeToast(error!.localizedDescription)
                self.stopAnimating()
            }else {
                if let data = result {
                    print(data.user.email!)
                    print(data.user.uid)
                    
                    //POST DATA
                    let idUser = data.user.uid
                    let databaseReference = Database.database().reference()
                    let value = ["email": data.user.email, "id" : idUser]
                    databaseReference.child("Users").child(idUser).setValue(value)
                }
               
                
                
                self.view.makeToast("you have register successfully!!!")
                self.stopAnimating()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.dismiss(animated: true, completion: nil)
                }
            }
            
        }
        
    }
    

}
