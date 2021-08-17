//
//  SplashViewModel.swift
//  Tiv Bible
//
//  Created by Isaac Iniongun on 24/05/2020.
//  Copyright © 2020 Iniongun Group. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift
import UIKit

class SplashViewModelImpl: BaseViewModel, ISplashViewModel {
    
    fileprivate var preference: IPreference
    fileprivate let datasource: IDatasource
    
    init(preference: IPreference, datasource: IDatasource) {
        self.preference = preference
        self.datasource = datasource
    }
    
    var showHome: PublishSubject<Bool> = PublishSubject()
    var showSetupInProgress: PublishSubject<Bool> = PublishSubject()
    
//    override func didAppear() {
//        super.didAppear()
//        //reset()
//        setupDB()
//    }
    
    fileprivate func reset() {
        let realm = try! Realm()
        debugPrint(realm.configuration.fileURL)
        try! realm.write {
            realm.deleteAll()
            preference.isDBInitialized = false
        }
    }
    
    func setupDB() {
        if preference.isDBInitialized {
            showSetupInProgress.onNext(false)
            showHome.onNext(true)
        } else {
            initializeDB()
        }
    }
    
    fileprivate func initializeDB() {
        showSetupInProgress.onNext(true)
        createAppData()
    }
    
    fileprivate func createAppData() {
        
        let hymns = try! JSONDecoder().decode([HymnData].self, from: Data(contentsOf: Bundle.main.url(forResource: "atsam_a_ikyenge", withExtension: "json")!))
            .enumerated()
            .map { Hymn(title: $0.element.title, chorus: $0.element.chorus, number: $0.offset, verses: $0.element.verses) }
        
        subscribe(datasource.insertHymns(hymns), success: { [weak self] in
            self?.preference.isDBInitialized = true
            self?.showLoading(false)
            self?.showSetupInProgress.onNext(false)
            self?.showHome.onNext(true)
        })
        
    }
    
}
