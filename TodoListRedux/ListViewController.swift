//
//  ListViewController.swift
//  TodoListRedux
//
//  Created by Kiattisak Anoochitarom on 12/1/2559 BE.
//  Copyright © 2559 Hexter. All rights reserved.
//

import UIKit
import ReSwift

class ListViewController: UITableViewController {

    lazy var viewModel: ListViewModel =  {
        return ListViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.updateHandler = { [unowned self] in
            self.title = "\(self.viewModel.itemCount)"
            self.tableView.reloadData()
        }
    }
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        viewModel.addTodo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.itemCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        
        cell.textLabel?.text = viewModel.item(at: indexPath.row)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        viewModel.removeTodo(at: indexPath.row)
    }
}
