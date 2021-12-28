//
//  AnotherViewController.swift
//  SingleScreenRotate
//
//  Created by Nathan Furman on 28/12/2021.
//

import UIKit
import RxCocoa
import RxSwift

class AnotherViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    @IBOutlet weak var btnDrop: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Lock the screen to all orientations
        OrientationHandler.lockOrientation(.allButUpsideDown)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Lock the screen to portrait back again
        OrientationHandler.lockOrientation(.portrait, andRotateTo: .portrait)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        subscribe()
    }
    
    private func subscribe() {
        btnDrop.rx.tap.subscribe(onNext: { [unowned self] _ in
            self.dismiss(animated: true, completion: nil)
        }).disposed(by: disposeBag)
    }
}
