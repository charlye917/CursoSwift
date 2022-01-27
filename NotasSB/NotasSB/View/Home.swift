//
//  Home.swift
//  NotasSB
//
//  Created by Charlye Arteaga on 24/01/22.
//

import UIKit
import CoreData

class Home: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var tabla: UITableView!
    var notas = [Notas]()
    var fetchResultController: NSFetchedResultsController<Notas>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabla.delegate
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
