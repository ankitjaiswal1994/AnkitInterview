//
//  AISongsDetailTVCell.swift
//  AnkitInterView
//
//  Created by Ankit Jaiswal on 13/09/17.
//  Copyright © 2017 CrownStack. All rights reserved.
//

import UIKit

class AISongsDetailTVCell: UITableViewCell {

    @IBOutlet weak var songsDetailLabel: UILabel!

    static let identifier = "AISongsDetailTVCellID"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        songsDetailLabel.text = nil
    }

}
