//
//  WallpaperEntries.swift
//  Lofty
//
//  Created by Adélaïde on 24/06/2024.
//

import Foundation

struct WallpaperStore: Codable{
    let localizationVersion: String
    let initialAssetCount: Int
    var assets: Array<WallpaperAsset>
    var categories: Array<WallpaperCategory>
    let version: Int
}

struct WallpaperAsset: Codable{
    let localizedNameKey: String
    let shotID: String
    let showInTopLevel: Bool
    let preferredOrder: Int
    let pointsOfInterest: Dictionary<String, String>
    var previewImage: String
    let accessibilityLabel: String
    let id: String
    let includeInShuffle: Bool
    var subcategories: Array<String>
    let categories: Array<String>

    let url4KSDR240FPS: String
    enum CodingKeys: String, CodingKey {
        case url4KSDR240FPS = "url-4K-SDR-240FPS"
        case localizedNameKey
        case shotID
        case showInTopLevel
        case preferredOrder
        case pointsOfInterest
        case previewImage
        case accessibilityLabel
        case id
        case includeInShuffle
        case subcategories
        case categories
    }
}

struct WallpaperCategory: Codable{
    let id: String
    let preferredOrder: Int
    var previewImage: String
    let localizedNameKey: String
    let representativeAssetID: String
    let localizedDescriptionKey: String
    var subcategories: Array<WallpaperSubcategory>
}

struct WallpaperSubcategory: Codable, Identifiable{
    var previewImage: String
    let preferredOrder: Int
    var representativeAssetID: String
    var id: String
    var localizedNameKey: String
    var localizedDescriptionKey: String
}
