//
//  PreferenceImpl.swift
//  Tiv Bible
//
//  Created by Isaac Iniongun on 22/05/2020.
//  Copyright © 2020 Iniongun Group. All rights reserved.
//

import Foundation
import FirebaseRemoteConfig

struct PreferenceImpl: IPreference {
    
    fileprivate let remoteConfig = RemoteConfig.remoteConfig()
    
    @UserDefaultStorage(key: PreferenceConstants.DB_INITIALIZED_KEY, default: false)
    var isDBInitialized: Bool
    
    @UserDefaultStorage(key: PreferenceConstants.STAY_AWAKE, default: false)
    var stayAwake: Bool
    
    var appVersion: String { remoteConfig.configValue(forKey: PreferenceConstants.APP_VERSION).stringValue! }
    
}
