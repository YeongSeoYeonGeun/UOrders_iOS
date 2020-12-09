//
//  EditCafeInfoVC.swift
//  UOrders_Owner
//
//  Created by 양시연 on 2020/12/08.
//

import UIKit

class EditCafeInfoVC: UIViewController {
    
    @IBOutlet weak var cafeNameTextField: UITextField!
    @IBOutlet weak var cafeLocationTextField: UITextField!
    
    @IBAction func clickBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clickDoneButton(_ sender: Any) {
        // todo: 통신
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        // todo: 통신해서 data 받아오기
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
