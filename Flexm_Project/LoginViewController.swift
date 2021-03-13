//
//  ViewController.swift
//  Flexm_Project
//
//  Created by ramesh pazhanimala on 12/02/21.
//  Copyright © 2021 ramesh pazhanimala. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var validateUser = LoginValidation()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .lightGray
        self.Errortxt.isHidden = true
        navigationItem.title = "Login"

        setupContentView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    let contentView : UIView = {
        let view = UIView()
//        view.backgroundColor = .cyan
        view.layer.cornerRadius = 30.0
        return view
    }()
    
    
    let Errortxt : UILabel = {
        let errortext = UILabel()
        errortext.textColor = .red
        return errortext
    }()
    
    let usernametxt : UILabel = {
        let usertext = UILabel()
        usertext.backgroundColor = .clear
        usertext.text = "Username"
        return usertext
    }()
    
    let passwordtxt : UILabel = {
        let passtext = UILabel()
        passtext.text = "Password"
        passtext.backgroundColor = .clear
        return passtext
    }()
    
    let usernameView : UIView = {
        let usertext = UIView()
        usertext.backgroundColor = UIColor.white
        usertext.layer.cornerRadius = 15.0
        usertext.layer.borderColor = UIColor.lightGray.cgColor
        usertext.layer.borderWidth = 1.5
        
        usertext.layer.shadowColor = UIColor.black.cgColor
        usertext.layer.shadowOpacity = 0.8
        usertext.layer.shadowRadius = 3.0
        usertext.layer.shadowOffset = CGSize(width: 2.0, height: -2.0)
        
        return usertext
    }()
    
    let passwordView : UIView = {
        let passtext = UIView()
        passtext.backgroundColor = UIColor.white
        passtext.layer.cornerRadius = 15.0
        passtext.layer.borderColor = UIColor.lightGray.cgColor
        passtext.layer.borderWidth = 1.5
        
        passtext.layer.shadowColor = UIColor.black.cgColor
        passtext.layer.shadowOpacity = 0.8
        passtext.layer.shadowRadius = 3.0
        passtext.layer.shadowOffset = CGSize(width: 2.0, height: -2.0)
        return passtext
    }()
    
    let username : UITextField = {
        let usertext1 = UITextField()
        usertext1.placeholder = "Username"
        usertext1.backgroundColor = .clear
        usertext1.becomeFirstResponder()
        return usertext1
    }()
    
    let password : UITextField = {
        let passtext = UITextField()
        passtext.placeholder = "Password"
        passtext.backgroundColor = .clear
        passtext.clearsOnBeginEditing = true
        passtext.isSecureTextEntry = true
        return passtext
    }()
    
    let Loginbtn : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SIGN IN", for: .normal)
        button.addTarget(self, action: #selector(LoginbtnTapped), for: .touchUpInside)
        
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 20.0
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1.5
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.8
        button.layer.shadowRadius = 3.0
        button.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        
        return button
    }()
    
    let forgotPassword : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func LoginbtnTapped(sender: UIButton){
        print("Btn Tapped")

        self.Errortxt.isHidden = true
        guard let userName = self.username.text else {return}
        guard let password = self.password.text else {return}
        
        validateUser.loginCompletionHandler { [weak self] (status, message) in
            if status {
                self?.Errortxt.text = "Logged in with username = \(String(describing: self?.validateUser.username)) and email = \(String(describing: self?.validateUser.password))"
                self?.Errortxt.isHidden = true
                self?.showAlertVC(title: "Sign In tapped")

            } else {
                self?.Errortxt.text = message
                self?.Errortxt.isHidden = false
                self?.username.becomeFirstResponder()
            }
        }
        validateUser.authenticateUser(userName, andPassword: password)
        
    }
    
    
    let padding: CGFloat = 40.0
    let signInButtonHeight: CGFloat = 50.0
    let textFieldViewHeight: CGFloat = 60.0
    
    
    
    func setupContentView(){
        
        self.view.addSubview(contentView)
        
        contentView.addSubview(Errortxt)
        contentView.addSubview(usernameView)
        contentView.addSubview(passwordView)
        contentView.addSubview(usernametxt)
        contentView.addSubview(passwordtxt)
        
        contentView.addSubview(username)
        contentView.addSubview(password)
        contentView.addSubview(Loginbtn)
        contentView.addSubview(forgotPassword)
        
        //        contentView.endEditing(true)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80 ).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding).isActive = true
        
        Errortxt.translatesAutoresizingMaskIntoConstraints = false
        Errortxt.heightAnchor.constraint(equalToConstant: textFieldViewHeight).isActive = true
        Errortxt.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0 ).isActive = true
        Errortxt.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        Errortxt.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        
        //   setupUsername()
        
        usernametxt.translatesAutoresizingMaskIntoConstraints = false
        usernametxt.heightAnchor.constraint(equalToConstant: textFieldViewHeight).isActive = true
        usernametxt.topAnchor.constraint(equalTo: Errortxt.topAnchor, constant: 50 ).isActive = true
        usernametxt.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        usernametxt.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        
        usernameView.translatesAutoresizingMaskIntoConstraints = false
        usernameView.heightAnchor.constraint(equalToConstant: textFieldViewHeight).isActive = true
        usernameView.topAnchor.constraint(equalTo: usernametxt.bottomAnchor, constant: 0 ).isActive = true
        usernameView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        usernameView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        
        username.translatesAutoresizingMaskIntoConstraints = false
        username.heightAnchor.constraint(equalToConstant: textFieldViewHeight).isActive = true
        username.topAnchor.constraint(equalTo: usernametxt.bottomAnchor, constant: 0 ).isActive = true
        username.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        username.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        
        
        passwordtxt.translatesAutoresizingMaskIntoConstraints = false
        passwordtxt.heightAnchor.constraint(equalToConstant: textFieldViewHeight).isActive = true
        passwordtxt.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 0 ).isActive = true
        passwordtxt.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        passwordtxt.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        
        passwordView.translatesAutoresizingMaskIntoConstraints = false
        passwordView.heightAnchor.constraint(equalToConstant: textFieldViewHeight).isActive = true
        passwordView.topAnchor.constraint(equalTo: passwordtxt.bottomAnchor, constant: 0 ).isActive = true
        passwordView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        passwordView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        
        password.translatesAutoresizingMaskIntoConstraints = false
        password.heightAnchor.constraint(equalToConstant: textFieldViewHeight).isActive = true
        password.topAnchor.constraint(equalTo: passwordtxt.bottomAnchor, constant: 0 ).isActive = true
        password.leftAnchor.constraint(equalTo: username.leftAnchor, constant: 0).isActive = true
        password.rightAnchor.constraint(equalTo: username.rightAnchor, constant: 0).isActive = true
        
        
        Loginbtn.translatesAutoresizingMaskIntoConstraints = false
        Loginbtn.heightAnchor.constraint(equalToConstant: signInButtonHeight).isActive = true
        Loginbtn.topAnchor.constraint(equalTo: password.bottomAnchor, constant: padding + 20 ).isActive = true
        Loginbtn.leftAnchor.constraint(equalTo: username.leftAnchor, constant: 0).isActive = true
        Loginbtn.rightAnchor.constraint(equalTo: username.rightAnchor, constant: 0).isActive = true
        
        
        forgotPassword.topAnchor.constraint(equalTo: Loginbtn.bottomAnchor, constant: 0.0).isActive = true
        forgotPassword.leadingAnchor.constraint(equalTo: username.leadingAnchor, constant: 0.0).isActive = true
        forgotPassword.trailingAnchor.constraint(equalTo: username.trailingAnchor, constant: 0.0).isActive = true
        
        forgotPassword.setTitle("Forgot password?", for: .normal)
        forgotPassword.setTitleColor(UIColor.blue, for: .normal)
        forgotPassword.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        forgotPassword.addTarget(self, action: #selector(forgotPasswordButtonTapped(button:)), for: .touchUpInside)
        
    }
    
    @objc private func signInButtonTapped(button: UIButton) {
        showAlertVC(title: "Sign In tapped")
        
    }
    
    @objc private func signUpButtonTapped(button: UIButton) {
        showAlertVC(title: "Sign up tapped")
    }
    
    @objc private func forgotPasswordButtonTapped(button: UIButton) {
        showAlertVC(title: "Forgot password tapped")
    }
    
    func showAlertVC(title: String) {
        dismiss(animated: true, completion: nil)
     //   self.navigationController?.pushViewController(UserViewController(), animated: true)
        
    }
    
    

}

