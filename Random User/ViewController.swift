//
//  ViewController.swift
//  Random User
//
//  Created by SUP'Internet 15 on 09/10/2017.
//  Copyright © 2017 SUP'Internet 15. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //help - covar
    //pour linker 2 controller view -> bouton jaune, ctrl vers l'autre view + choisir le choix du segue + le rename
    // clique sur un element -> menu (cercle fleche) permet de visualiser tous les events sur la view controller
    // creeer un controller (class swift héritant de UIViewController a chaque fois que l'on creer une nouvelle view controller)
    //pour donnée une class a notre nouvelle view controller, cliquer sur le picto jaune, aller dans le menu et ajouter dans custom class Class le nom de notre controller ModalViewController
    
    let api = ApiManager();
    var person:Person?


    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clearCache(_ sender: UIButton) {
        print("cache clear ");
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
        defaults.synchronize()
        
        let alert = UIAlertController(title: "Alert", message: "Cache clear !", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Quitter", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func goButtonPressed(_ sender: UIButton) {
        /*
        api.getRandomUserHydratedWithPerson(completion: {
            person in
            
            let alertController = UIAlertController(title: "name", message: person.firstname, preferredStyle: .alert)
            
            self.present(alertController, animated: true, completion: nil)
            
        })
         */
        
        
        // if USER exist en cache => instanciate person with these fields
        // perfom with user in cache
        // else
        //perform with api
        
   
        print(" çççççççççççç ")
        print(UserDefaults.standard.value(forKey: "firstname"))
        print(UserDefaults.standard.string(forKey: "firstname"))

        if (UserDefaults.standard.value(forKey: "firstname") != nil){
            print("load cache data");
            //get each value from cache
            
            let firstname = UserDefaults.standard.value(forKey: "firstname") as! String
            let name = UserDefaults.standard.value(forKey: "name") as! String
            let email = UserDefaults.standard.value(forKey: "email") as! String
            let age = UserDefaults.standard.value(forKey: "age") as! String
            let url = UserDefaults.standard.value(forKey: "url") as! String
            let birthdate = UserDefaults.standard.value(forKey: "birthdate") as! String


            person = Person(firstname: firstname, lastname: name, gender: Person.Gender.Male, email: email.description, birthdate: birthdate.toDate(format: "yyyy-MM-dd HH:mm:ss"), url_pic: url)
            
             self.performSegue(withIdentifier: "ShowModal", sender: person)
        }else{
            api.getRandomUserHydratedWithPerson(completion: {
                person in
                //Execute dans le main thread
                DispatchQueue.main.async {
                    print("________________________")
                    print(person.firstname)
                    UserDefaults.standard.setValue(person.firstname, forKey: "firstname")
                    UserDefaults.standard.setValue(person.lastname, forKey: "name")
                    UserDefaults.standard.setValue(person.email.description, forKey: "email")
                    UserDefaults.standard.setValue(String(person.age), forKey: "age")
                    UserDefaults.standard.setValue(person.url_pic, forKey: "url")
                    UserDefaults.standard.setValue(person.birthdate.toString(format: "yyyy-MM-dd HH:mm:ss"), forKey: "birthdate")
                    
                    
                    self.performSegue(withIdentifier: "ShowModal", sender: person)
                }
            })
        }
        
    }
    
    
    //Func de xcode -> lorsque perfomSegue est executé, cette méthode va l'être juste avant (prepare le perfom)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier == "ShowModal"){
            //On creer une instance de nouvelle viewController qu'on au préalablement créé en utiliser la destination du segue pour recuperer la class
            
            print(1)
            
            let modalViewController = segue.destination as! ModalViewController //Recupere le controller de l'autre view
            modalViewController.person = sender as! Person //on envoit la varialbe person de viewController à modalViewController
                
            //Ainsi à partir de là on peut passer des données (set / get variables) de ce controller vers l'autre controller
            
            
            modalViewController.exemplePassingVar = "I passing a test variable from my main view controller to the show modalviewcontroller"
            
            
         
        }
    }
    
 
}

