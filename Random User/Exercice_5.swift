//
//  Exercice_5.swift
//  Semester_6_1
//
//  Created by Emir Azaiez on 09/10/2017.
//  Copyright © 2017 Emir Azaiez. All rights reserved.
//
import Foundation

extension ApiManager {
    
    func getRandomUserHydratedWithPerson(completion: @escaping (Person) -> Void) {
        
        self.getRandomUser(completion: { data in
            
            let result = data as! [String:Any]
            
            let name = result["name"] as! [String: String]
            
            let picture = result["picture"] as! [String:String]
            
            
            if let firstname = name["first"], let lastname = name["last"], let email = result["email"], let gender = result["gender"], let birthdate = result["dob"] , let url_pic = picture["large"]{
                
                let person = Person(
                    firstname: firstname,
                    lastname: lastname,
                    gender: Person.Gender(rawValue: gender as! String)!,
                    email: email as! String,
                    birthdate: (date: birthdate as! String, format: "yyyy-MM-dd HH:mm:ss"),
                    url_pic: url_pic as! String
                )
                
                completion(person)
                
            }
            
        })
        
    }
    
}
