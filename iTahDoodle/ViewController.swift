//
//  ViewController.swift
//  iTahDoodle
//
//  Created by Harshul Mulchandani on 6/25/16.
//  Copyright © 2016 Harshul Mulchandani. All rights reserved.
//

import UIKit

let todoList = TodoList()

class ViewController: UIViewController {
    
    
    @IBOutlet weak var itemTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = todoList
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addButtonPressed(sender: UIButton) {
        guard let text = itemTextField.text where !text.isEmpty else {
            return
        }
        todoList.addItem(text)
        itemTextField.text = ""
        tableView.reloadData()
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("removing")
        todoList.removeItemAtIndex(indexPath.row)
        tableView.reloadData()
    }
}







