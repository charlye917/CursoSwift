//
//  ViewController.swift
//  UserDefaultArray
//
//  Created by Charlye Arteaga on 16/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var text3: UITextField!
    @IBOutlet weak var text4: UITextField!
    
    var array = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let myArray = UserDefaults.standard.stringArray(forKey: "array"){
            text1.text = myArray[0]
            text2.text = myArray[1]
            text3.text = myArray[2]
            text4.text = myArray[3]
        }
        
        
    }

    
    @IBAction func guardar(_ sender: UIButton) {
        if text1.text == "" && text2.text == "" && text3.text == "" && text4.text == ""{
            alerta(titulo: "Error", mensaje: "Completa todos los campos")
        }else{
            array.append(text1.text ?? "")
            array.append(text2.text ?? "")
            array.append(text3.text ?? "")
            array.append(text4.text ?? "")
            
            UserDefaults.standard.set(array, forKey: "array")
            print("guardar")
        }
    }
    
    func alerta(titulo: String, mensaje: String){
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
}

