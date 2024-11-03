//
//  ViewController.swift
//  UserDefaultInSwift
//
//  Created by Engy on 7/31/2567 BE.
//

import UIKit

class ViewController: UIViewController {
    let shared = UserDefaultManager.shared
    var isAgree = false
    @IBOutlet weak var phoneTxtField: UITextField!
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var reTypePasswordTxtField: UITextField!
    @IBOutlet weak var iAgreeLbl: UILabel!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var termsBtn: UIButton!
    @IBOutlet var cornerRaduisView: [UIView]!
    @IBOutlet weak var isAgreeImg: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        //shared.getStoredData()
        print(shared.name)
        print(shared.email)
        print(shared.password)
    }

    @IBAction func continueAsGuest(_ sender: UIBarButtonItem) {
        shared.continueAsAGuest = true
        shared.storeData()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "2") as? SecondVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }


    @IBAction func logOutBtnClicked(_ sender: UIBarButtonItem) {
        shared.logout()
    }

    @IBAction func loginBtnClicked(_ sender: UIButton) {
        shared.password = passwordTxtField.text ?? ""
        shared.name = nameTxtField.text ?? ""
        shared.email = emailTxtField.text ?? ""
        shared.continueAsAGuest = false
        shared.islogin = true

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "1") as? FirstVC
        self.navigationController?.pushViewController(vc!, animated: true)
        shared.storeData()
    }
}
// MARK: - Helper Extension
extension ViewController {
    
    func initUI() {
        for view in cornerRaduisView {
            view.layer.cornerRadius = 10
        }
    }
    
    
}
