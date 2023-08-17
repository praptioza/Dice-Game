//
//  ViewController.swift
//  DiceGame-PO
//
//  Created by user229774 on 2/25/23.
//

import UIKit

class ViewController: UIViewController {
//connecting outlets
    @IBOutlet var roundsLabel: UILabel!
    
    @IBOutlet var dice1ImageView: UIImageView!
    
    @IBOutlet var dice2ImageView: UIImageView!
    
    @IBOutlet var dice3ImageView: UIImageView!
    
    @IBOutlet var dice4ImageView: UIImageView!
    
    @IBOutlet var player1ScoreLabel: UILabel!
    
    @IBOutlet var player2ScoreLabel: UILabel!
    
    @IBOutlet var goalSlider: UISlider!
    
    @IBOutlet var luckyNumberStepper: UIStepper!
    
    @IBOutlet var goalLabel: UILabel!
    
    @IBOutlet var luckNumLabel: UILabel!
    
    @IBOutlet var startGameButton: UIButton!
    
    @IBOutlet var rollDiceButton: UIButton!
    
    @IBOutlet var restartGameButton: UIButton!
    
    @IBOutlet var player1Label: UILabel!
    
    @IBOutlet var player2Label: UILabel!
    
    
//setting variables to change values throughout the game
    var rounds : Int = 0
    var scorePlayer1 : Int = 0
    var scorePlayer2 : Int = 0
    var luckyNumber = 0
    var goal : Int = 0
    var diceNum1 : Int = 0
    var diceNum2 : Int = 0
    var diceNum3 : Int = 0
    var diceNum4 : Int = 0
    var result1 : Int = 0
    var result2 : Int = 0
    var maximumRounds = 10
    var winner : String = "" 
    

//setting initial text in labels on screen laod
    override func viewDidLoad() {
        super.viewDidLoad()
        roundsLabel.text = "Round : "
        player1ScoreLabel.text = "Score : 0"
        player2ScoreLabel.text = "Score : 0"
        goalLabel.text = "Set your goal"
        luckNumLabel.text = "Set a lucky number"
        rollDiceButton.setTitle("", for: .normal)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait
    }

//function that upadates the score labels for player1 and player2
    func updatePlayerScoreLabels()
    {
        player1ScoreLabel.text = "Score : \(scorePlayer1)"
        player2ScoreLabel.text = "Score : \(scorePlayer2)"
    }

//function that updates rounds label to display number of rounds played
    func updateroundsLabel()
    {
            roundsLabel.text = "Round : \(rounds) / 10"
    }
    
//fucntion that updates goal label to display the goal to be achieved in 10 rounds
    func updateGoalLabel()
    {
        goalLabel.text = "Your goal is : \(goal)"
    }
    
//function that updates the lucky number to display the luckynumber
    func updateStepperLabel()
    {
        luckNumLabel.text = "Lucky Number is : \(luckyNumber)"
    }
    
    func updateSlidderValue()
    {
        goalSlider.value = 0
    }
    
    func updateStepperValue()
    {
        luckyNumberStepper.value = 0
    }
    
