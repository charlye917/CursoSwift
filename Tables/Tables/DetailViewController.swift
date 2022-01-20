//
//  DetailViewController.swift
//  Tables
//
//  Created by Charlye Arteaga on 13/12/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var email: UILabel!
    
    var datosLista: Lista?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nombre.text = datosLista?.nombre
        email.text = datosLista?.email
    }
    

}
