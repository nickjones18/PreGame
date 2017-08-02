//
//  ViewController.swift
//  PreGame
//
//  Created by Nicholas Jones on 2017-02-13.
//  Copyright © 2017 Nicholas Jones. All rights reserved.
//

import UIKit

class GameTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func searchButton(_ sender: UIBarButtonItem) {
        let searchBar = UISearchBar()
        self.navigationItem.titleView = searchBar
    }
    
    // Reference other classes
    var gameData : GameData = GameData()
    var games : [Game] = []
    var database : Database = Database()
    
    override func viewDidLoad() {
        
        database.printDB()
        
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        // Make a new reference to the games data
        games = gameData.games

    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Unselect the previously selected row
        if tableView.indexPathForSelectedRow != nil {
            tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Set a destination
        if segue.identifier == "showGameDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! GameDetailViewController
                //destinationController.game = games[indexPath.row] FIX
                destinationController.gameName = [database.gameNames[indexPath.row]]
                destinationController.gameDescription = [database.gameDescriptions[indexPath.row]]
                destinationController.previousIndexPathRow = indexPath.row
                destinationController.previousViewController = "GameTableViewController"
            }
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let favorite = UITableViewRowAction(style: .normal, title: "Favorite") { action, index in
            self.games[indexPath.row].favorite = true
        }
        favorite.backgroundColor = UIColor.lightGray
        return [favorite]
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return number of rows in section
        return database.gameNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! GameTableViewCell
        
        var letters : String = database.gameMaterials[indexPath.row]
        
        if letters.hasPrefix("1"){
            cell.materialImage1.image = UIImage(named: "CupMaterialFilled")
        } else if letters.hasPrefix("2") {
            cell.materialImage1.image = UIImage(named: "BallMaterialFilled")
        } else if letters.hasPrefix("3") {
            cell.materialImage1.image = UIImage(named: "CardsMaterialFilled")
        } else if letters.hasPrefix("4") {
            cell.materialImage1.image = UIImage(named: "DicelMaterialFilled")
        } else if letters.hasPrefix("5") {
            cell.materialImage1.image = UIImage(named: "CoinsMaterialFilled")
        } else if letters.hasPrefix("6") {
            cell.materialImage1.image = UIImage(named: "ShotGlassMaterialFilled")
        } else if letters.hasPrefix("7") {
            cell.materialImage1.image = UIImage(named: "PokerChipsMaterialFilled")
        }
        
        if letters.characters.count > 1 {
        let index = letters.characters.index(letters.startIndex, offsetBy: 1)
        let startChar = letters[index]
            if startChar == "1" {
                cell.materialImage2.image = UIImage(named: "CupMaterialFilled")
            } else if startChar == "2" {
                cell.materialImage2.image = UIImage(named: "BallMaterialFilled")
            } else if startChar == "3" {
                cell.materialImage2.image = UIImage(named: "CardsMaterialFilled")
            } else if startChar == "4" {
                cell.materialImage2.image = UIImage(named: "DicelMaterialFilled")
            } else if startChar == "5" {
                cell.materialImage2.image = UIImage(named: "CoinsMaterialFilled")
            } else if startChar == "6" {
                cell.materialImage2.image = UIImage(named: "ShotGlassMaterialFilled")
            } else if startChar == "7" {
                cell.materialImage2.image = UIImage(named: "PokerChipsMaterialFilled")
            }
        }
        
        if letters.characters.count > 2 {
            let index = letters.characters.index(letters.startIndex, offsetBy: 2)
            let startChar = letters[index]
            if startChar == "1" {
                cell.materialImage3.image = UIImage(named: "CupMaterialFilled")
            } else if startChar == "2" {
                cell.materialImage3.image = UIImage(named: "BallMaterialFilled")
            } else if startChar == "3" {
                cell.materialImage3.image = UIImage(named: "CardsMaterialFilled")
            } else if startChar == "4" {
                cell.materialImage3.image = UIImage(named: "DicelMaterialFilled")
            } else if startChar == "5" {
                cell.materialImage3.image = UIImage(named: "CoinsMaterialFilled")
            } else if startChar == "6" {
                cell.materialImage3.image = UIImage(named: "ShotGlassMaterialFilled")
            } else if startChar == "7" {
                cell.materialImage3.image = UIImage(named: "PokerChipsMaterialFilled")
            }
        }
        
        

        
        
        
        

        
        
        
        // Update the cell content for each row that was returned
        cell.nameLabel.text = database.gameNames[indexPath.row]
        //cell.thumbnailImageView.image = UIImage(named: games[indexPath.row].image)
        cell.playersLabel.text = database.gamePlayers[indexPath.row]
        //descriptionLabel.text = games[indexPath.row].description
        //instructionsLabel.text = games[indexPath.row].instructions
        //cell.materialsLabel.text = database.gameMaterials[indexPath.row]
        
        return cell
        
    }
}

