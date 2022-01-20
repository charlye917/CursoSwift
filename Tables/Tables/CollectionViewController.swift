//
//  CollectionViewController.swift
//  Tables
//
//  Created by Charlye Arteaga on 18/12/21.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collection: UICollectionView!
    var lista = [Lista]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.delegate = self
        collection.dataSource = self

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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lista.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "celda", for: indexPath) as! CeldaCollectionViewCell
        let list = lista[indexPath.row]
        cell.nombre.text = list.nombre
        cell.imagen.image = UIImage(systemName: "person.crop.circle.fill")
        return cell
    }

}
