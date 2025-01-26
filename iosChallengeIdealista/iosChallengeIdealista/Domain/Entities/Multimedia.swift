//
//  Multimedia.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 21/1/25.
//

import Foundation

struct Multimedia: Hashable {
    let images: [ImageEntity]

    init(images: [ImageEntity]) {
        self.images = images
    }

    init(dto: MultimediaDTO) {
        self.images = dto.images.map { ImageEntity(dto: $0) }
    }
}
