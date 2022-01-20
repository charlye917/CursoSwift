//
//  SegundoController.swift
//  NavigationStoryboard
//
//  Created by Charlye Arteaga on 08/12/21.
//

import UIKit

class SegundoController: UIViewController {

    @IBOutlet weak var texto: UILabel!
    var saludo: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        texto.text = saludo
    }
    
    
    @IBAction func regresar(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
