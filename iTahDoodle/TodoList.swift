//
//  TodoList.swift
//  iTahDoodle
//
//  Created by Harshul Mulchandani on 6/26/16.
//  Copyright © 2016 Harshul Mulchandani. All rights reserved.
//

import UIKit

class TodoList: NSObject {
    
    private let fileURL: NSURL = {
        let documentDirectoryURLS = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        
        let documentDirectoryURL = documentDirectoryURLS.first!
        return documentDirectoryURL.URLByAppendingPathComponent("todolist.items")
    }()
    
    private var items: [String] = []
    
    override init() {
        super.init()
        loadItems()
    }
    
    func saveItems(){
        let itemsArray = items as NSArray
        
        print("saving items to \(fileURL)")
        if !itemsArray.writeToURL(fileURL, atomically: true){
            print("could not save list")
        }
    }
    
    func loadItems(){
        if let itemsArray = NSArray(contentsOfURL: fileURL) as? [String]{
            items = itemsArray
        }
    }
    
    func addItem(item:String) {
        items.append(item)
        saveItems()
    }
    
    func removeItemAtIndex(index: Int) {
        guard items.indices.contains(index) else {
            return
        }
        items.removeAtIndex(index)
        saveItems()
    }
    
}


extension TodoList: UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let item = items[indexPath.row]
        
        cell.textLabel!.text = item
        
        return cell
    }
    
}
