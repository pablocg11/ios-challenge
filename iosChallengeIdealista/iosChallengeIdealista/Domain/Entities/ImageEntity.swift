//
//  ImageEntity.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 21/1/25.
//

import Foundation

struct ImageEntity: Codable {
    let url: String
    let tag: String
    
    init(url: String, tag: String) {
        self.url = url
        self.tag = tag
    }
    
    init(dto: ImageDTO) {
        self.url = dto.url
        self.tag = dto.tag
    }
}
