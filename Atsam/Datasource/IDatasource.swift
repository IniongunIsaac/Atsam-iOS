//
//  IDatasource.swift
//  Atsam
//
//  Created by Isaac Iniongun on 17/08/2021.
//  Copyright © 2021 Iniongun Group. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

protocol IDatasource {
    
    func getAllHymns() -> Observable<[Hymn]>
    
    func getHymnById(_ id: ObjectId) -> Observable<Hymn>
    
    func getHymnsByTitle(_ title: String) -> Observable<[Hymn]>
    
    func insertHymns(_ hymns: [Hymn]) -> Observable<Void>
    
    func deleteHymns(_ hymns: [Hymn]) -> Observable<Void>
    
    func deleteAllHymns() -> Observable<Void>
    
}
