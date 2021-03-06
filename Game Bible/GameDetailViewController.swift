//
//  GameDetailViewController.swift
//  PreGame
//
//  Created by Nicholas Jones on 2017-02-23.
//  Copyright © 2017 Nicholas Jones. All rights reserved.
//

import UIKit

class GameDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Reference other classes
    var filterTableView : FilterTableViewController = FilterTableViewController()
    
    var game : Game!
    var gameName : [String] = []
    var gameDescription : [String] = []
    var previousIndexPathRow = 0
    var filteredGames : [Game] = []
    var previousViewController = ""
    
    // Reference the database class
    var database : Database = Database()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var gameImageView: UIImageView!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        database.printDB() // THIS IS PRINTING THE DATABASE EVERY TIME THE SCREEN IS SHOWN...?????????
        
        // Update the game details
        
        if previousViewController == "GameTableViewController" {
            title = database.gameNames[previousIndexPathRow]
        } else if previousViewController == "FilterTableViewController" {
            title = filteredGames[previousIndexPathRow].name
        } else {
            // FavoriteTableViewController
        }
        
        //gameImageView.image = UIImage(named: game.image) FIX
        
        // Change the colours of the view
        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
        
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! GameDetailTableViewCell
        
     // Configure the cell...
    switch indexPath.row {
        
    case 0:
        cell.fieldLabel.text = "Name"
        if previousViewController == "GameTableViewController" {
            cell.valueLabel.text = database.gameNames[previousIndexPathRow]
        } else if previousViewController == "FilterTableViewController" {
            cell.valueLabel.text = filteredGames[previousIndexPathRow].name
        } else {
            // FavoriteTableViewController
        }
        
    case 1:
        cell.fieldLabel.text = "Players"
        if previousViewController == "GameTableViewController" {
            cell.valueLabel.text = database.gameNames[previousIndexPathRow]
        } else if previousViewController == "FilterTableViewController" {
            cell.valueLabel.text = filteredGames[previousIndexPathRow].name
        } else {
            // FavoriteTableViewController
        }
        
    case 2:
        cell.fieldLabel.text = "Description"
        if previousViewController == "GameTableViewController" {
            cell.valueLabel.sizeToFit()
            cell.valueLabel.text = database.gameDescriptions[previousIndexPathRow]
        } else if previousViewController == "FilterTableViewController" {
            cell.valueLabel.text = filteredGames[previousIndexPathRow].name
        } else {
            // FavoriteTableViewController
        }
        
    case 3:
        cell.fieldLabel.text = "Instructions"
        if previousViewController == "GameTableViewController" {
            cell.valueLabel.text = database.gameNames[previousIndexPathRow]
        } else if previousViewController == "FilterTableViewController" {
            cell.valueLabel.text = filteredGames[previousIndexPathRow].name
        } else {
            // FavoriteTableViewController
        }
        
    default:
        cell.fieldLabel.text = "Default Field"
        if previousViewController == "GameTableViewController" {
            cell.valueLabel.text = database.gameNames[previousIndexPathRow]
        } else if previousViewController == "FilterTableViewController" {
            cell.valueLabel.text = filteredGames[previousIndexPathRow].name
        } else {
            // FavoriteTableViewController
        }
        
    }
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
}
