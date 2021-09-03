//
//  HymnsViewModelImpl.swift
//  Atsam
//
//  Created by Isaac Iniongun on 17/08/2021.
//  Copyright © 2021 Iniongun Group. All rights reserved.
//

import Foundation
import RxSwift

class HymnsViewModelImpl: BaseViewModel, IHymnsViewModel {
    
    var hymns: PublishSubject<[Hymn]> = PublishSubject()
    fileprivate var hymnsList = [Hymn]()
    
    fileprivate var preference: IPreference
    fileprivate let datasource: IDatasource
    
    init(preference: IPreference, datasource: IDatasource) {
        self.preference = preference
        self.datasource = datasource
    }
    
    var hasUpdate: Bool { preference.appVersion > appVersion }
    
    func getHymns() {
        subscribe(datasource.getAllHymns(), success: { [weak self] hymns in
            self?.hymnsList = hymns
            self?.hymns.onNext(hymns)
        })
    }
    
    func filterHymns(text: String) {
        if text.isEmpty {
            hymns.onNext(hymnsList)
        } else if text.isNumber {
            hymns.onNext(hymnsList.filter { $0.number == text.int! })
        } else {
            hymns.onNext(hymnsList.filter { $0.title.insensitiveContains(text) || $0.allVersesString.insensitiveContains(text) })
        }
    }
    
}
