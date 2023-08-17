//
//  GameRulesViewController.swift
//  DiceGame-PO
//
//  Created by user229774 on 2/25/23.
//

import UIKit

class GameRulesViewController: UIViewController {

    @IBOutlet var backToGameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait
    }

    @IBAction func dismissToMainPage(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
   /*
    The player starts by setting a goal  to be achieved(upto 120) within 10 rounds and a lucky number from 1 to 6.
    Until the goal and lucky number are not set you cannot start the game.
    You cannot change the selection once the game starts.
    After selecting desired game constraints, press “Start button”.
    The first round begins with the player clicking the "Roll dice" button and scores get updated according to each player’s dice total.
    If the lucky number appears on any of the two dice of any or both players, give that player +5 bonus.
    If 6 and 6 appear on the two dice of any or both players, give that player +2 bonus.
    If both dice of any or both players are equal eg)1,1 or 2,2 or 3,3 or 4,4 or 5,5, give +1 bonus.
    When any of the two players or both of them reaches the goal, the game is over and that player wins or there is a tie.
    If the goal is not met till round 10, then the game is over and no one wins.
    To restart the game, click the reset button.



    */
    

}
