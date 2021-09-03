//
//  ViewController.swift
//  ScrollableCollectionView
//
//  Created by Apple on 31/08/21.
//

import UIKit

let tableCellIdentifier = "CustomTableViewCell"

class ViewController: UIViewController {

    var staticCollectionData = ["image_1","image_2","image_3","image_4","image_5"]
    
    @IBOutlet weak var tableView: UITableView? {
        didSet {
            tableView!.register(UINib(nibName: tableCellIdentifier, bundle: nil), forCellReuseIdentifier: tableCellIdentifier)
            tableView!.separatorStyle = .none
            tableView!.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: TableView Extensions
extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableCellIdentifier, for: indexPath) as? CustomTableViewCell else {
            fatalError("Cell is not an instance of CustomTableViewCell")
        }
        
        cell.configureCell(arr: staticCollectionData)
        return cell
    }
}

