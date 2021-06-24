//create a Game
class Game{
    // 2 array where teams will be stocked
    private var Player1Team :[Character] = [Character(),Character(),Character()]
    private var Player2Team :[Character] = [Character(),Character(),Character()]
    
    // count the number of rounds
    private var roundsGame = 1
    
    //create an array with all characters
    private var allCharacters : [Character] = [Legionnary(),Barbaric(),Assassin(),Magician(),Monk()]
    
    
    // ask the number of character in list
    //if the number is not correct, ask again the question
    // j is the current player
    // i is the current character
    private func selectYourCharacter(j : Int , i : Int){
        var playerChosen: Character?
        
        while playerChosen == nil {

           guard let number = readLine(),
                 let choiceNumber = Int(number),
                 choiceNumber > 0 && choiceNumber <= allCharacters.count else {
            playerChosen = nil
            print ("veuillez entrer un nombre entre 1 et \(allCharacters.count)")
                continue
               }
            
            if j == 1 {
                Player1Team[i] = allCharacters[choiceNumber-1].copyCharacter()
            } else {
                Player2Team[i] = allCharacters[choiceNumber-1].copyCharacter()
            }
            
        playerChosen = allCharacters[choiceNumber-1]
           
        }
}
    
    // return true if the name already attributed else return false
    func existName(name : String) -> Bool {
        for i in 0..<Player1Team.count{
            if name == Player1Team[i].name {
                return true
            }
            for i in 0..<Player2Team.count{
                if name == Player2Team[i].name {
                    return true
                }
            }
        }
        return false
    }
    
   // ask the name of the current caracter
   // if the nama already exist, ask again a name
    private func CharacterName(j : Int, i : Int){
        // var bool = false
        // if a character name already exist bool = True
        var bool = false
        
        while bool == false {

            guard let nameChoice = readLine(),
            !existName(name: nameChoice)
                  
           else {
            print ("veuillez entrer un nom différent de ceux déjà existants")
                continue
               }
            
            if j == 1 {
                Player1Team[i].name = nameChoice
                 print(Player1Team[i].create_Description())
            } else {
                Player2Team[i].name = nameChoice
                print(Player2Team[i].create_Description())
            }
            bool = true
    }
 
}
    
    // print a summary of the 2 teams
    // use the 2 array for print statistics team 1 and 2
    // this function will be used when 2 teams are created and when the game is finished
    private func resume_2_Teams(){
        print("Pour résumer les deux équipes :")

                print("")
                print("joueur 1 :")
        
                for i in 0...2{
                print(Player1Team[i].shortDescription())
                }
                print("")
                print("joueur 2 :")
        
                for i in 0...2{
                print(Player2Team[i].shortDescription())
                }
    }
    
    // ask to 2 players to make their team
    private func team_Constructor(){
        print("")
        print("*******************************************************************")
        print("Bienvenue dans ce mini jeu composé de 2 joueurs!")
        print("Vous allez chacun votre tour créer votre équipe de 3 personnages")
        print("******************************************************************")
        print("")
        
        // j is the current Player
        for j in 1...2{
            // characters presentation
            print("")
            print("Salut Joueur\(j) à toi de créer tes 3 personnages ! !")
            print("Vous pouvez choisir l'un de ces personnages, tapez le numéro correspondant")
            for x in 0..<allCharacters.count{
                print("\(x+1). : \(allCharacters[x].name) possède \(allCharacters[x].hp) hp et un(e) \(allCharacters[x].weapon.name) qui tape \(allCharacters[x].weapon.hp_Attack)")
            }
            
            // 3 turns for create 3 characters
            // i is the currently character that is being created
            for i in 0...2 {
                
                print("Création du personnage n°\(i+1) : ")
                SelectYourCharacter(j : j , i: i)
                
                print("Veuillez donner un nom à votre personnage n°\(i+1) : ")
                CharacterName( j : j , i : i)
                
            }
 
        }
        
        // we use this function for show the 2 teams
        resume_2_Teams()
    }
  
 
    
