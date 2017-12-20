//
//  AIMichaelSongDetailVC.swift
//  AnkitInterView
//
//  Created by Ankit Jaiswal on 13/09/17.
//  Copyright © 2017 CrownStack. All rights reserved.
//

import UIKit

class AIMichaelSongDetailVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var objModal : AIMichaelSongsInfo!

// MARK: -  View Controller Life Cycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetUp()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Detail"
    }
    
    // MARK: -  Memory Management Methods
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

// MARK: -  Initial SetUp Method
    
    func  initialSetUp() {
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
}

// MARK: TableView DataSource Methods
extension AIMichaelSongDetailVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: AISongsDetailTVCell.identifier) as? AISongsDetailTVCell else {
            fatalError("Cell not found")
        }
        
        switch indexPath.row {
        case 0:
            cell.songsDetailLabel.text = "Collection Price : "+objModal.collectionPrice
            break
        case 1:
            cell.songsDetailLabel.text = "Track Price : "+objModal.trackPrice
            break
        case 2:
            cell.songsDetailLabel.text = "Release Date : "+objModal.releaseDate
            break
        case 3:
            cell.songsDetailLabel.text = "Disc Count : "+objModal.discCount
            break
        case 4:
            cell.songsDetailLabel.text = "Disc Number : "+objModal.discNumber
            break
        case 5:
            cell.songsDetailLabel.text = "Track Count : "+objModal.trackCount
            break
        default:
            cell.songsDetailLabel.text = objModal.trackCount
            break
        }
        
        return cell
    }

}

// MARK: TableView Delegate Methods
extension AIMichaelSongDetailVC: UITableViewDelegate {

}
