//
//  ProfitVC.swift
//  UOrders_Owner
//
//  Created by 양시연 on 2020/12/03.
//

import UIKit

class ProfitVC: UIViewController {
    
    @IBOutlet weak var cafeNameLabel: UILabel!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var ownerNumberLabel: UILabel!
    
    @IBOutlet weak var profitContainerView: UIView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!

    @IBAction func cancelButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setView()
        // Do any additional setup after loading the view.
    }
    
    func setView(){
        // 수익내역 radius, 그림자
        profitContainerView.layer.cornerRadius = 14
        profitContainerView.layer.shadowColor = UIColor.black.cgColor
        profitContainerView.layer.masksToBounds = false
        profitContainerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        profitContainerView.layer.shadowRadius = 8
        profitContainerView.layer.shadowOpacity = 0.16
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
