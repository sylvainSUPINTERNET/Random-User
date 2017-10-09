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

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func goButtonPressed(_ sender: UIButton) {
        /*
        api.getRandomUserHydratedWithPerson(completion: {
            person in
            
            let alertController = UIAlertController(title: "name", message: person.firstname, preferredStyle: .alert)
            
            self.present(alertController, animated: true, completion: nil)
            
        })
         */
        
        //Ouvre le segue indiquer via l'identifier (apres l'avoir liee via ctrl drag n drop )
        performSegue(withIdentifier: "ShowModal", sender: self)
    }
    
    //Func de xcode -> lorsque perfomSegue est executé, cette méthode va l'être juste avant (prepare le perfom)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier == "ShowModal"){
            //On creer une instance de nouvelle viewController qu'on au préalablement créé en utiliser la destination du segue pour recuperer la class
            let modalViewController = segue.destination as! ModalViewController //Recupere le controller de l'autre view
            //Ainsi à partir de là on peut passer des données (set / get variables) de ce controller vers l'autre controller
            modalViewController.exemplePassingVar = "I passing a test variable from my main view controller to the show modalviewcontroller"
        }
    }
    
 
}