    //function for know if all character in a team are dead
    //if one of the 2 teams are dead return false, else return True
    private func one_Team_Death_Or_Not(array1 : [Character], array2 : [Character]) -> Bool{
        return ((((array1[0].hp + array1[1].hp + array1[2].hp) != 0)) && (((array2[0].hp + array2[1].hp + array2[2].hp) != 0)) )
    }
    
    func showTeam(j : Int){
        print("")
        if j == 1 {
            for i in 0..<Player1Team.count {
                print("\(i+1) : \(Player1Team[i].shortDescription())")
            }
        } else {
            for i in 0..<Player2Team.count {
                print("\(i+1) : \(Player2Team[i].shortDescription())")
            }
        }
    }
    
    
    // ask the player, the character who equipe the new weapon
    // the player can choice "none" if the weapon is weak
    // j is the current player
    // weapon is the new weapon in the treasure
    private func ChangeWeapon(weapon : Weapon ,j: Int){
        var playerChosen: Int?
        
        while playerChosen == nil {
            showTeam(j: j)
            print("\(Player1Team.count+1) : aucun, cette arme est nulle !")
            
           guard let number = readLine(),
                 let choiceNumber = Int(number),
                 choiceNumber > 0 && choiceNumber <= Player1Team.count+1 else {
            playerChosen = nil
            print ("veuillez entrer un nombre entre 1 et \(Player1Team.count+1)")
                continue
               }
            if choiceNumber == Player1Team.count+1 {
                print("l'arme a été jeté à la poubelle !")
                break
            }
            if j == 1 {
                Player1Team[choiceNumber-1].weapon = weapon
            } else {
                Player2Team[choiceNumber-1].weapon = weapon
            }
            
        playerChosen = choiceNumber
           
        }
        
    }
    
    // this function can create a random weapon
    // ask the player who will equipe this new weapon
    // (few weapon doesn't exist in character select, only in the code, like excalibur)
    private func EquipWeaponTreasure(j : Int){
        
        //create a random weapon
        let number_Weapon = Int.random(in : 1..<7)
        var weapon = Weapon()
        
        switch number_Weapon {
        case 1 :
            weapon = Axe()
        case 2 :
            weapon = Dagger()
        case 3 :
            weapon = Stick()
        case 4 :
            weapon = Excalibur()
        case 5 :
            weapon = Sword()
        case 6 :
            weapon = Wood_Sword()
        default :
         print("ça n'arrivera pas")
        }
        
        print("***************************************")
        print("Quelle chance Joueur\(j) un trésor magique vient d'apparaitre devant vous !")
        print("Il contient : \(weapon.name) , attaque : \(weapon.hp_Attack) ")
        print("Sur quel personnage voulez vous l'équiper?" )
        print("****************************************")
        
        // select a character who will attribuate a new weapon
        // the player can select "none", the new weapon is destroyed
        ChangeWeapon(weapon : weapon , j : j )
        
    }
    
    
    
    
    // this function can create a random treasure
    // this function is excuted 10% of time
    private func treasureRandom(j : Int){
        let number = Int.random(in : 0..<7)

        // if the random number is 6 then a treasure appears, else nothing
        if number == 6 {

            // ask player who will get the new weapon
            EquipWeaponTreasure(j: j)
 
        }
    }
    
    // ask player who will do the action
    // if the number isn't 1 2 or 3, ask again the question
    // j is the current player
    private func selectCharacterAction(j : Int) -> Character {
       
        // ask current player to select a character
         print("")
         print("A toi Joueur\(j) quel personnage va effectuer une action?")
         showTeam(j: j)
        
        var playerChosen: Character?
        
        while playerChosen == nil {

           guard let number = readLine(),
                 let choiceNumber = Int(number),
                 choiceNumber > 0 && choiceNumber <= Player1Team.count else {
            playerChosen = nil
            print ("veuillez entrer un nombre entre 1 et \(Player1Team.count)")
                continue
               }
            
            if j == 1 {
                if Player1Team[choiceNumber-1].hp != 0 {
                print("Vous avez sélectionné le personnage \(Player1Team[choiceNumber-1].name)")
                    playerChosen = Player1Team[choiceNumber-1] }
                else {
                    print("Vous ne pouvez pas sélectionner ce personnage, il est mort")
                    playerChosen = nil
                }

            } else {
                if Player2Team[choiceNumber-1].hp != 0 {
                print("Vous avez sélectionné le personnage \(Player2Team[choiceNumber-1].name)")
                    playerChosen = Player2Team[choiceNumber-1]
                } else {
                    print("Vous ne pouvez pas sélectionner ce personnage, il est mort")
                    playerChosen = nil
                }
            }
       
        }
        return playerChosen!
    }
    
