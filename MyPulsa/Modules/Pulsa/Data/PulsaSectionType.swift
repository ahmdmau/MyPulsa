//
//  PulsaSectionType.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 26/02/23.
//

import Foundation
import RxDataSources

enum PulsaItemView {
    case listPulsa(data: PulsaModel)
    case promos(data: [PromoModel])
    case empty
}

enum PulsaViewSection {
    case listPulsaSection(items: [PulsaItemView])
    case promoSection(item: [PulsaItemView])
    case emptySection(item: PulsaItemView)
}

extension PulsaViewSection: SectionModelType {
    
    typealias Item = PulsaItemView
    
    var items: [PulsaItemView] {
        switch self {
        case .listPulsaSection(let items):
            return items
        case .promoSection(let items):
            return items
        case .emptySection(let item):
            return [item]
        }
    }
    
    init(original: PulsaViewSection, items: [PulsaItemView]) {
        self = original
    }
    
}