 //action that triggers when roll dice button is pressed starting from round 1
    @IBAction func rollDices(_ sender: UIButton) {
        //rounds to be played are maximum 10 to  reach the goal that is set
        if (rounds > 0)
        {
            diceNum1 = 1 + Int(arc4random_uniform(6))
            diceNum2 = 1 + Int(arc4random_uniform(6))
            diceNum3 = 1 + Int(arc4random_uniform(6))
            diceNum4 = 1 + Int(arc4random_uniform(6))
            //dice image view changes randomly
            dice1ImageView.image = UIImage(named: "dice-\(String(describing: diceNum1))")
            dice2ImageView.image = UIImage(named: "dice-\(String(describing: diceNum2))")
            dice3ImageView.image = UIImage(named: "dice-\(String(describing: diceNum3))")
            dice4ImageView.image = UIImage(named: "dice-\(String(describing: diceNum4))")
            
            //add both values of the dice and store it to result variabes of respective players
            result1 = diceNum1 + diceNum2
            result2 = diceNum3 + diceNum4
            
            //check if luckyNumber appears in the dice of any of the players then give a +5 bonus to that player's score
            if (luckyNumber == diceNum1 || luckyNumber == diceNum2)
            {
               if(luckyNumber == diceNum3 || luckyNumber == diceNum4)
                {
                   result1 += 5
                   result2 += 5
               }
                else
                {
                    result1 += 5
                }
            }
            
            //check if either of the players have two sixes or if both have two sixes then givea +2 bonus
            if(diceNum1 == 6 && diceNum2 == 6)
            {
                if(diceNum3 == 6 && diceNum4 == 6)
                {
                    result1 += 2
                    result2 += 2
                }
                else
                {
                    result1 += 2
                }
            }
          
            //check if either or both of the players have same dice values other than two sixes then give a +1 bonus
            if(((diceNum1 == diceNum2)&&(diceNum1 != 6)) || ((diceNum3 == diceNum4)&&(diceNum4 != 6)))
            {
                if((diceNum1 == diceNum2)&&(diceNum3 == diceNum4))
                {
                    result1 += 1
                    result2 += 1
                }
                else if((diceNum3 == diceNum4) && (diceNum4 != 6))
                {
                  scorePlayer2 += 1
                }
                else
                {
                    scorePlayer1 += 1
                }
            }
          
            
        } //end of rounds > 0 if
        
        scorePlayer1 += result1  //score after certain number of rounds for player1
        scorePlayer2 += result2  //score after certain number of rounds for player2
        
        updatePlayerScoreLabels() //update score labels by new score values of both players after each round
        updateGoalLabel()
        
        
        //check if rounds is 10 -> if yes then game over show who wins as alert
       
       
       if(rounds >= maximumRounds)
        {
            if(scorePlayer1 >= goal && scorePlayer2 >= goal)
            {
                //calls an alert to show it is a tie
                alertBothWins()
            }
           else if(scorePlayer1 >= goal || scorePlayer2 >= goal)
           {
               //calls a function to check which player won
               whoWins()
           }
            else
            {
                //calls an alert to show that no one won
                alertNoOneWins()
            }
        }// end of >=10 rounds if
        else
        {
            if(scorePlayer1 >= goal && scorePlayer2 >= goal)
            {
                //calls an alert to show it is a tie
                alertBothWins()
            }
           else if(scorePlayer1 >= goal || scorePlayer2 >= goal)
           {
               //calls a function to check which player won
               whoWins()
           }
        }
        
      //function to check which player won
        func whoWins()
        {
            if(scorePlayer1 >= goal && scorePlayer1 > scorePlayer2)
            {
                player1Wins()
            }
            else
            {
                player2Wins()
            }
            
        }
        
        //alert function to show player 1 won
        func player1Wins()
        {
            let title = "Player 1 wins!!!"
            let alertController = UIAlertController(title: title, message:"Game Over", preferredStyle: .alert)
            //action that should happen when Try Again button is clicked in the alert
            //in this case Try Again button starts a new game from round 0 and scores are set to 0
            let alertNewGame = UIAlertAction(title: "Start New Game", style: .default, handler: {
                (action) -> Void in self.startNewGame()
            })
            alertController.addAction(alertNewGame)
            self.present(alertController, animated: true, completion: nil)
        }
        
        //alert function to show player 2 won
        func player2Wins()
        {
            let title = "Player 2 wins!!!"
            let alertController = UIAlertController(title: title, message:"Game Over", preferredStyle: .alert)
            //action that should happen when Try Again button is clicked in the alert
            //in this case Try Again button starts a new game from round 0 and scores are set to 0
            let alertNewGame = UIAlertAction(title: "Start New Game", style: .default, handler: {
                (action) -> Void in self.startNewGame()
            })
            alertController.addAction(alertNewGame)
            self.present(alertController, animated: true, completion: nil)
        }
        rounds += 1  //increments round by 1
        updateroundsLabel() //updates incremented round value
    
    }
    
    
    //function to display alert after round 10 as rounds have exceeded maximum round values and goal is not reached
    func alertNoOneWins()
        {
            let alertController = UIAlertController(title: "No One Wins!!!", message:"Game Over!", preferredStyle: .alert)
            //action that should happen when Try Again button is clicked in the alert
            //in this case Try Again button starts a new game from round 0 and scores are set to 0
            let alertNewGame = UIAlertAction(title: "Try Again", style: .default, handler: {
                (action) -> Void in self.startNewGame()
            })
            alertController.addAction(alertNewGame)
            self.present(alertController, animated: true, completion: nil)
        }
        