    // ask player who will execute the action
    // j is the current player
    // character_Selected is defined in the previous function
    private func selectAction() -> Int {
        
        print("")
        print("Quelle action veux tu effectuer?")
        print("1 : Soigner un de mes personnage")
        print("2 : Attaquer un personnage ennemi")
        print("")
        
        var action: Int?
        
        while action == nil {

           guard let number = readLine(),
                 let choiceNumber = Int(number),
                 choiceNumber > 0 && choiceNumber <= 2 else {
            action = nil
            print ("veuillez entrer un nombre entre 1 et \(allCharacters.count)")
                continue
               }
            action = choiceNumber
        }
        return action!
    }
    
    // ask to the player, the target
    // recursive_Question_Select_Action is used here, for ask the action
    // j is the currently player
    // character_Selected is defined in the previous function
    private func selectTarget( j : Int){
        let characterSelect = selectCharacterAction(j: j)
        let action = selectAction()
        
        var choice: Int?
        
        if j == 1 {
            if action == 1 {
                print("Quel personnage voulez vous soigner?")
                showTeam(j: action)
            } else {
                print("Quel personnage voulez vous attaquer?")
                showTeam(j: action)
            }
        } else if j == 2 {
            if action == 1 {
                print("Quel personnage voulez vous soigner?")
                showTeam(j: action+1)
            } else {
                print("Quel personnage voulez vous attaquer?")
                showTeam(j: action-1)
            }
        }
        
        while choice == nil {

           guard let number = readLine(),
                 let choiceNumber = Int(number),
                 choiceNumber > 0 && choiceNumber <= Player1Team.count else {
            choice = nil
            print ("veuillez entrer un nombre entre 1 et \(Player1Team.count)")
                continue
               }
            if j == 1 {
                if action == 1 {
                characterSelect.heal(character_Heal: Player1Team[choiceNumber-1])
                } else if action == 2{
                characterSelect.attack(character_Target: Player2Team[choiceNumber-1])
                }
            } else if j == 2{
                if action == 1 {
                characterSelect.heal(character_Heal: Player2Team[choiceNumber-1])
                } else if action == 2{
                characterSelect.attack(character_Target: Player1Team[choiceNumber-1])
                }
            }
            
            choice = choiceNumber
        }
    }

// this function is the only public function
// this function can be used for start a new game
public func startGame(){
    
    //function where the 2 players create their team
    team_Constructor()
    
    print("")
    print("Maintenant que les équipes sont créées, place à la bataille !")
    print("")
    
        
        while one_Team_Death_Or_Not(array1: Player1Team, array2: Player2Team) {
            print("Tour n° \(roundsGame) :")
            roundsGame += 1
            for j in 1...2 {
                // a treasure MAYBE appears
                // a treasure has a random weapon
                   treasureRandom(j: j)
                    
                    // ask current player to select a target
                    selectTarget( j : j)
                    
                    // test if one of he two team is dead
                    // if not, the game continue
                    // else the game is finished
                    if !(one_Team_Death_Or_Not(array1: Player1Team, array2: Player2Team)){
                        print("Vous avez tué tout ses personnages ! ")
                        print("Le Joueur \(j) à gagné ! félicitations !")
                        print("")
                        resume_2_Teams()
                        print("")
                        print("Il a fallu \(roundsGame-1) tours pour terminer ce mini jeu ! ")
                        break
                    }
            }
        }

}
}



