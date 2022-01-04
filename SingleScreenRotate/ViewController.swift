//
//  ViewController.swift
//  SingleScreenRotate
//
//  Created by Nathan Furman on 28/12/2021.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    private let disposeBag = DisposeBag()

    @IBOutlet weak var btnNextPage: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        // Lock the screen to portraite only
        OrientationHandler.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribe()
    }
    
    private func subscribe() {
        btnNextPage.rx.tap.subscribe(onNext: { [unowned self] _ in
            let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let anotherController = storyBoard.instantiateViewController(withIdentifier: "AnotherViewController") as? AnotherViewController
            anotherController!.modalPresentationStyle = .fullScreen
            self.present(anotherController!, animated: true, completion: nil)
        }).disposed(by: disposeBag)
    }
}

