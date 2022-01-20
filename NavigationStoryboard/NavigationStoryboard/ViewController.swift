//
//  ViewController.swift
//  NavigationStoryboard
//
//  Created by Charlye Arteaga on 08/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    let hola = "Hola como estas"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if(segue.identifier == "enviar"){
            let destino = segue.destination as? SegundoController
            destino?.saludo = hola
        }
    }
    
    @IBAction func regresarIncio(segue: UIStoryboardSegue){
        print("regresar al incio")
    }
    
}

