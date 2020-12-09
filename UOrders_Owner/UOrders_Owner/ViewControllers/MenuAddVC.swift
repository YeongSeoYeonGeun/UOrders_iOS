//
//  MenuAddVC.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/11/26.
//

import UIKit
import BEMCheckBox

class MenuAddVC: UIViewController {
    
    @IBOutlet weak var menuNameTextField: UITextField!
    @IBOutlet weak var menuPriceTextField: UITextField!
    
    @IBOutlet var wholeContainerView: UIView!
    @IBOutlet weak var smallCheckBoxArea: UIView!
    @IBOutlet weak var regularCheckBoxArea: UIView!
    @IBOutlet weak var largeCheckBoxArea: UIView!
    @IBOutlet weak var hotCheckBoxArea: UIView!
    @IBOutlet weak var icedCheckBoxArea: UIView!
    @IBOutlet weak var soldoutSwitch: UISwitch!
    @IBOutlet weak var menuAddButton: UIView!
    
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var searchPhotoButton: UIImageView!
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        setCheckBox()
        menuAddButton.layer.cornerRadius = 4
        
        menuNameTextField.delegate = self
        menuPriceTextField.delegate = self
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(searchImageAction))
        searchPhotoButton.addGestureRecognizer(tapGestureRecognizer)
        searchPhotoButton.isUserInteractionEnabled = true
        
        picker.delegate = self
        
        super.viewDidLoad()
    }
    
    @objc func searchImageAction(sender : UITapGestureRecognizer) {
        
        let alert =  UIAlertController(title: "사진", message: "메뉴 사진 선택", preferredStyle: .actionSheet)
        let library =  UIAlertAction(title: "사진앨범", style: .default) { (action) in self.openLibrary() }
        let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in self.openCamera() }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    func openLibrary(){
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    
    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
        }
        else{
            print("Camera not available")
        }
    }
    
    @IBAction func showMenuAdd(_ sender: Any) {
        print("segue action")
        self.performSegue(withIdentifier: "showMenuAdd", sender: self)
    }
    
    @IBAction func clidkMenuAdd(_ sender: Any) {
                let newMenuInfo = NewMenu(cafeIndex: 13, menuIndex: 1, menuName: menuNameTextField.text!, menuTemperature: true, menuSize: true, menuPrice: Int(menuPriceTextField.text!)!, soldOut: 0, menuIMG: "")
        
        MenuAddService.shared.sendMenuAddInfo(newMenu: newMenuInfo) {
            result in
            switch result {
            case .success(let successResponse) :
                print("menu add success")
            case .failure(let error) :
                print("menu add fail ", error)
            }
        }
        
        self.dismiss(animated: false)
    }
}

extension MenuAddVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            menuImage.image = image
            print("image picker info")
            print(info)
        }
        dismiss(animated: true, completion: nil)
    }
    
    
}

extension MenuAddVC : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        menuNameTextField.resignFirstResponder()
        menuPriceTextField.resignFirstResponder()
        return true
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
