//
//  ViewController.swift
//  DesignStoryBoard
//
//  Created by Charlye Arteaga on 02/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var resultado: UILabel!
    @IBOutlet weak var resultadoDescuento: UILabel!
    @IBOutlet weak var porcentajetxt: UITextField!
    @IBOutlet weak var cantidadtxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //para empujar la vista para mostrar el teclado
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoDown), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    
    @IBAction func calcular(_ sender: UIButton) {
        guard let cantidad = cantidadtxt.text else { return }
        guard let porcentaje = porcentajetxt.text else { return }
        
        let cant = (cantidad as NSString).floatValue
        let porciento = (porcentaje as NSString).floatValue
        
        let desc = (cant * porciento) / 100
        let res = cant - desc
        
        resultado.text = "$\(res)"
        resultadoDescuento.text = "$\(desc)"
        self.view.endEditing(true)
    }
    
    
    @IBAction func limpiar(_ sender: UIButton) {
        cantidadtxt.text = ""
        porcentajetxt.text = ""
        resultado.text = "$0.0"
        resultadoDescuento.text = "$0.0"
    }
    
    @objc func tecladoUp(){
        let sizeScreen = UIScreen.main.nativeBounds.height
        if(sizeScreen == 1136){
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y = -50
            }
        }
    
    }
    
    @objc func tecladoDown(){
        if self.view.frame.origin.y != 0{
            self.view.frame.origin.y = 0
        }
    }
    
    //Para ocultar el teclado
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

