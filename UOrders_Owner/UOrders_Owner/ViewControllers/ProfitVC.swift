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
    
    
    var profitData : Profit!
    
    override func viewWillAppear(_ animated: Bool) {
        setData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        // Do any additional setup after loading the view.
    }
    
    func setData(){
        
        ProfitService.shared.getProfitData(ownerIndex: "1", cafeIndex: "13") {
            result in
            switch result {
            case .success(let successData) :
                guard successData.self != nil  else { return }
                self.profitData = successData.data
                
                self.dataBinding()
                
            case .failure(let error) :
                print("getProfitData Error ", error)
            }
        }
       
    }
    
    func dataBinding(){
        
        self.cafeNameLabel.text = "매장 이름 : " + self.profitData.cafeName
        self.ownerNameLabel.text = "사업자 : " + self.profitData.ownerName
        self.ownerNumberLabel.text = "사업자 번호 : " + self.profitData.businessNumber
        
        self.monthLabel.text = String(self.profitData.revenueInfo[0].month) + "월 수익 내역"
        self.amountLabel.text = String(self.profitData.revenueInfo[0].revenue) + " 원"
        
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
