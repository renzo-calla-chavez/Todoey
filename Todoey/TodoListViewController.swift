//
//  ViewController.swift
//  Todoey
//
//  Created by Renzo Calla on 9/8/18.
//  Copyright © 2018 Renzo Calla. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var items = ["Find Mike","Buy Eggs","Destroy Demogorgon"]
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view, typically from a nib.
        if let itemsArray = defaults.array(forKey: "TodoListArray") as? [String] {
            items = itemsArray
        }
    }
    
    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemcell", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row]
                
        return cell
        
    }
    
    //MARK - TableViewDelegate Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(items[indexPath.row])
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.accessoryType == .checkmark {
            cell!.accessoryType = .none
        } else {
            cell!.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Items
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var alertInput = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) {
            (action) in
            // what will happen once the user clicks the Add Item button on our UIAlert
            self.items.append(alertInput.text!)
            
            self.defaults.set(self.items, forKey: "TodoListArray")
            
            self.tableView.reloadData()
            
        }
        
        
        alert.addAction(action)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Item"
            alertInput = alertTextField
        }
        present(alert,animated: true,completion: nil)
        
    }
    
}

