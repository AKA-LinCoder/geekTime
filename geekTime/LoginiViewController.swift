//
//  LoginiViewController.swift
//  geekTime
//
//  Created by lsaac on 2022/3/6.
//

import UIKit
import SnapKit


protocol ValidatesPhoneNumber{
    func validatePhoneNumber(_ phoneNumger:String) -> Bool
}

protocol ValidatesPassword{
    func validatePassword(_ password:String) -> Bool
}

extension ValidatesPhoneNumber{
    func validatePhoneNumber(_ phoneNumger:String) -> Bool{
        if phoneNumger.count != 11{
            return false
        }
        return true
    }
}

extension ValidatesPassword{
    func validatePassword(_ password:String) -> Bool{
        if password.count < 6 || password.count>12{
            return false
        }
        return true
    }
}


class LoginiViewController: BaseViewController,ValidatesPhoneNumber,ValidatesPassword {

    var phoneTextField:UITextField!
    var passwordTextField:UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func setupUI(){
        let logoView = UIImageView(image: R.image.logo())
        view.addSubview(logoView)
        logoView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }
        let phoneIconView = UIImageView(image: R.image.icon_phone())
        phoneTextField = UITextField()
        passwordTextField = UITextField()
        phoneTextField.leftView = phoneIconView
        phoneTextField.leftViewMode = .always
        phoneTextField.layer.borderColor = UIColor.hexColor(0x333333).cgColor
        phoneTextField.layer.borderWidth = 1
        phoneTextField.textColor = UIColor.hexColor(0x333333)
        phoneTextField.layer.cornerRadius = 5
        phoneTextField.layer.masksToBounds = true
        phoneTextField.placeholder = "请输入手机号"
        view.addSubview(phoneTextField)
        phoneTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(logoView.snp_bottom).offset(20)
            make.height.equalTo(50)
        }
        
        let passIconView = UIImageView(image: R.image.icon_pwd())
        passwordTextField.leftView = passIconView
        passwordTextField.leftViewMode = .always
        passwordTextField.layer.borderColor = UIColor.hexColor(0x333333).cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.textColor = UIColor.hexColor(0x333333)
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.masksToBounds = true
        passwordTextField.placeholder = "请输入密码"
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(phoneTextField.snp_bottom).offset(20)
            make.height.equalTo(50)
        }
        
        let button = UIButton(type: .custom)
        button.setTitle("login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
//        button.backgroundColor = UIColor.hexColor(0xf8892e)
        button.setBackgroundImage(UIColor.hexColor(0xf8892e).toImage(), for: .normal)
        button.layer.cornerRadius = 5
        
        view.addSubview(button)
        
        button.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(passwordTextField.snp_bottom).offset(20)
            make.height.equalTo(50)
        }
        button.addTarget(self, action: #selector(didClickLoginBtn), for: .touchUpInside)
        
        
        
        
        
    }
    
    
    @objc func didClickLoginBtn(){
        if validatePhoneNumber(phoneTextField.text ?? "") && validatePassword(phoneTextField.text ?? ""){
            
        }else{
            self.showToast()
        }
    }
    
    
    func showToast(){
        let alertVc = UIAlertController(title: "提示", message: "输入异常", preferredStyle: .alert)
        present(alertVc, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
            alertVc.dismiss(animated: true, completion: nil)
        }
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
