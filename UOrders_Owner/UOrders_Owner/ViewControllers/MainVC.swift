//
//  ViewController.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/11/15.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var cafeNameLabel: UILabel!
    @IBOutlet weak var cafeLoactionLabel: UILabel!
    
    @IBOutlet weak var orderManageButton: UIView!
    @IBOutlet weak var storeManageButton: UIView!
    
    @IBOutlet weak var orderManageHighlight: UIView!
    @IBOutlet weak var storeManageHighlight: UIView!
    
    @IBOutlet weak var orderManageView: UIView!
    @IBOutlet weak var storeManageView: UIView!
    
    @IBOutlet weak var myPageButton: UIImageView!
    
    var cafeNameAndLocation : CafeDataResult!
    
    override func viewDidLoad() {
        print("Main")
        super.viewDidLoad()
        
        MainService.shared.getCafeNameAndLocation() {
            result in
            switch result {
            case .success(let successData) :
                print("getCafeNameAndLocation success")
                guard successData.self != nil else { return }
                self.cafeNameAndLocation = successData
                self.cafeNameLabel.text = self.cafeNameAndLocation.data.cafeName
                self.cafeLoactionLabel.text = self.cafeNameAndLocation.data.cafeLocation
                
            case .failure(let error) :
                print("getCafeNameAndLocation error ", error)
                
            }
        }
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(goMyPageAction))
        myPageButton.addGestureRecognizer(tapGestureRecognizer)
        myPageButton.isUserInteractionEnabled = true

        orderManageView.isHidden = false
        storeManageView.isHidden = true
        
        orderManageHighlight.backgroundColor = UIColor(red: 229/255, green: 176/255, blue: 0/255, alpha: 100)
        storeManageHighlight.backgroundColor = UIColor(red: 219/255, green: 219/255, blue: 219/255, alpha: 100)
    }
    
    @objc func goMyPageAction(sender : UITapGestureRecognizer) {
        let myPageStoryboard = UIStoryboard(name: "MyPage", bundle: nil)
        let vc = myPageStoryboard.instantiateInitialViewController()
        self.present(vc!, animated: false, completion: nil)
    }
    
    @IBAction func orderManageTap(_ sender: UIGestureRecognizer) {
        orderManageView.isHidden = false
        storeManageView.isHidden = true
        orderManageHighlight.backgroundColor = UIColor(red: 229/255, green: 176/255, blue: 0/255, alpha: 100)
        storeManageHighlight.backgroundColor = UIColor(red: 219/255, green: 219/255, blue: 219/255, alpha: 100)
    }

    @IBAction func storeManageTap(_ sender : UIGestureRecognizer){
        orderManageView.isHidden = true
        storeManageView.isHidden = false
        orderManageHighlight.backgroundColor = UIColor(red: 219/255, green: 219/255, blue: 219/255, alpha: 100)
        storeManageHighlight.backgroundColor = UIColor(red: 229/255, green: 176/255, blue: 0/255, alpha: 100)
    }
    
    
}

