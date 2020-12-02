//
//  LoginVC.swift
//  UOrders_Owner
//
//  Created by 양시연 on 2020/12/02.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var autoLoginCheckBoxView: UIView!
    @IBOutlet weak var autoLoginLabel: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.layer.cornerRadius = 4
    }
    
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {

        print("id : " + idTextField.text!)
        print("password : " + passwordTextField.text!)
        // Todo: 통신
        
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
