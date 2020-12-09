//
//  MyPageVC.swift
//  UOrders_Owner
//
//  Created by 양시연 on 2020/12/02.
//

import UIKit

class MyPageVC: UIViewController{
    
    @IBOutlet weak var cafeImageBorderView: UIView!
    @IBOutlet weak var cafeImageView: UIImageView!
    @IBOutlet weak var cafeNameLabel: UILabel!
    @IBOutlet weak var cafeLocationLabel: UILabel!
    
    @IBOutlet weak var profitCheckView: UIView!
    
    @IBOutlet weak var myPageOrderTableView: UITableView!
    

    @IBAction func clickBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
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
    var myPageOrderList : [TodayOrderInfo] = []
    
    override func viewWillAppear(_ animated: Bool) {
        setData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(MyPageVC.goProfit))
        self.profitCheckView.addGestureRecognizer(gesture)
        
        setOrderTableView()
        setView()
    }
    
    func setOrderTableView() {
        self.myPageOrderTableView.delegate = self
        self.myPageOrderTableView.dataSource = self
        self.myPageOrderTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
//        let headerNib = UINib(nibName: "MyPageOrderSectionHeader", bundle: nil)
//        self.myPageOrderTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "myPageOrderSectionHeader")
//
//        let footerNib = UINib(nibName: "MyPageOrderSectionFooter", bundle: nil)
//        self.myPageOrderTableView.register(footerNib, forHeaderFooterViewReuseIdentifier: "myPageOrderSectionFooter")

    }
    
    func setData(){
        
        MyPageService.shared.getMyPage(ownerIndex: "1", cafeIndex: "13") {
            result in
            switch result {
            case .success(let successData) :
                guard successData.self != nil  else { return }
                self.myPageData = successData.data
                self.myPageOrderList = self.myPageData.todayOrderInfo
                
                self.myPageOrderTableView.reloadData()
                
                self.dataBinding()
                
            case .failure(let error) :
                print("getMyPage Error ", error)
            }
        }
       
    }
    
    func dataBinding(){
        self.cafeNameLabel.text = self.myPageData.cafeInfo.cafeName
        self.cafeLocationLabel.text = self.myPageData.cafeInfo.cafeLocation
        
        let imageUrl = URL(string: self.myPageData.cafeInfo.cafeImage)
        do{
            let imageData = try Data(contentsOf: imageUrl!)
            self.cafeImageView.image = UIImage(data: imageData)
        }catch{
            print(error)
        }
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
    

}


extension MyPageVC : UITableViewDelegate, UITableViewDataSource {
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = self.myPageOrderTableView.dequeueReusableHeaderFooterView(withIdentifier: "myPageOrderSectionHeader") as! MyPageOrderSectionHeader
//
//        headerView.customerNameLabel.text = self.myPageOrderList[section].orderer + " 님"
//        headerView.orderTimeLabel.text = self.myPageOrderList[section].orderTime
//
//        return headerView
//    }
//
//    func tableView(_  tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//
//        let footerView = self.myPageOrderTableView.dequeueReusableHeaderFooterView(withIdentifier: "myPageOrderSectionFooter") as! MyPageOrderSectionFooter
//
//        return footerView
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPageOrderList[section].orderMenuInfo.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        // headerView
        if(indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "myPageTableViewHeaderCell", for:indexPath) as! MyPageTableViewHeaderCell
            
            let orderName = myPageOrderList[indexPath.section].orderer
            let orderTime = myPageOrderList[indexPath.section].orderTime
            
            cell.nameLabel.text = orderName + " 님"
            cell.timeLabel.text = orderTime
            
            return cell
            
        // footerView
        } else if(indexPath.row == myPageOrderList[indexPath.section].orderMenuInfo.count+1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myPageTableViewFooterCell", for:indexPath) as! MyPageTableViewFooterCell
            
            let totalPrice = myPageOrderList[indexPath.section].orderTotalPrice
            
            cell.totalPriceLabel.text = String(totalPrice) + "원"
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myPageTableViewContentCell", for:indexPath) as! MyPageTableViewContentCell
            
            let orderItems = myPageOrderList[indexPath.section].orderMenuInfo
            
            print(indexPath.row - 1)
            
            cell.itemNameLabel.text = orderItems[indexPath.row-1].orderMenuName + " " + String(orderItems[indexPath.row-1].count) + "개"
            
            cell.itemConditionLabel.text = "(" + orderItems[indexPath.row-1].temperature + "/" + orderItems[indexPath.row-1].size + "/" + orderItems[indexPath.row-1].takeType + ")"
            
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return myPageOrderList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if(indexPath.row == 0){
            return 45
        } else if(indexPath.row == myPageOrderList[indexPath.section].orderMenuInfo.count+1){
            return 78
        } else {
            return 45
        }
    }
    
}

