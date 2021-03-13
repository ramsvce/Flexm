//
//  UserViewController.swift
//  Flexm_Project
//
//  Created by ramesh pazhanimala on 12/02/21.
//  Copyright © 2021 ramesh pazhanimala. All rights reserved.
//

import UIKit

class UserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let users = UserAPI.getUsers() // model
    let contactsTableView = UITableView() // view
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = nil

        view.backgroundColor = .gray
        
        view.addSubview(contactsTableView)
        
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        contactsTableView.backgroundColor = UIColor.white
        contactsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0.0).isActive = true
        
        //  contactsTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor ).isActive = true
        contactsTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor, constant : 0.0).isActive = true
        contactsTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor, constant: 0.0).isActive = true
        contactsTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
        
        contactsTableView.register(UserTableViewCell.self, forCellReuseIdentifier: "contactCell")
        
        navigationItem.title = "Users"
        let logoutBtn = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(Logout))
        
        self.navigationItem.rightBarButtonItems = [logoutBtn]
    }
    
    @objc func Logout(){
        present(LoginViewController(), animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! UserTableViewCell
        
        //      cell.textLabel?.text = contacts[indexPath.row].name
        cell.user = users[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let destination = DetailViewController()
        let user = users[indexPath.row]

        destination.usernametxt.text = user.username
        destination.emailTxt.text = user.emailId
        destination.ProfileImageView.image = UIImage(named: user.profileImage!)
        
        navigationController?.pushViewController(destination, animated: true)
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
}
