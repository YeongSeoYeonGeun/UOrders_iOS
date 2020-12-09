//
//  MenuAddVC.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/11/26.
//

import UIKit
import BEMCheckBox

class MenuAddVC: UIViewController {
    
    @IBOutlet var wholeContainerView: UIView!
    @IBOutlet weak var smallCheckBoxArea: UIView!
    @IBOutlet weak var regularCheckBoxArea: UIView!
    @IBOutlet weak var largeCheckBoxArea: UIView!
    @IBOutlet weak var hotCheckBoxArea: UIView!
    @IBOutlet weak var icedCheckBoxArea: UIView!
    @IBOutlet weak var soldoutSwitch: UISwitch!
    @IBOutlet weak var menuAddButton: UIView!
    
    override func viewDidLoad() {
        setCheckBox()
        menuAddButton.layer.cornerRadius = 4
        super.viewDidLoad()
    }
    
    @IBAction func showMenuAdd(_ sender: Any) {
        print("segue action")
        self.performSegue(withIdentifier: "showMenuAdd", sender: self)
    }
    
}

extension MenuAddVC {
    func setCheckBox() {
        let smallCheckBox = BEMCheckBox.init(frame: CGRect.init(x:CGFloat(0), y:CGFloat(0), width: CGFloat(20), height: CGFloat(20)))
        let regularCheckBox = BEMCheckBox.init(frame: CGRect.init(x:CGFloat(0), y:CGFloat(0), width: CGFloat(20), height: CGFloat(20)))
        let largeCheckBox = BEMCheckBox.init(frame: CGRect.init(x:CGFloat(0), y:CGFloat(0), width: CGFloat(20), height: CGFloat(20)))
        let hotCheckBox = BEMCheckBox.init(frame: CGRect.init(x:CGFloat(0), y:CGFloat(0), width: CGFloat(20), height: CGFloat(20)))
        let icedCheckBox = BEMCheckBox.init(frame: CGRect.init(x:CGFloat(0), y:CGFloat(0), width: CGFloat(20), height: CGFloat(20)))
        
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
        
        hotCheckBox.boxType = BEMBoxType.circle
        hotCheckBox.tintColor = UIColor(red: 219/255, green: 219/255, blue: 219/255, alpha: 100)
        hotCheckBox.onTintColor = UIColor(red: 229/255, green: 176/255, blue: 0/255, alpha: 100)
        hotCheckBox.onFillColor = UIColor(red: 229/255, green: 176/255, blue: 0/255, alpha: 100)
        hotCheckBox.onCheckColor = UIColor.white
        hotCheckBox.onAnimationType = BEMAnimationType.fill
        hotCheckBox.offAnimationType = BEMAnimationType.fill
        
        icedCheckBox.boxType = BEMBoxType.circle
        icedCheckBox.tintColor = UIColor(red: 219/255, green: 219/255, blue: 219/255, alpha: 100)
        icedCheckBox.onTintColor = UIColor(red: 229/255, green: 176/255, blue: 0/255, alpha: 100)
        icedCheckBox.onFillColor = UIColor(red: 229/255, green: 176/255, blue: 0/255, alpha: 100)
        icedCheckBox.onCheckColor = UIColor.white
        icedCheckBox.onAnimationType = BEMAnimationType.fill
        icedCheckBox.offAnimationType = BEMAnimationType.fill
        
        self.smallCheckBoxArea.addSubview(smallCheckBox)
        self.regularCheckBoxArea.addSubview(regularCheckBox)
        self.largeCheckBoxArea.addSubview(largeCheckBox)
        self.hotCheckBoxArea.addSubview(hotCheckBox)
        self.icedCheckBoxArea.addSubview(icedCheckBox)
    }
}
