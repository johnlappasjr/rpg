class Game {
  var experience: [Int] = [0, 500, 1500, 6000, 30000, 100000] 

  func level(player: Player) {
    player.level += 1
    print("\(player.name) has leveled to \(player.level)!")
    player.strength = player.level * player.strength
    player.maxHP = player.maxHP * 2
    player.currentHP = player.maxHP
  }
  
  func attack(attacker: Player, attackedPlayer: Player) {
    let damage = Int.random(in: 0 ... attacker.strength)
    print(" \(attacker.name) attacks \(attackedPlayer.name) for \(damage) damage points!")
    attackedPlayer.currentHP -= damage
  }

  func gainExperience(player: Player, enemy: Player) {
    var battleExperience = enemy.level * 500
    player.experience += battleExperience
    print(" \(player.name) has gained \(battleExperience) experience points in battle!")
    if player.experience >= experience[player.level] {
      level(player: player)
    }
  }

  init(){}

}


class Player: CustomStringConvertible {
  var name: String
  var strength: Int
  var maxHP: Int
  var currentHP: Int
  var level: Int
  var experience: Int
  
  var description: String { 
    return 
  """
  name: \(name)
  strength: \(strength)
  currentHP: \(currentHP)
  level: \(level)
  experience: \(experience)
  """
  }

  init(name: String, strength: Int = 25, maxHP: Int = 50, currentHP: Int = 50, level: Int = 1, experience: Int = 0) {
    self.name = name
    self.strength = strength
    self.maxHP = maxHP
    self.currentHP = currentHP
    self.level = level
    self.experience = experience
  }
}

class Application {
  static func run() {
    let game = Game()
    let newPlayer = Player(name: "John")
    let enemyPlayer = Player(name: "Badass")
    
   // if newPlayer.level < 3, newPlayer.currentHP > 0 {
     for index in 1 ... 15 {
      print(newPlayer.description)
      print(enemyPlayer.description)

      while newPlayer.currentHP >= 0 && enemyPlayer.currentHP >= 0 {
        game.attack(attacker: newPlayer, attackedPlayer: enemyPlayer)
        if enemyPlayer.currentHP >= 0 && newPlayer.currentHP >= 0 {
          game.attack(attacker: enemyPlayer, attackedPlayer: newPlayer)
          }
        }

      if enemyPlayer.currentHP <= 0 {
        game.gainExperience(player: newPlayer, enemy: enemyPlayer)
        }
      print(newPlayer.description)
      print(enemyPlayer.description)
      print("Round is over! RESET!")
      enemyPlayer.currentHP = enemyPlayer.maxHP
      }
     // }
    }
  
}

Application.run()