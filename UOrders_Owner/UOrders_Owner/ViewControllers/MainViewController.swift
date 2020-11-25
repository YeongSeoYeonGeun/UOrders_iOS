//
//  ViewController.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/11/15.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var myPageButton: UIImageView!
    @IBOutlet weak var cafeNameLabel: UILabel!
    @IBOutlet weak var cafeLoactionLabel: UILabel!
    
    @IBOutlet weak var orderManageButton: UIView!
    @IBOutlet weak var storeManageButton: UIView!
    
    @IBOutlet weak var orderManageHighlight: UIView!
    @IBOutlet weak var storeManageHighlight: UIView!
    
    @IBOutlet weak var orderManageView: UIView!
    @IBOutlet weak var storeManageView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orderManageView.isHidden = false
        storeManageView.isHidden = true
        
        orderManageHighlight.backgroundColor = UIColor.orange
        storeManageHighlight.backgroundColor = UIColor.gray
    }
    
    @IBAction func orderManageTap(_ sender : UIGestureRecognizer){
        print("order tap touch")
        orderManageView.isHidden = false
        storeManageView.isHidden = true
        orderManageHighlight.backgroundColor = UIColor.orange
        storeManageHighlight.backgroundColor = UIColor.gray
    }
    
    @IBAction func storeManageTap(_ sender : UIGestureRecognizer){
        print("store tap touch")
        orderManageView.isHidden = true
        storeManageView.isHidden = false
        orderManageHighlight.backgroundColor = UIColor.gray
        storeManageHighlight.backgroundColor = UIColor.orange
    }
    


}