// class Character
// name is the character name
// weapon is the weapon
// hp is the current hp
class Character  {
    var name : String
    var weapon : Weapon {
        willSet{
            
        }
        didSet{
            print("Le personnage \(name) possède désormais un(e) \(weapon.description())")
        }
    }
    var hp = 50 {
        willSet{
            
        }
        didSet{
            // if the hp are negative
            // print "character is dead", then hp = 0
            if hp <= 0{
                print("")
                print("Le personnage \(name) est mort il lui reste 0 hp")
                print("")
                hp = 0
            // a character has hp_max
            // hp can't be superior than hp_max, so if hp>hp_max then hp = hp_max
            } else if hp > hp_Max() {
                print("")
                print("Votre personnage \(name) est au maximum de ses hp max il possède désormais \(hp_Max()) hp ")
                hp = hp_Max()
                print("")
            }
            // if oldValue < hp then print "the character earn hp"
            else if oldValue < hp {
                print("")
                print("Votre personnage a récupéré \(abs(oldValue - hp)) hp il possède désormais \(hp) hp")
                print("")
            // if oldValue > hp then "print character lost hp"
            } else if oldValue > hp{
                print("")
                print("Le personnage \(name) a perdu \(abs(hp - oldValue)) hp ! il lui reste \(hp) hp")
                print("")
            }
        }
    }
    
    //create a character with a name, a weapon and hp
    init(name : String, weapon : Weapon, hp : Int){
        self.name = name
        self.weapon = weapon
        self.hp = hp
    }
    
    //create a character without name, name, hp
    // defaults Values
    convenience init(){
        self.init(name : "nom_Par_Defaut", weapon : Weapon(), hp : 50)
    }
    
    // return hp_max
    func hp_Max() -> Int {
        return hp
    }
    
    // a description of the character that has just been created
    func create_Description() -> String {
        return (" vous venez de créer \(name) son arme est un(e) \(weapon.name) qui tape \(weapon.hp_Attack) et il possède \(hp) hp !")
    }
    
    // a short description of character
    // show "name : hp, weapon : attack"
    func shortDescription() -> String {
        return ("\(name) : \(hp) hp, arme : \(weapon) ( \(weapon.hp_Attack) dégats)")
    }
    
    //attack an enemy
    func attack(character_Target : Character){
        character_Target.hp -= weapon.hp_Attack
    }
    
    //heal an ally
    func heal(character_Heal : Character){
        character_Heal.hp += weapon.hp_Attack
    }
    
    func copyCharacter() -> Character {
        let newCharacter = Character()
        return newCharacter
    }
    
}

// class Legionnary
class Legionnary : Character{
    let type: String = "Legionnaire"
    let max_Hp = 45
    
    init(){
    let type: String = type
    let weapon: Weapon = Sword()
        
    super.init(name: type, weapon: weapon, hp: max_Hp)
    }
        
    override func shortDescription() -> String {
        return ("\(name) : \(hp) hp, arme : \(weapon.name) ( \(weapon.hp_Attack) dégats )")
    }
    
    override func create_Description() -> String{
        return ("vous venez de créer \(name) qui est un \(type) , son arme est un(e) \(weapon.name) qui tape \(weapon.hp_Attack) et il possède \(hp) hp !")
    }
    
     override func hp_Max() -> Int {
        return max_Hp
    }
    
    override func copyCharacter() -> Character {
        let newCharacter = Legionnary()
        return newCharacter
    }
}

//class Assassin
class Assassin : Character {
    let type: String = "Assassin"
    let max_Hp = 30
    
    init(){
    let type: String = type
    let weapon: Weapon = Dagger()
        
    super.init(name: type, weapon: weapon, hp: max_Hp)
    }
        
    override func shortDescription() -> String {
        return ("\(name) : \(hp) hp, arme : \(weapon.name) ( \(weapon.hp_Attack) dégats )")
    }
    
    override func create_Description() -> String {
        return ("vous venez de créer \(name) qui est un \(type) , son arme est un(e) \(weapon.name) qui tape \(weapon.hp_Attack) et il possède \(hp) hp !")
    }
    
     override func hp_Max() -> Int {
        return max_Hp
    }
    
    override func copyCharacter() -> Character {
        let newCharacter = Assassin()
        return newCharacter
    }
}

