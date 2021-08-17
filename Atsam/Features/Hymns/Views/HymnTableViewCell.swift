//
//  HymnTableViewCell.swift
//  Atsam
//
//  Created by Isaac Iniongun on 17/08/2021.
//  Copyright © 2021 Iniongun Group. All rights reserved.
//

import UIKit

class HymnTableViewCell: UITableViewCell {

    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var numberView: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var hymnTitleLabel: UILabel!
    @IBOutlet weak var versesLabel: UILabel!
    
    func configureView(hymn: Hymn) {
        hymn.do {
            numberLabel.text = $0.number.string
            hymnTitleLabel.text = $0.title
            versesLabel.text = $0.allVersesString
        }
    }
    
}
