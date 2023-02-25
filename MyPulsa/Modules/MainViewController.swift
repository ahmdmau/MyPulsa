//
//  MainViewController.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 25/02/23.
//

import UIKit
import Tabman
import Pageboy

class MainViewController: TabmanViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Topup"
        self.navigationController?.configureSolidNavigationBar()
        
        self.dataSource = self
        let bar = TMBar.ButtonBar()
        bar.layout.contentMode = .fit
        bar.layout.transitionStyle = .snap
        bar.indicator.weight = .light
        bar.indicator.tintColor = .accentColor
    
        bar.buttons.customize { (button) in
            button.tintColor = .secondaryTextColor
            button.selectedTintColor = .accentColor
            button.font = .interSemiBoldFont(size: 14)
        }
        bar.backgroundView.style = .flat(color: .white)
        addBar(bar, dataSource: self, at: .top)
    }
    
}

extension MainViewController: PageboyViewControllerDataSource, TMBarDataSource {

    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return listViewController.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return listViewController[index].viewController
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }

    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let title = listViewController[index].title
        return TMBarItem(title: title)
    }
}
