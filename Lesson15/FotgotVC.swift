//
//  FotgotVC.swift
//  Lesson15
//
//  Created by SAN10 on 3/25/22.
//

import UIKit
import Firebase
import FirebaseAuth
class FotgotVC: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func tapOnSendeMail(_ sender: Any) {
        Auth.auth().sendPasswordReset(withEmail: tfEmail.text!) { error  in
            if error != nil {
                self.view.makeToast(error?.localizedDescription)
                
            }
            else {
                self.view.makeToast("send successfully")
            
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    
}
