//
//  ViewController.swift
//  Todoey
//
//  Created by Renzo Calla on 9/8/18.
//  Copyright © 2018 Renzo Calla. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let items = ["Find Mike","Buy Eggs","Destroy Demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        // Do any additional setup after loading the view, typically from a nib.
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
    
    

}

