//
//  HymnDetailsViewController.swift
//  Atsam
//
//  Created by Isaac Iniongun on 17/08/2021.
//  Copyright © 2021 Iniongun Group. All rights reserved.
//

import BottomPopup

class HymnDetailsViewController: BottomPopupViewController {

    @IBOutlet weak var numberView: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var hymnTitleLabel: UILabel!
    @IBOutlet weak var versesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var popupHeight: CGFloat { height - 150 }
    
    override var popupTopCornerRadius: CGFloat { 20 }

}
