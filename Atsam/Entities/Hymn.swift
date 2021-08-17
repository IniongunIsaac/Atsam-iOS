//
//  Hymn.swift
//  Atsam
//
//  Created by Isaac Iniongun on 17/08/2021.
//  Copyright © 2021 Iniongun Group. All rights reserved.
//

import Foundation
import RealmSwift
import AttributedStringBuilder

class Hymn: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var title: String
    @Persisted var chorus: String
    @Persisted var number: Int
    @Persisted var verses: List<String>
    
    var versesArray: [String] { verses.toArray() }
    var allVersesString: String { versesArray.joined() }
    var formattedVerses: NSAttributedString {
        let attrs = AttributedStringBuilder()
        
        for (index, verse) in versesArray.enumerated() {
            attrs.text("\(index + 1). ", attributes: [.font(.comfortaaSemiBold(size: 16)), .alignment(.center)])
                .newline()
                .text(verse, attributes: [.font(.comfortaaRegular(size: 15)), .alignment(.center)])
                .newlines(2)
        }
        
        return attrs.attributedString
    }
    
    var shareableContent: String { "\(title)\n\n\(versesArray.enumerated().map { "\($0.offset + 1). \($0.element)" }.joined(separator: "\n\n")) Chorus: \(chorus)" }
    
    convenience init(title: String, chorus: String, number: Int, verses: [String]) {
        self.init()
        self.title = title
        self.chorus = chorus
        self.number = number
        self.verses.append(objectsIn: verses)
    }
    
}