    //function to display alert who wins and in how many rounds out of 10
    func alertBothWins()
        {
            
            let message = "Player 1 and Player2 both met the goal in 10 rounds!"
            let alertController = UIAlertController(title: "It is a tie!!!", message: message, preferredStyle : .alert)
            //action that should happen when New Game button is clicked in the alert
            //in this case New Game button starts a new game from round 0 and scores are set to 0
            let alertNewGame = UIAlertAction(title: "Start New Game", style: .default, handler: {
                (action) -> Void in self.startNewGame()
            })
            alertController.addAction(alertNewGame)
            self.present(alertController, animated: true, completion: nil)
             
        }
 
    //action to change slider vlaue
    @IBAction func sliderSetGoal(_ sender : UISlider)
    {
     //action to set the slider value only before starting the game or else generates
        if(rounds == 0)
        {
            goal = Int(sender.value)
            updateGoalLabel()
        }
        else
        {
            afterStartGame()
         }
     }

//action to set the stepper value only before starting the game or else generates alert
    @IBAction func setLuckyNumber(_ sender : UIStepper)
    {
        if(rounds == 0)
        {
            luckyNumber = Int(sender.value)
            updateStepperLabel()
        }
        else
        {
            afterStartGame()
        }
    }

    
//action to press button during round 0 i.e load of game and only after setting the goal and lucky number to some values
    @IBAction func startGame(_ sender: Any) {
        if(rounds == 0)
        {
            if(goal == 0)
            {
                if(luckyNumber == 0)
                {
                    cannotStart()
                }
                else
                {
                    cannotStart()
                }
            }
            else if (luckyNumber == 0)
            {
                cannotStart()
            }
            else
            {
                rounds+=1
                rollDiceButton.setTitle("Roll Dice", for: .normal)
                updateroundsLabel()
            }
        }
    }

//fucntion to show an alert if you try to change the slider or stepper values after starting the game i.e after round 1 is started / start game is pressed
func afterStartGame()
    {
        let alert = UIAlertController(title: "Cannot change!", message: "Goal and lucky number can be set only before starting the game", preferredStyle:  .alert)
        let alertAction = UIAlertAction(title: "Continue", style: .default, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
//function to how alert if either or both of the goal and lucky number are not set before pressing the start game button
func cannotStart()
    {
        let alert = UIAlertController(title: "Set Values", message: "Set goal and lucky number before starting the game!", preferredStyle:  .alert)
        let alertAction = UIAlertAction(title: "Continue", style: .default, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
//action triggered when restart button is clicked
    @IBAction func restartGame(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Restart Game", message: "Are you sure?", preferredStyle: .alert)
        //action that should happen when Yes button is clicked in the alert
        //in this case Yes button starts new game from round 0 and scores set to 0
        let alertRestart = UIAlertAction(title: "Yes", style: .default, handler: {
            (action) -> Void in self.startNewGame()
        })
        //action that should happen when No button is clicked
        //in this case dismiss alert and continue playing
        let dismissAlert = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alertController.addAction(alertRestart)
        alertController.addAction(dismissAlert)
        self.present(alertController, animated: true, completion: nil)
    }
 

//function that is called when Yes is clicked in the restart game alert
//it sets roounds and scores to 0 and starts a new game
    func startNewGame()
        {
            rounds = 0
            scorePlayer1 = 0
            scorePlayer2  = 0
            goal = 0
            luckyNumber = 0
            diceNum1 = 0
            diceNum2 = 0
            diceNum3 = 0
            diceNum4 = 0
            result1 = 0
            result2 = 0
            updateroundsLabel()
            updatePlayerScoreLabels()
            updateGoalLabel()
            updateStepperLabel()
            updateSlidderValue()
            updateStepperValue()
            rollDiceButton.setTitle("", for: .normal)
            
            //alse set slidder and stepper values to initial
            
        }
    
}


