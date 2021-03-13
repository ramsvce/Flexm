//
//  DetailViewController.swift
//  Flexm_Project
//
//  Created by ramesh pazhanimala on 12/02/21.
//  Copyright © 2021 ramesh pazhanimala. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupContentView()
        self.view.backgroundColor = .white
        
        navigationItem.title = "User Details"
        let logoutBtn = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(Logout))
        
        self.navigationItem.rightBarButtonItems = [logoutBtn]
    }
    
    @objc func Logout(){
        present(LoginViewController(), animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let contentView : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30.0
        return view
    }()
    
    let usernametxt : UILabel = {
        let usertext = UILabel()
        usertext.backgroundColor = .clear
        return usertext
    }()
    
    let emailTxt : UILabel = {
        let emailtext = UILabel()
        emailtext.backgroundColor = .clear
        return emailtext
    }()
    
    let ProfileView : UIView = {
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
    
    let ProfileImageView : UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    
    let padding: CGFloat = 40.0
    let signInButtonHeight: CGFloat = 50.0
    let textFieldViewHeight: CGFloat = 60.0
    
    
    
    func setupContentView(){
        
        self.view.addSubview(contentView)
       
        contentView.addSubview(usernametxt)
        contentView.addSubview(emailTxt)
        contentView.addSubview(ProfileView)
        ProfileView.addSubview(ProfileImageView)
        
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50 ).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding).isActive = true
        
     
        
        usernametxt.translatesAutoresizingMaskIntoConstraints = false
        usernametxt.heightAnchor.constraint(equalToConstant: textFieldViewHeight).isActive = true
        usernametxt.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0 ).isActive = true
        usernametxt.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        usernametxt.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        
        emailTxt.translatesAutoresizingMaskIntoConstraints = false
        emailTxt.heightAnchor.constraint(equalToConstant: textFieldViewHeight).isActive = true
        emailTxt.topAnchor.constraint(equalTo: usernametxt.topAnchor, constant: 50 ).isActive = true
        emailTxt.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        emailTxt.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        
        ProfileView.translatesAutoresizingMaskIntoConstraints = false
        ProfileView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        ProfileView.topAnchor.constraint(equalTo: emailTxt.bottomAnchor, constant: 0 ).isActive = true
        ProfileView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        ProfileView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        
        ProfileImageView.translatesAutoresizingMaskIntoConstraints = false
        ProfileImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        ProfileImageView.topAnchor.constraint(equalTo: emailTxt.bottomAnchor, constant: 0 ).isActive = true
        ProfileImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        ProfileImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
