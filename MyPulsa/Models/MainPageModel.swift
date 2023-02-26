//
//  MainPageModel.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 25/02/23.
//

import UIKit

struct MainPageModel {
    let title: String
    let viewController: UIViewController
}

let listViewController: [MainPageModel] = [
    MainPageModel(title: "Pulsa", viewController: PulsaViewController(viewModel: PulsaViewModel())),
    MainPageModel(title: "Data Package", viewController: DataPackageViewController(viewModel: DataPackageViewModel())),
]
