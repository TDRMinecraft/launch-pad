//
//  MainViewController.swift
//  Launch Pad
//
//  Created by Daniel Jilg on 17.02.18.
//  Copyright © 2018 breakthesystem. All rights reserved.
//

import AppKit

class MainViewController: NSTabViewController {
    let ckanClient = CKANClient(pyKanAdapter: PyKanAdapter())

    lazy var welcomeSheetViewController: NSViewController = {
        return self.storyboard!.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "WelcomeSheetViewController"))
            as! NSViewController
    }()

    override func viewDidAppear() {
        super.viewDidAppear()
        if !ckanClient.isFullyInitialized() {
            self.presentViewControllerAsSheet(welcomeSheetViewController)
        }
    }
}
