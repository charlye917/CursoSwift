//
//  addView.swift
//  NotasSB
//
//  Created by Charlye Arteaga on 24/01/22.
//

import UIKit

class addView: UIViewController {
    
    
    @IBOutlet weak var titulo: UITextField!
    @IBOutlet weak var nota: UITextView!
    @IBOutlet weak var fecha: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func guardar(_ sender: UIButton) {
        Modelo.shared.saveData(titulo: titulo.text ?? "", nota: nota.text ?? "", fecha: fecha.date)
    }
    

}
