//
//  DishTableViewController.swift
//  Starter Proj
//
//  Created by Alex Thompson on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class DishTableViewController: UITableViewController {
    
    let dishController = DishController()
    var dish: Dish?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Noteworthy-Light", size: 22)!]
        self.navigationController?.navigationBar.barTintColor = .systemRed
        
    }
    
    //sdfsdfsdfsdfsdfsdfsdfsdfsdfsdf
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Add dish", message: "", preferredStyle: .alert)

        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Add dish type"
        }

        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { alert -> Void in
            let dishTextField = alertController.textFields![0] as UITextField
            let typeTextField = alertController.textFields![1] as UITextField
            
            guard let name = dishTextField.text, !name.isEmpty,
                let type = typeTextField.text, !type.isEmpty else {
                    let alert = UIAlertController(title: "Missing some fields.", message: "Check your information and try again 😀", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "👍", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
            }
                self.dishController.createNewDish(name: name, type: type)
            self.tableView.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil )

        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Dish Type"
        }

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)

        self.present(alertController, animated: true, completion: nil)

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishController.dish.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DishCell", for: indexPath)
        
        let dish = dishController.dish[indexPath.row]
        
        cell.textLabel?.text = dish.name
        cell.detailTextLabel?.text = dish.type

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let dish = dishFor(indexPath: indexPath)
            dishController.removeDish(name: dish)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }    
    }
    
    private func dishFor(indexPath: IndexPath) -> Dish {
        if indexPath.section == 0 {
            return self.dishController.dish[indexPath.row]
        } else {
            return dishController.testDish[indexPath.row]
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