// class Monk
class Monk : Character {
    let type: String = "Moine"
    let max_Hp = 60
    
    init(){
    let type: String = type
    let weapon: Weapon = Scepter()
        
    super.init(name: type, weapon: weapon, hp: max_Hp)
    }
        
    override func shortDescription() -> String {
        return ("\(name) : \(hp) hp, arme : \(weapon.name) ( \(weapon.hp_Attack) dégats )")
    }
    
    override func create_Description() -> String {
        return ("vous venez de créer \(name) qui est un \(type) , son arme est un(e) \(weapon.name) qui tape \(weapon.hp_Attack) et il possède \(hp) hp !")
    }
    
     override func hp_Max() -> Int {
        return max_Hp
    }
    
    override func copyCharacter() -> Character {
        let newCharacter = Monk()
        return newCharacter
    }
}

// class Magician
class Magician : Character {
    let type: String = "Magicien"
    let max_Hp = 40
    
    init(){
    let type: String = type
    let weapon: Weapon = Stick()
        
    super.init(name: type, weapon: weapon, hp: max_Hp)
    }
        
    override func shortDescription() -> String {
        return ("\(name) : \(hp) hp, arme : \(weapon.name) ( \(weapon.hp_Attack) dégats )")
    }
    
    override func create_Description() -> String {
        return ("vous venez de créer \(name) qui est un \(type) , son arme est un(e) \(weapon.name) qui tape \(weapon.hp_Attack) et il possède \(hp) hp !")
    }
    
     override func hp_Max() -> Int {
        return max_Hp
    }
    
    override func copyCharacter() -> Character {
        let newCharacter = Magician()
        return newCharacter
    }
}

//classe Barbaric
class Barbaric : Character {
    let type: String = "Barbare"
    let max_Hp = 35
    
    init(){
    let type: String = type
    let weapon: Weapon = Axe()
        
    super.init(name: type, weapon: weapon, hp: max_Hp)
    }
        
    override func shortDescription() -> String {
        return ("\(name) : \(hp) hp, arme : \(weapon.name) ( \(weapon.hp_Attack) dégats )")
    }
    
    override func create_Description() -> String {
        return ("vous venez de créer \(name) qui est un \(type) , son arme est un(e) \(weapon.name) qui tape \(weapon.hp_Attack) et il possède \(hp) hp !")
    }
    
     override func hp_Max() -> Int {
        return max_Hp
    }
    
    override func copyCharacter() -> Character {
        let newCharacter = Barbaric()
        return newCharacter
    }
}


//class Weapon
// name is the name of the weapon
// hp_Attack is the damages of this weapon
class Weapon{
    var name : String
    var hp_Attack : Int
    
    //create a weapon with a name and and attack number
    init( name : String , hp_Attack : Int){
        self.name = name
        self.hp_Attack = hp_Attack
    }
    
    //create a weapon without name and attack number
    //defaults Values
    convenience init(){
        self.init(name : "nom_Par_Défaut", hp_Attack : 0 )
    }
    
    // description of the weapon, return a String
    func description() -> String {
        return ("\(name) (attaque : \(hp_Attack))")
    }
}

//class Stick
class Stick : Weapon{
    
    init(){
        super.init(name: "bâton", hp_Attack: 13)
    }
    
}


// class Axe
class Axe : Weapon{
    
    init(){
        super.init(name: "hache", hp_Attack: 15)
    }

}

// class Sword
class Sword : Weapon{
    
    init(){
        super.init(name: "epee", hp_Attack: 11)
    }
}

// class Wood_Sword
class Wood_Sword : Weapon{
    
    init(){
        super.init(name: "epee en bois", hp_Attack: 1)
    }
}

// class Dagger
class Dagger : Weapon{
    
    init(){
        super.init(name: "dague", hp_Attack: 19)
    }
}

//class Scepter
class Scepter : Weapon{
    
    init(){
        super.init(name: "sceptre", hp_Attack: 7)
    }
}

// class excalibur
class Excalibur : Weapon{
    
    init(){
        super.init(name: "excalibur", hp_Attack: 40)
    }
}


var jeu = Game()
jeu.startGame()

