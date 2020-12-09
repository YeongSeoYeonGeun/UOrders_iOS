//
//  MyPageVC.swift
//  UOrders_Owner
//
//  Created by 양시연 on 2020/12/02.
//

import UIKit

class MyPageVC: UIViewController {
    
    @IBOutlet weak var cafeImageBorderView: UIView!
    @IBOutlet weak var cafeImageView: UIImageView!
    @IBOutlet weak var cafeNameLabel: UILabel!
    @IBOutlet weak var cafeLocationLabel: UILabel!
    
    @IBOutlet weak var profitCheckView: UIView!
    
    @IBAction func clickCafeInfoEdit(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "editCafeInfoVC") as! EditCafeInfoVC
        
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func goProfit(sender:UIGestureRecognizer){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "profitVC") as! ProfitVC

        self.present(vc, animated: true, completion: nil)
        
    }
    
    // data
    var myPageData : MyPage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MyPageService.shared.getMyPage(ownerIndex: "1", cafeIndex: "13") {
            result in
            switch result {
            case .success(let successData) :
                guard successData.self != nil  else { return }
                self.myPageData = successData.data
                
                print(self.myPageData)
                
            case .failure(let error) :
                print("getOrderList Error ", error)
            }
        }
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(MyPageVC.goProfit))
        self.profitCheckView.addGestureRecognizer(gesture)
        
        setView()
    }
    
  

    func setView(){
        // profile 동그랗게
        cafeImageBorderView.layer.cornerRadius =        cafeImageView.frame.height/2
        cafeImageView.layer.cornerRadius =        cafeImageView.frame.height/2
        cafeImageView.layer.borderWidth = 1
        cafeImageView.layer.borderColor = UIColor.clear.cgColor
        cafeImageView.clipsToBounds = true
        
        // 수익내역 radius, 그림자
        profitCheckView.layer.cornerRadius = 20
        profitCheckView.layer.shadowColor = UIColor.black.cgColor
        profitCheckView.layer.masksToBounds = false
        profitCheckView.layer.shadowOffset = CGSize(width: 0, height: 4)
        profitCheckView.layer.shadowRadius = 8
        profitCheckView.layer.shadowOpacity = 0.16
        
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
