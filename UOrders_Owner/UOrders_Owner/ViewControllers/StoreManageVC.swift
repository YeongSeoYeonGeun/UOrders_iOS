//
//  StoreManageViewController.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/11/25.
//

import UIKit

//struct Menu {
////    var menuPhoto : String
//    var menuName : String
//    var menuPrice : String
//}

class StoreManageVC: UIViewController {
    
//    let menuList = [Menu(menuName: "아메리카노", menuPrice: "1,000원"),
//                    Menu(menuName: "카페라떼", menuPrice: "1,500원"),
//                    Menu(menuName: "카페모카", menuPrice: "2,000원"),
//                    Menu(menuName: "플랫화이트", menuPrice: "1,000원"),
//                    Menu(menuName: "콜드브루 아메리카노", menuPrice: "1,500원"),
//                    Menu(menuName: "아메리카노", menuPrice: "1,000원"),
//                    Menu(menuName: "카페라떼", menuPrice: "1,500원"),
//                    Menu(menuName: "카페모카", menuPrice: "2,000원"),
//                    Menu(menuName: "플랫화이트", menuPrice: "1,000원"),
//                    Menu(menuName: "콜드브루 아메리카노", menuPrice: "1,500원")]

    @IBOutlet weak var storeTableView: UITableView!
    @IBOutlet weak var menuAddButton: UIButton!
    
    private var handler: ((Result<CafeMenuDataResult, Error>) -> Void)!
    var storeTableData : CafeMenuDataResult!
    
    override func viewDidLoad() {
        print("viewDidLoad")
        setStoreTableView()
        super.viewDidLoad()
        handler = { result in
                    switch result {
                    case .success(let successData):
                        guard successData.self != nil else { return }
                        self.storeTableData = successData
                    case .failure(let error):
                        print("Error", error.localizedDescription)
                    }
                }
        
        API.shared.getStoreManageMain(completionHandler: handler)
    }
    
    func setStoreTableView() {
        storeTableView.delegate = self
        storeTableView.dataSource = self
        storeTableView.tableFooterView = UIView()
    }
    
    func setAddButton() {
        NSLayoutConstraint.activate([
            menuAddButton.bottomAnchor.constraint(equalTo: storeTableView.frameLayoutGuide.bottomAnchor, constant: -30),
            menuAddButton.trailingAnchor.constraint(equalTo: storeTableView.frameLayoutGuide.trailingAnchor, constant: -30)
        ])
    }
    
    @IBAction func showMenuAddVC(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "MenuAddStoryBoard") else { return }
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .overCurrentContext
        
        self.parent?.present(vc, animated: false, completion: nil)
    }

}

extension StoreManageVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection")
        
        if let rowData = self.storeTableData {
            print(rowData.data.menuInfo.count)
            return rowData.data.menuInfo.count
        }else{
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt")
        let cell = tableView.dequeueReusableCell(withIdentifier: "storeTableViewCell", for: indexPath) as! StoreTableViewCell
        
        cell.menuPhotoImage.layer.cornerRadius = cell.menuPhotoImage.frame.width/2
        cell.clipsToBounds = true
        cell.menuNameLabel.text = storeTableData.data.menuInfo[indexPath.row].menuName
        cell.menuPriceLabel.text = "\(storeTableData.data.menuInfo[indexPath.row].menuPrice)원"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print("heightForRowAt")
        return 80
    }
}
