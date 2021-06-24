enum TypePersonnage {
    case legionnaire
    case assassin
    case moine
    case magicien
    case barbare
}

class PersonnageExistant{
    var type : TypePersonnage
    
    init ( type : TypePersonnage){
        self.type = type
        switch type {
        case .legionnaire:
            Legionnaire.init()
        case .assassin :
            Assassin.init()
        case .moine :
            Moine.init()
        case .magicien :
            Magicien.init()
        case .barbare :
            Barbare.init()
        }
    }
}



class Jeu{
    var tableauJoueur1 :[Personnage] = [Personnage(),Personnage(),Personnage()]
    var tableauJoueur2 :[Personnage] = [Personnage(),Personnage(),Personnage()]
     

    
    func commencerLeJeu(){
        print("*******************************************************************")
        print("Bienvenue dans ce mini jeu composé de 2 joueurs!")
        print("vous allez chacun votre tour créer votre équipe de 3 personnages, joueur 1 c'est à toi !")
        print("******************************************************************")
        
        
        //on effectue le tour des 2 joueurs
        for j in 1...2 {
            print("salut joueur" + "\(j)" + " à toi de créer tes 3 personnages !")
            for i in 0...2 {
                
                //quand j = 1 le joueur n°1 entre ses personnages
                    if j == 1 {
                        
                        print("veuillez entrer votre personnage n°" + "\(i+1) ")
                            if let nom_perso = readLine(){
                                tableauJoueur1[i].name = nom_perso
                                print(" votre personnage s'appelle : " + tableauJoueur1[i].name)
                                
                                    }
                //quand j = 2 le joueur n°1 entre ses personnages
                        } else {
                            print("veuillez entrer votre personnage n°" + "\(i+1) ")
                                if let nom_perso = readLine(){
                                    tableauJoueur2[i].name = nom_perso
                                    print(" votre personnage s'appelle : " + tableauJoueur2[i].name)
                                        
                                    }
                            }
                        }
                    
    
        }
    }
}


class Personnage{
    var name = "nom_par_defaut"
    var arme = Arme(name : "hache", attaquepv : 6)
    var pv = 50
    
    init(){
        
    }
    
    //initialisation comprenant le nom, l'arme et le nombre de pv
    init(name : String, arme : Arme, pv : Int){
        self.name = name
        self.arme = arme
        self.pv = pv
    }
    
    //juste une description
    var description : String {
        return "je m'appelle \(name) mon arme est \(arme.name) et il me reste \(pv) hp !"
    }
    
    //fonction qui permet de créer un personnage
    func creerPersonnage(nom1 : String, weapon : Arme, hp : Int) -> Personnage{
        return Personnage(name : nom1, arme: weapon, pv: hp)
    }
}

class Legionnaire : Personnage {
    let type: String = "Legionnaire"
    var weapon: Arme = Epee()
    override func creerPersonnage(nom1: String, weapon: Arme, hp: Int) -> Personnage {
        return Personnage(name : self.type ,arme : self.weapon, pv : pv )
    }
}

class Assassin : Personnage {
    let type: String = "Assassin"
    var weapon: Arme = Dague()
    override func creerPersonnage(nom1: String, weapon: Arme, hp: Int) -> Personnage {
        return Personnage(name : self.type ,arme : self.weapon, pv : pv )
    }
    
}

class Moine : Personnage {
    let type: String = "Moine"
    var weapon : Arme = Baton()
    override func creerPersonnage(nom1: String, weapon: Arme, hp: Int) -> Personnage {
        return Personnage(name : self.type ,arme : self.weapon, pv : pv )
    }
    
}

class Magicien : Personnage {
    let type: String = "magicien"
    var weapon : Arme = Baton()
    override func creerPersonnage(nom1: String, weapon: Arme, hp: Int) -> Personnage {
        return Personnage(name : self.type ,arme : self.weapon, pv : pv )
    }
    
}

class Barbare : Personnage {
    let type: String = "Barbare"
    var weapon : Arme = Hache()
    override func creerPersonnage(nom1: String, weapon: Arme, hp: Int) -> Personnage {
        return Personnage(name : self.type ,arme : self.weapon, pv : pv )
    }
    
}

//classe arme permettant de créer une arme
class Arme{
    var name : String
    var attaquepv : Int
    
    init( name : String, attaquepv : Int ){
        self.name = name
        self.attaquepv = attaquepv
    }
    
    func creerUneArme(nom1 : String, attaqueHp : Int) -> Arme {
        return Arme(name: nom1, attaquepv: attaqueHp)
    }
    
}

// classe permettant de créer une hache
class Baton : Arme{
    let nomBaton : String = "Baton"
    let batonHp : Int = 8
    
    
    init(){
        super.init(name: nomBaton, attaquepv: batonHp)
    }
    
    override func creerUneArme(nom1: String, attaqueHp: Int) -> Arme {
        return Arme(name: nomBaton, attaquepv: batonHp)
    }
}


// classe permettant de créer une hache
class Hache : Arme{
    let nomHache : String = "Hache"
    let hacheHp : Int = 7
    
    
    init(){
        super.init(name: nomHache, attaquepv: hacheHp)
    }
    
    override func creerUneArme(nom1: String, attaqueHp: Int) -> Arme {
        return Arme(name: nomHache, attaquepv: hacheHp)
    }
}

// classe permenant de créer une épée
class Epee : Arme{
    let nomEpee : String = "épée"
    let epeeHp : Int = 6
    
    init(){
        super.init(name: nomEpee, attaquepv: epeeHp)
    }
    
    override func creerUneArme(nom1: String, attaqueHp: Int) -> Arme {
        return Arme(name: nomEpee, attaquepv: epeeHp)
    }
}

//une classe contenant l'arme Dague
class Dague : Arme{
    let nomDague : String = "Dague"
    let dagueHP : Int = 5
    
    init(){
        super.init(name: nomDague, attaquepv: dagueHP)
    }
    
    override func creerUneArme(nom1: String, attaqueHp: Int) -> Arme {
        return Arme(name: nomDague, attaquepv: dagueHP)
    }
}

// une classe contenant l'arme excalibur
class Excalibur : Arme{
    let nomExcalibur : String = "excalibur"
    let excaliburHP : Int = 15
    
    init(){
        super.init(name: nomExcalibur, attaquepv: excaliburHP)
    }
    
    override func creerUneArme(nom1: String, attaqueHp: Int) -> Arme {
        return Arme(name: nomExcalibur, attaquepv: excaliburHP)
    }
}

PersonnageExistant(type : .legionnaire)
