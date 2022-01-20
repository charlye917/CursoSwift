//
//  ViewController.swift
//  Tables
//
//  Created by Charlye Arteaga on 13/12/21.
//

import UIKit

struct Lista{
    let nombre: String
    let email: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tabla: UITableView!
    var lista = [Lista]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabla.delegate = self
        tabla.dataSource = self
        
        let lista1 = Lista(nombre: "Carlos", email: "charlye934@gmail.com")
        let lista2 = Lista(nombre: "Diana", email: "dianita@gmail.com")
        let lista3 = Lista(nombre: "Laura", email: "lau@gmail.com")
        let lista4 = Lista(nombre: "Daniela", email: "dany@gmail.com")
        let lista5 = Lista(nombre: "Fer", email: "fer@gmail.com")
    
        lista.append(lista1)
        lista.append(lista2)
        lista.append(lista3)
        lista.append(lista4)
        lista.append(lista5)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabla.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        let list = lista[indexPath.row]
        cell.textLabel?.text = list.nombre
        cell.detailTextLabel?.text = list.email
        cell.imageView?.image = UIImage(systemName: "person.crop.circle.fill")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "enviar", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enviar"{
            if let id = tabla.indexPathForSelectedRow{
                let fila = lista[id.row]
                let destion = segue.destination as? DetailViewController
                destion?.datosLista = fila
            }
        }
    }

}

