//
//  IPreference.swift
//  Tiv Bible
//
//  Created by Isaac Iniongun on 22/05/2020.
//  Copyright © 2020 Iniongun Group. All rights reserved.
//

import Foundation

protocol IPreference {
    
    var isDBInitialized: Bool { get set }
    
    var stayAwake: Bool { get set }
    
}
