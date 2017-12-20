//
//  ViewController.swift
//  AnkitInterView
//
//  Created by Ankit Jaiswal on 13/09/17.
//  Copyright © 2017 CrownStack. All rights reserved.
//

import UIKit
import SDWebImage

class AIMichaelSongVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var arrDataSourceArray: [AIMichaelSongsInfo] = []

// MARK: -  View Controller Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetUp()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Michael Jackson"
    }
    
// MARK: - Initial SetUp Method

    fileprivate func initialSetUp() {
        
        self.tableView.estimatedRowHeight = 120.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
       
        self.webApiCall()
    }
    
    fileprivate func webApiCall() {
        let parameters = ["term": "Michael+jackson"]
        WebServices.searchSongsApi(parameters, success: { [weak self] arrDataSource in
            self?.arrDataSourceArray = arrDataSource
            self?.tableView.reloadData()
            }, failure: { error in
                print(error.localizedDescription)
        })

    }

// MARK: - Memory Management Methods
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: TableView DataSource Methods
extension AIMichaelSongVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDataSourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: AISongsTVCell.identifier) as? AISongsTVCell else {
            fatalError("Cell not found")
        }
        let objModal = arrDataSourceArray[indexPath.row]
        cell.trackNameLabel.text = objModal.trackName
        cell.trackSensoredLabel.text = objModal.trackCensoredName
        cell.collectionNameLabel.text = objModal.collectionCensoredName
        cell.artistImageView.sd_setImage(with: URL(string: objModal.artworkUrl100), placeholderImage: UIImage(named: "ic_my_profile_placeholder"))
        return cell
    }
}

// MARK: TableView Delegate Methods
extension AIMichaelSongVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let aiMichaelSongDetailScene = storyboard?.instantiateViewController(withIdentifier: "AIMichaelSongDetailVCID") as! AIMichaelSongDetailVC
        aiMichaelSongDetailScene.objModal = arrDataSourceArray[indexPath.row]
        navigationController?.pushViewController(aiMichaelSongDetailScene, animated: true)
    }
    
}
