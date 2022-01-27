//
//  ViewController.swift
//  TableViews
//
//  Created by Brais Moure.
//  Copyright © 2020 MoureDev. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    //Referencia al managedobject context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Cambiar a variable tipo pais sin datos iniciales
    private var myCountries: [Pais]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        //Recupear Datos
        recuperarDatos()
    }

    @IBAction func add(_ sender: Any) {
        print("Añadir Datos")
        
        //Crear alerta
        let alert = UIAlertController(title: "Agregar pais", message: "Añade un pais nuevo", preferredStyle: .alert)
        alert.addTextField()
        
        //Crear y configurar boton de alerta
        let botonAlerta = UIAlertAction(title: "Añadir", style: .default){ (action) in
            //Recuperar textField de la alerta
            let textFiedl = alert.textFields![0]
            //crear objeto pais
            let nuevoPais = Pais(context: self.context)
            nuevoPais.name = textFiedl.text
            
            //Guardar informacion(añade block do-try-catch)
            try! self.context.save()
            
            //Refrescar informacion en tableview
            self.recuperarDatos()
        }
        
        //Añadir botn a la alerta y mostrar alerta
        alert.addAction(botonAlerta)
        self.present(alert, animated: true, completion: nil)
    }
    
    func recuperarDatos(){
        do{
            self.myCountries = try context.fetch(Pais.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }catch{
            print("Error reprando datos")
        }
    }
    
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCountries!.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            
            var cell = tableView.dequeueReusableCell(withIdentifier: "mycell")
            if cell == nil {
               
                cell = UITableViewCell(style: .default, reuseIdentifier: "mycell")
                cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
                
            }
        cell!.textLabel?.text = myCountries![indexPath.row].name
            return cell!
      
            
       
    }
    
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        //Añadir funcionalidad de editar
        let paisEditar = self.myCountries![indexPath.row]
        //crear alerta
        let alert = UIAlertController(title: "Editar pais", message: "Edita el pais", preferredStyle: .alert)
        alert.addTextField()
        
        //recuperar nombre del pais actual de la tabla y agregar al texfield
        let textField = alert.textFields![0]
        textField.text = paisEditar.name
        
        //crear y configurar boton de alerta
        let botonAlerta = UIAlertAction(title: "Editar", style: .default){ (action) in
            //recupear textfiel de la alerta
            let textField = alert.textFields![0]
            //editar pais acutal con lo que esta en el textfield
            paisEditar.name = textField.text
            //guardar informacion(añade block do-try-cathc
            try! self.context.save()
            //refrescar informacion en tabla
            self.recuperarDatos()
        }
        
        //añadir botn a la alerta y mostrar alerta
        alert.addAction(botonAlerta)
        self.present(alert,animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let actionEliminar = UIContextualAction(style: .destructive, title: "Eliminar"){ (action, view, completionHandler) in
            //cual pais se eliminara
            let paisEliminar = self.myCountries![indexPath.row]
            //elminar pais
            self.context.delete(paisEliminar)
            //guardar el cambio de informacion
            try! self.context.save()
            
            //recargar datos
            self.recuperarDatos()
        }
        
        return UISwipeActionsConfiguration(actions: [actionEliminar])
    }
    
}

