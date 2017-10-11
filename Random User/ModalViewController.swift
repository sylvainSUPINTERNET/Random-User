//
//  ModalViewController.swift
//  Random User
//
//  Created by SUP'Internet 15 on 09/10/2017.
//  Copyright © 2017 SUP'Internet 15. All rights reserved.
//

import UIKit


class ModalViewController: UIViewController {
    
    var exemplePassingVar: String = ""
    
    var person:Person?
   
    
    @IBOutlet weak var pictureUser: UIImageView!
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var firstnameUser: UILabel!
    @IBOutlet weak var emailUser: UILabel!
    @IBOutlet weak var ageUser: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
               
        if let firstname = self.person?.firstname{
            print(firstname);
            self.firstnameUser.text = firstname
        }
        
        if let name = self.person?.lastname{
            print(name);
            self.nameUser.text = name
        }
        
        if let email = self.person?.email{
            print(email)
            self.emailUser.text = email.description
        }
        
        if let picture = self.person?.url_pic{
            print(picture)
            
            let url = URL(string: picture);
            let data = try? Data(contentsOf: url!)
            let image: UIImage = UIImage(data: data!)!
            pictureUser.image = image
            
        }
        
        if let age =
            self.person?.age{
            print(age)
            self.ageUser.text = age.description + " ans"
            
        }
        

    }
    

    @IBAction func buttonBackPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: {})

    }


    
    
}
