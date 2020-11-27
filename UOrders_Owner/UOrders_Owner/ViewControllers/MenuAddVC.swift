//
//  MenuAddVC.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/11/26.
//

import UIKit
import BEMCheckBox

class MenuAddVC: UIViewController {
    
    @IBOutlet weak var smallCheckBoxArea: UIView!
    @IBOutlet weak var regularCheckBoxArea: UIView!
    @IBOutlet weak var largeCheckBoxArea: UIView!
    
    override func viewDidLoad() {
        setCheckBox()
        super.viewDidLoad()
    }

}

extension MenuAddVC {
    func setCheckBox() {
        let smallCheckBox = BEMCheckBox.init(frame: CGRect.init(x:CGFloat(0), y:CGFloat(0), width: CGFloat(20), height: CGFloat(20)))
        let regularCheckBox = BEMCheckBox.init(frame: CGRect.init(x:CGFloat(0), y:CGFloat(0), width: CGFloat(20), height: CGFloat(20)))
        let largeCheckBox = BEMCheckBox.init(frame: CGRect.init(x:CGFloat(0), y:CGFloat(0), width: CGFloat(20), height: CGFloat(20)))
        
        smallCheckBox.boxType = BEMBoxType.circle
        smallCheckBox.tintColor = UIColor(red: 219/255, green: 219/255, blue: 219/255, alpha: 100)
        smallCheckBox.onTintColor = UIColor(red: 229/255, green: 176/255, blue: 0/255, alpha: 100)
        smallCheckBox.onFillColor = UIColor(red: 229/255, green: 176/255, blue: 0/255, alpha: 100)
        smallCheckBox.onCheckColor = UIColor.white
        smallCheckBox.onAnimationType = BEMAnimationType.fill
        smallCheckBox.offAnimationType = BEMAnimationType.fill
        
        regularCheckBox.boxType = BEMBoxType.circle
        regularCheckBox.tintColor = UIColor(red: 219/255, green: 219/255, blue: 219/255, alpha: 100)
        regularCheckBox.onTintColor = UIColor(red: 229/255, green: 176/255, blue: 0/255, alpha: 100)
        regularCheckBox.onFillColor = UIColor(red: 229/255, green: 176/255, blue: 0/255, alpha: 100)
        regularCheckBox.onCheckColor = UIColor.white
        regularCheckBox.onAnimationType = BEMAnimationType.fill
        regularCheckBox.offAnimationType = BEMAnimationType.fill
        
        largeCheckBox.boxType = BEMBoxType.circle
        largeCheckBox.tintColor = UIColor(red: 219/255, green: 219/255, blue: 219/255, alpha: 100)
        largeCheckBox.onTintColor = UIColor(red: 229/255, green: 176/255, blue: 0/255, alpha: 100)
        largeCheckBox.onFillColor = UIColor(red: 229/255, green: 176/255, blue: 0/255, alpha: 100)
        largeCheckBox.onCheckColor = UIColor.white
        largeCheckBox.onAnimationType = BEMAnimationType.fill
        largeCheckBox.offAnimationType = BEMAnimationType.fill
        
        self.smallCheckBoxArea.addSubview(smallCheckBox)
        self.regularCheckBoxArea.addSubview(regularCheckBox)
        self.largeCheckBoxArea.addSubview(largeCheckBox)
    }
}
