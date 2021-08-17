//
//  IHymnsViewModel.swift
//  Atsam
//
//  Created by Isaac Iniongun on 17/08/2021.
//  Copyright © 2021 Iniongun Group. All rights reserved.
//

import Foundation
import RxSwift

protocol IHymnsViewModel: Scopable {
    
    var hymns: PublishSubject<[Hymn]> { get }
    
    func getHymns()
    
    func filterHymns(text: String)
    
}
