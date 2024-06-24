//
//  Paths.swift
//  Lofty
//
//  Created by Adélaïde on 24/06/2024.
//

import Foundation

struct AppPaths {
    static let shared: AppPaths = AppPaths()
    
    let defaultSystemAssetsRootPath = FileManager.default.urls(for: .applicationSupportDirectory, in: .systemDomainMask).first!.appending(path: "com.apple.idleassetsd").path(percentEncoded: false)
    let defaultCustomAssetsRootPath = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!.appending(path: "Lofty").path(percentEncoded: false)
    
    let dataStorePath: URL
    
    init() {
        let systemAssetsRootURL = FileManager.default.urls(for: .applicationSupportDirectory, in: .systemDomainMask).first!.appending(path: "com.apple.idleassetsd")
        let customAssetsRootURL = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!.appending(path: "Lofty")
        
        self.dataStorePath = systemAssetsRootURL.appending(component: "Customer/entries.json")
    }
}
