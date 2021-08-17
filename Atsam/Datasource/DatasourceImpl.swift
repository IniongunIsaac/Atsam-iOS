//
//  DatasourceImpl.swift
//  Atsam
//
//  Created by Isaac Iniongun on 17/08/2021.
//  Copyright © 2021 Iniongun Group. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

class DatasourceImpl: BaseRealmDatasource, IDatasource {
    
    let realm: Realm
    
    init(realm: Realm) {
        self.realm = realm
    }
    
    override var kRealm: Realm { realm }
    
    func getAllHymns() -> Observable<[Hymn]> {
        getAll(obj: Hymn.self)
    }
    
    func getHymnById(_ id: ObjectId) -> Observable<Hymn> {
        getById(obj: Hymn.self, id: id)
    }
    
    func getHymnsByTitle(_ title: String) -> Observable<[Hymn]> {
        getByPropertyList(obj: Hymn.self, property: "title", value: title)
    }
    
    func insertHymns(_ hymns: [Hymn]) -> Observable<Void> {
        insert(objs: hymns)
    }
    
    func deleteHymns(_ hymns: [Hymn]) -> Observable<Void> {
        delete(objs: hymns)
    }
    
    func deleteAllHymns() -> Observable<Void> {
        deleteAll(obj: Hymn.self)
    }
    
}
