//
//  HymnDetailsViewController.swift
//  Atsam
//
//  Created by Isaac Iniongun on 17/08/2021.
//  Copyright © 2021 Iniongun Group. All rights reserved.
//

import BottomPopup
import AttributedStringBuilder

class HymnDetailsViewController: BottomPopupViewController {

    @IBOutlet weak var numberView: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var hymnTitleLabel: UILabel!
    @IBOutlet weak var versesLabel: UILabel!
    @IBOutlet weak var shareView: UIView!
    @IBOutlet weak var copyView: UIView!
    @IBOutlet weak var chorusLabel: UILabel!
    
    var hymn: Hymn!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if currentDevice.isPad {
            numberView.cornerRadius = 40
            shareView.cornerRadius = 15
            copyView.cornerRadius = 15
        }
        
        let fontsize = (currentDevice.isPad ? 20 : 15).cgfloat
        
        hymn.do {
            numberLabel.text = $0.number.string
            hymnTitleLabel.text = $0.title
            versesLabel.attributedText = $0.formattedVerses
            if $0.chorus.isNotEmpty {
                chorusLabel.attributedText = AttributedStringBuilder()
                    .text("Chorus:", attributes: [.font(.comfortaaBold(size: fontsize)), .alignment(.center)])
                    .newline()
                    .text("\($0.chorus)", attributes: [.font(.comfortaaRegular(size: fontsize)), .alignment(.center)])
                    .attributedString
            } else {
                chorusLabel.showView(false)
            }
        }
        
        shareView.animateViewOnTapGesture { [weak self] in
            guard let self = self else { return }
            self.share(content: self.hymn.shareableContent)
        }
        
        copyView.animateViewOnTapGesture { [weak self] in
            self?.hymn.shareableContent.copyToClipboard()
            self?.showAlert(message: "Copied successfully!", type: .success)
        }
    }
    
    override var popupHeight: CGFloat { height - (currentDevice.isPad ? 150 : 100) }
    
    override var popupTopCornerRadius: CGFloat { 20 }

}
