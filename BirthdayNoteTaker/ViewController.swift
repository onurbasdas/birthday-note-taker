//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Onur Başdaş on 23.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        // Casting as? vs as!
        if let newName = storedName as? String{
            nameLabel.text = "Name: \(newName)"
        }
        if let newBirthday = storedBirthday as? String{
            birthdayLabel.text = "Birthday: \(newBirthday)"
        }
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        if nameTextField.text == ""{
           makeAlert(titleInput: "Error", messageInput: "Username Not Found")
        }else{
            UserDefaults.standard.set(nameTextField.text!, forKey: "name")
        }
        if birthdayTextField.text == ""{
            makeAlert(titleInput: "Error", messageInput: "Birthday Not Found")
        }else{
            UserDefaults.standard.set(birthdayTextField.text!, forKey: "birthday")
        }
       
       
        //      UserDefaults.standard.synchronize() Karşımıza böyle de çıkabilir.
        
        
        nameLabel.text = "Name: \(nameTextField.text!)"
        birthdayLabel.text = "Birthday: \(birthdayTextField.text!)"
    }
    
    
    @IBAction func deleteClicked(_ sender: Any) {
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        
        //        "" bu boş birşey ama nil daha değer bile atanmamış demek.
        if (storedName as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name:"
        }
        if (storedBirthday as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday:"
        }
        
        
    }
    
    func makeAlert(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

