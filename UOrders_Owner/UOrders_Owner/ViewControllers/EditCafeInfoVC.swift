//
//  EditCafeInfoVC.swift
//  UOrders_Owner
//
//  Created by 양시연 on 2020/12/08.
//

import UIKit

protocol EditCafeInfoDelegate: class {
  func edit()
}

class EditCafeInfoVC: UIViewController {
    
    var del: EditCafeInfoDelegate?
    
    @IBOutlet weak var cafeNameTextField: UITextField!
    @IBOutlet weak var cafeLocationTextField: UITextField!
    
    @IBAction func clickBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clickDoneButton(_ sender: Any) {
        postData()
    }
    
    // data
    var myPageData : MyPage!
   
    
    
    override func viewWillAppear(_ animated: Bool) {
        setData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setData(){
        
        MyPageService.shared.getMyPage(ownerIndex: "1", cafeIndex: "13") {
            result in
            switch result {
            case .success(let successData) :
                guard successData.self != nil  else { return }
                self.myPageData = successData.data
                
                self.dataBiding()
                
            case .failure(let error) :
                print("getMyPage Error ", error)
            }
        }
       
    }
    
    func postData(){
        
        let name = self.cafeNameTextField.text
        let location = self.cafeLocationTextField.text
        let editedCafeInfo = EditedCafeInfo(cafeName: name!, cafeLocation: location!)
        
        EditCafeInfoService.shared.editCafeInfo(ownerIndex: "1", cafeIndex: "13", editedCafeInfo: editedCafeInfo) {
            result in
            switch result {
            case .success(let successData) :
                guard successData.self != nil  else { return }
                self.del?.edit()
                self.dismiss(animated: false, completion: nil)
                
            case .failure(let error) :
                print("getMyPage Error ", error)
            }
        }
    }
    
    func dataBiding(){
        self.cafeNameTextField.text = myPageData.cafeInfo.cafeName
        self.cafeLocationTextField.text = myPageData.cafeInfo.cafeLocation
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
