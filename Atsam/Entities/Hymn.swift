//
//  Hymn.swift
//  Atsam
//
//  Created by Isaac Iniongun on 17/08/2021.
//  Copyright © 2021 Iniongun Group. All rights reserved.
//

import Foundation
import RealmSwift

class Hymn: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var title: String
    @Persisted var chorus: String
    @Persisted var number: Int
    @Persisted var verses: List<String>
    
    init(title: String, chorus: String, number: Int, verses: [String]) {
        super.init()
        self.title = title
        self.chorus = chorus
        self.number = number
        self.verses.append(objectsIn: verses)
    }
    
}
