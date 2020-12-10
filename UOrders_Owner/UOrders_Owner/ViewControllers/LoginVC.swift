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
        
        let id = self.idTextField.text!
        let pw = self.passwordTextField.text!
        let loginData = LoginData(ownerId: id, ownerPw: pw, deviceToken: "")
        
        LoginService.shared.login(loginData: loginData) {
            result in
            switch result {
            case .success(let successData) :
                guard successData.self != nil  else { return }
                self.dismiss(animated: false, completion: nil)
                print("로그인 성공!")
                self.goMainVC()
                
                
                
            case .failure(let error) :
                print("login Error ", error)
            }
        }
        
    }
    
    func goMainVC(){
        let storyboard = UIStoryboard(name:"Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "Main")
        vc.modalPresentationStyle = .fullScreen
                
        self.present(vc, animated: true, completion: nil)
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
