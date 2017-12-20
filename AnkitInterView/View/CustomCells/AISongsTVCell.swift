//
//  AISongsTVCell.swift
//  AnkitInterView
//
//  Created by Ankit Jaiswal on 13/09/17.
//  Copyright © 2017 CrownStack. All rights reserved.
//

import UIKit

class AISongsTVCell: UITableViewCell {

    @IBOutlet weak var artistImageView: UIImageView!
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var trackSensoredLabel: UILabel!
    
    static let identifier = "AISongsTVCellID"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        artistImageView.image = nil
        collectionNameLabel.text = nil
        trackNameLabel.text = nil
        trackSensoredLabel.text = nil
    }

}
