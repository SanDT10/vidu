//
//  HomeVC.swift
//  Lesson15
//
//  Created by SAN10 on 3/18/22.
//

import UIKit
import Firebase
import FirebaseDatabase
class HomeVC: BaseViewController {
    var arrUser = [User]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableView()
        getDataFromFireBase()
    }
    
    func getDataFromFireBase(){
        let databaseReference = Database.database().reference()
        databaseReference.child("Users").observe(.childAdded) { snapshot in
            databaseReference.child("Users").child(snapshot.key).observe(.value) { data  in
                dump(data.value)
                if let dict =  data.value as? [String : Any]{
                    let user = User(dict: dict)
                    self.arrUser.append(user)
                    self.tableView.reloadData()
                    
                }
            }
        }
    }


    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
  let nib = UINib(nibName: "UserCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "userCell")
    }

 
    @IBAction func tapOnLogout(_ sender: Any) {
        try? Auth.auth().signOut()
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginVC")
        dismiss(animated: true)
       
    }
}

extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as! UserCell
        let user = arrUser[indexPath.row]
        cell.lbTitle.text = user.id
        cell.lbSub.text = user.email
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
    
    
}
