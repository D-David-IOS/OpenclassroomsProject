class Game{
    // deux tableau qui permettent de stocker l'équipe de chaque joueur
    private var array_player1_team :[Character] = [Character(),Character(),Character()]
    private var array_player2_team :[Character] = [Character(),Character(),Character()]
    
    private var rounds_game = 1
    
    // on initialise chaque personnage du jeu dans une constante pour accéder plus facilement à leurs données
    private let legionnary = Legionnary.init()
    private let barbaric = Barbaric.init()
    private let assassin = Assassin.init()
    private let magician = Magician.init()
    private let monk = Monk.init()
    
    //une variable permettant de garder en stock un personnage sélectionné
    //par exemple le joueur choisi un personnage 2, on doit la garder en stock le temps qu'il choisisse l'action à effectuer et sur qui
    private var select_character = 0
    
    // une fonction récursive qui permet de traiter si le joueur ne rentre pas un nombre entre 1 et 5
    // j correspond au joueur actuel sélectionnant ses personnages
    // i correspond au numéro du personnage qui va être créé
     private func recursive_question_select_your_character(j : Int, i : Int){
        if j == 1{
            if let number = readLine(){
                // Si le joueur 1 rentre un nombre entre 1 et 5, un personnage est créé dans le tableau
                // Si le joueur 1 rentre n'importe quoi la question est reposée
                    switch number {
                        case "1" :
                            array_player1_team[i] = Legionnary.init()
                        case "2" :
                            array_player1_team[i] = Barbaric.init()
                        case "3" :
                            array_player1_team[i] = Assassin.init()
                        case "4" :
                            array_player1_team[i] = Magician.init()
                        case "5" :
                            array_player1_team[i] = Monk.init()
                        default :
                            print("je n'ai pas compris votre choix, veuillez insérer un nombre entre 1 et 5")
                            recursive_question_select_your_character(j : j, i: i)
                        }
                }
            } else if j == 2 {
                // Si le joueur 2 rentre un nombre entre 1 et 5, un personnage est créé dans le tableau
                // Si le joueur 2 rentre n'importe quoi la question est reposée
                if let numero = readLine(){
                        switch numero {
                            case "1" :
                                array_player2_team[i] = Legionnary()
                            case "2" :
                                array_player2_team[i] = Barbaric()
                            case "3" :
                                array_player2_team[i] = Assassin.init()
                            case "4" :
                                array_player2_team[i] = Magician.init()
                            case "5" :
                                array_player2_team[i] = Monk.init()
                            default :
                                print("je n'ai pas compris votre choix, veuillez insérer un nombre entre 1 et 5")
                                recursive_question_select_your_character(j : j, i: i)
                            }
                }
            }
    }
    
    /* Fonction récursive qui demande de donner un nom au personnage sélectionné
     si le joueur donne un nom déjà existant, la question est reposée autant de fois que necessaire
     j correspond au joueur actuel donnant un nom à son personnage
     i correspond au numéro du personnage créé dans le tableau */
    private func recursive_question_about_your_character_name(j : Int, i : Int){
        //le joueur 1 donne un nom a son personnage
        if j == 1{
        if let character_name = readLine(){
            switch character_name{
            // on compare le nom donné avec tout les noms déjà présent dans les deux tableau
            // si il existe la question est reposée
            case array_player1_team[0].name , array_player1_team[1].name , array_player1_team[2].name , array_player2_team[0].name , array_player2_team[1].name , array_player2_team[2].name  :
                print("Vous avez donné un nom déjà existant, veuillez lui donner un autre nom !")
                recursive_question_about_your_character_name(j : j, i: i)
            default :
            //ici le nom du personnage entré n'existe pas donc le nom est attribué au personnage dans le tableau
                array_player1_team[i].name = character_name
                print("\(array_player1_team[i].create_description()) ")
            }
        }
        }
        // le joueur 2 donne un nom a son personnage
        else if j == 2 {
            if let character_name = readLine(){
                switch character_name{
                case array_player1_team[0].name , array_player1_team[1].name , array_player1_team[2].name , array_player2_team[0].name , array_player2_team[1].name , array_player2_team[2].name :
                    print("Vous avez donné un nom déjà existant, veuillez lui donner un autre nom !")
                    recursive_question_about_your_character_name(j : j, i: i)
                default :
                    array_player2_team[i].name = character_name
                    print("\(array_player2_team[i].create_description()) ")
                }
            }
        }
    }
    
    //résumé des deux équipes
    //la fonction parcours les deux tableaux pour afficher les statistiques
    //on utilise la méthode shortDescription() pour afficher un résumé des personnages présent dans le tableau
    private func resume_2_teams(){
        print("pour résumer les deux équipes :")
        for j in 1...2{
            switch j{
            case 1 :
                print("")
                print("joueur 1 :")
                for i in 0...2{
                print(array_player1_team[i].shortDescription())
            }
            case 2 :
                print("")
                print("joueur 2 :")
                for i in 0...2{
                print(array_player2_team[i].shortDescription())
            }
                
            // ici la case défault ne sera jamais utilisée car i sera toujours égal a 1 ou 2
            default:
                print("ça n'arrivera jamais")
            }
        }
    }
    
    // fonction qui permer de demander aux 2 joueurs de rentrer leur 2 équipes respectables
    // ces deux équipes sont rangées chacune dans un tableau de Personnages
    private func team_constructor(){
        print("")
        print("*******************************************************************")
        print("Bienvenue dans ce mini jeu composé de 2 joueurs!")
        print("vous allez chacun votre tour créer votre équipe de 3 personnages")
        print("******************************************************************")
        print("")
        
        //on effectue le tour des 2 joueurs
        //j correspond au Joueur correspondant
        for j in 1...2 {
            
            // présentation des personnages disponibles
            print("")
            print("salut Joueur\(j) à toi de créer tes 3 personnages ! !")
            print("Vous pouvez choisir l'un de ces personnages, tapez le numéro correspondant")
            print("1 : legionnaire possède \(legionnary.max_hp) pv et possède un(e) \(legionnary.weapon.name) qui tape \(legionnary.weapon.hp_attack)")
            print("2 : barbare possède \(barbaric.hp) pv et possède un(e) \(barbaric.weapon.name) qui tape \(barbaric.weapon.hp_attack)")
            print("3 : assassin possède \(assassin.hp) pv et possède un(e) \(assassin.weapon.name) qui tape \(assassin.weapon.hp_attack)")
            print("4 : magicien possède \(magician.hp) pv et possède un(e) \(magician.weapon.name) qui tape \(magician.weapon.hp_attack)")
            print("5 : moine possède \(monk.hp) pv et possède un(e) \(monk.weapon.name) qui tape \(monk.weapon.hp_attack)")
            print("")
            
            
            //i correspond au n° de personnage en cours de création
            for i in 0...2 {
                
                //quand j = 1 le joueur n°1 entre ses personnages
                print("création du personnage n°\(i+1) : ")
                        
                        // demande au joueur1 de choisir un personnage avec le numéro correspondant
                        recursive_question_select_your_character(j : j , i : i)
                        
                        print("veuillez donner un nom à votre personnage n°\(i+1), attention il doit etre différent du nom des personnages créé dans cette partie !")
                        
                        //demande au joueur 1 de donner un nom, si ce nom existe déjà, redemande au joueur de donner un nom
                        recursive_question_about_your_character_name(j : j , i: i)

                        }
                        
        }
        
        // on affiche un résumé des 2 équipes
        resume_2_teams()
        
    }
    
    //une fonction qui permet de tester si tout les personnages d'une équipe sont décédées
    //si les deux équipes sont en vie : renvoie True, si une équipe est décédée renvoie False
    private func one_team_death_or_not(tab1 : [Character], tab2 : [Character]) -> Bool{
        return ((((tab1[0].hp + tab1[1].hp + tab1[2].hp) != 0)) && (((tab2[0].hp + tab2[1].hp + tab2[2].hp) != 0)) )
    }
    
    // fonction permettant de demander au joueur, quel personnage se verra attribué une nouvelle arme
    // ici il est possible d'en choisir aucun si le joueur juge que l'arme est médiocre, ou si il a pitié de son adversaire
    // le numéro entré correspond au numéro du personnage dans le tableau, ce dernier changer d'arme pour la nouvelle
    // j est le joueur actuel
    // weapon est l'arme rentré en paramètre dans la fonction (celle que contient le trésor ! (fonction trésor plus bas))
    private func select_character_change_weapon(weapon : Weapon ,j: Int){
        // tour du joueur 1
        if j == 1 {
            print("1 : \(array_player1_team[0].shortDescription())")
            print("2 : \(array_player1_team[1].shortDescription())")
            print("3 : \(array_player1_team[2].shortDescription())" )
            print("4 : aucun, cette arme est nulle !")
            
            
        if let number = readLine(){
                switch number {
                case "1" :
                    array_player1_team[0].weapon = weapon
                    print("le personnage \(array_player1_team[0].name) possède désormais comme arme : \(weapon.name) , attaque : \(weapon.hp_attack) ")
                case "2" :
                    array_player1_team[1].weapon = weapon
                    print("le personnage \(array_player1_team[1].name) possède désormais comme arme : \(weapon.name) , attaque : \(weapon.hp_attack) ")
                case "3" :
                    array_player1_team[2].weapon = weapon
                    print("le personnage \(array_player1_team[2].name) possède désormais comme arme : \(weapon.name) , attaque : \(weapon.hp_attack) ")
                    
                // l'arme n'a pas été acceptée, aucune action ne sera réalisée.
                case "4" :
                    print("l'arme a été jeté à la poubelle ! ")
                    
                // si le joueur entre autre chose que 1 2 3 4 alors la question est reposée/
                default :
                    print("je n'ai pas compris votre choix, veuillez entrer un nombre entre 1 et 4")
                    select_character_change_weapon(weapon : weapon,  j : j)
                }
        }
        }  else if j == 2 {
            
            print("1 : \(array_player2_team[0].shortDescription())")
            print("2 : \(array_player2_team[1].shortDescription())")
            print("3 : \(array_player2_team[2].shortDescription())")
            print("4 : aucun, cette arme est nulle !")
            
            if let numero = readLine(){
                switch numero {
                case "1" :
                    array_player1_team[0].weapon = weapon
                    print("le personnage \(array_player2_team[0].name) possède désormais comme arme : \(weapon.name) , attaque : \(weapon.hp_attack) ")
                case "2" :
                    array_player1_team[1].weapon = weapon
                    print("le personnage \(array_player2_team[1].name) possède désormais comme arme : \(weapon.name) , attaque : \(weapon.hp_attack) ")
                case "3" :
                    array_player1_team[2].weapon = weapon
                    print("le personnage \(array_player2_team[2].name) possède désormais comme arme : \(weapon.name) , attaque : \(weapon.hp_attack) ")
                    
                // l'arme n'a pas été acceptée, aucune action ne sera réalisée.
                case "4" :
                    print("l'arme a été jeté à la poubelle ! ")
                    
                // si le joueur entre autre chose que 1 2 3 4 alors la question est reposée
                default :
                    print("je n'ai pas compris votre choix, veuillez entrer un nombre entre 1 et 4")
                    select_character_change_weapon(weapon : weapon, j : j)
                }

                
            }
        }

        
    }
    
    // Cette fonction permet de créer une arme aléatoire parmis celles présente dans le jeu
    // Ensuite elle demande au joueur, quel personnage va l'équiper
    // (certaines armes ne sont pas présentes dans la sélection des personnages)
    private func who_equip_new_weapon_tresor(j : Int){
        
        //créé une arme aléatoire
        let number_weapon = Int.random(in : 1..<7)
        var weapon = Weapon(name: "aucun_nom", hp_attack: 5)
        
        switch number_weapon {
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
        print("il contient : \(weapon.name) , attaque : \(weapon.hp_attack) ")
        print("sur quel personnage voulez vous l'équiper?" )
        print("****************************************")
        
        // le joueur sélectionne le personnage à qui attribuer une arme
        // il peut choisir de l'attribuer a aucun de ses personnages
        select_character_change_weapon(weapon : weapon , j : j )
        
    }
    
    // une fonction qui permet de créer un coffre au tour d'un personnage
    // cette fonction a une chance sur 10 de s'executer
    private func tresor_random(j : Int){
        let number = Int.random(in : 0..<10)

        // si le nombre aléatoire est égal a 6 alors un coffre apparait, sinon rien ne se passe
        if number == 6 {

            //demande au joueur à quel personnage attribuer son arme
            who_equip_new_weapon_tresor(j: j)

            
        }
    }
    
    //fonction qui permet de choisir un personnage qui va effectuer l'action
    //si le Joueur entre un nombre différent de 1, 2 , 3 alors la question est reposée
    //j représente le joueur actuel
    private func recursive_question_select_character_action(j : Int){
        // tour du joueur 1
        if j == 1 {
            
            print("")
            print("à toi Joueur\(j) quel personnage va effectuer une action?")
            print("1 : \(array_player1_team[0].shortDescription())")
            print("2 : \(array_player1_team[1].shortDescription())")
            print("3 : \(array_player1_team[2].shortDescription())")
           
        // le joueur 1 sélectionne le personnage souhaité
        // ce choix est enregistré dans la variable select_character pour la suite des choix (action et personnage cible)
        if let numero = readLine(){
                switch numero {
                case "1" :
                    if array_player1_team[0].hp != 0 {
                    print("Vous avez sélectionné le personnage \(array_player1_team[0].name)")
                    select_character = 0
                    } else {
                        print("vous ne pouvez pas sélectionner ce personnage, il est mort")
                        recursive_question_select_character_action(j : j)
                    }
                case "2" :
                    if array_player1_team[1].hp != 0 {
                    print("Vous avez sélectionné le personnage \(array_player1_team[1].name)")
                    select_character = 1
                    } else {
                        print("vous ne pouvez pas sélectionner ce personnage, il est mort")
                        recursive_question_select_character_action(j : j)
                    }
                case "3" :
                    if array_player1_team[2].hp != 0 {
                    print("Vous avez sélectionné le personnage \(array_player1_team[2].name)")
                    select_character = 2
                    } else {
                        print("vous ne pouvez pas sélectionner ce personnage, il est mort")
                        recursive_question_select_character_action(j : j)
                    }
                default :
                    print("je n'ai pas compris votre choix, veuillez entrer un nombre entre 1 et 3")
                    recursive_question_select_character_action(j : j)
                }
        }
       
        // tour du joueur 2
        } else if j == 2 {
            
            
            print("")
            print("à toi Joueur\(j) quel personnage va effectuer une action?")
            print("1 : \(array_player2_team[0].shortDescription())")
            print("2 : \(array_player2_team[1].shortDescription())")
            print("3 : \(array_player2_team[2].shortDescription())")
            
            if let numero = readLine(){
                    switch numero {
                    case "1" :
                        if array_player2_team[0].hp != 0 {
                        print("Vous avez sélectionné le personnage \(array_player2_team[0].name)")
                        select_character = 0
                        } else {
                            print("vous ne pouvez pas sélectionner ce personnage, il est mort")
                            recursive_question_select_character_action(j : j)
                        }
                    case "2" :
                        if array_player2_team[1].hp != 0 {
                        print("Vous avez sélectionné le personnage \(array_player2_team[1].name)")
                        select_character = 0
                        } else {
                            print("vous ne pouvez pas sélectionner ce personnage, il est mort")
                            recursive_question_select_character_action(j : j)
                        }
                    case "3" :
                        if array_player2_team[2].hp != 0 {
                        print("Vous avez sélectionné le personnage \(array_player2_team[2].name)")
                        select_character = 0
                        } else {
                            print("vous ne pouvez pas sélectionner ce personnage, il est mort")
                            recursive_question_select_character_action(j : j)
                        }
                    default :
                        print("je n'ai pas compris votre choix, veuillez entrer un nombre entre 1 et 3")
                        recursive_question_select_character_action(j : j)
                    }
            }
            
        }
    }
    
    //fonction qui permet de demander le personnage qui fera l'action
    // choice et le numéro du personnage sélectionné
    // j est le numéro du joueur
    // character_selected est le personnage sélectionné dans la première partie (personnage qui va effectuer l'action)
    private func recursive_question_select_action(choice : String, j : Int, character_selected : Int){
        

        
        // tour du joueur 1
        if j == 1 {
            
            
            // le joueur 1 choisit l'action soigner, l'action s'effectue donc sur un des personnages de son équipe
            if choice == "1"{
        if let number = readLine(){
                switch number {
                case "1" :
                    array_player1_team[character_selected].soigner(perso_soin: array_player1_team[0])
                case "2" :
                    array_player1_team[character_selected].soigner(perso_soin: array_player1_team[1])
                case "3" :
                    array_player1_team[character_selected].soigner(perso_soin: array_player1_team[2])
                // repose la question si le joueur entre quelque chose de différent de 1, 2 , 3
                default :
                    print("je n'ai pas compris votre choix veuillez écrire un nombre entre 1 et 3")
                    recursive_question_select_action( choice : "1", j : j, character_selected : character_selected)
                }
        }
            // le joueur 1 choisit l'action attaquer, l'action s'effectue donc sur un des personnages de l'équiper adverse
            } else if choice == "2" {
                if let numero = readLine(){
                        switch numero {
                        case "1" :
                            array_player1_team[character_selected].attaquer(perso_cible: array_player2_team[0])
                        case "2" :
                            array_player1_team[character_selected].attaquer(perso_cible: array_player2_team[1])
                        case "3" :
                            array_player1_team[character_selected].attaquer(perso_cible: array_player2_team[2])
                        // repose la question si le joueur entre quelque chose de différent de 1, 2 , 3
                        default :
                            print("je n'ai pas compris votre choix veuillez écrire un nombre entre 1 et 3")
                            recursive_question_select_action( choice : "2", j : j, character_selected : character_selected)
                        }
                }
                
            }
            
        } else if j == 2 {

            
            // le joueur 2 choisit l'action soigner, l'action s'effectue donc sur un des personnages de son équipe
            if choice == "1"{
        if let numero = readLine(){
                switch numero {
                case "1" :
                    array_player2_team[character_selected].soigner(perso_soin: array_player2_team[0])
                case "2" :
                    array_player2_team[character_selected].soigner(perso_soin: array_player2_team[1])
                case "3" :
                    array_player2_team[character_selected].soigner(perso_soin: array_player2_team[2])
                // repose la question si le joueur entre quelque chose de différent de 1, 2 , 3
                default :
                    print("je n'ai pas compris votre choix veuillez écrire un nombre entre 1 et 3")
                    recursive_question_select_action( choice : "1", j : j, character_selected : character_selected)
                }
        }
            // le joueur 2 choisit l'action attaquer, l'action s'effectue donc sur un des personnages de l'équiper adverse
            } else if choice == "2" {
                if let numero = readLine(){
                        switch numero {
                        case "1" :
                            array_player2_team[character_selected].attaquer(perso_cible: array_player1_team[0])
                        case "2" :
                            array_player2_team[character_selected].attaquer(perso_cible: array_player1_team[1])
                        case "3" :
                            array_player2_team[character_selected].attaquer(perso_cible: array_player1_team[2])
                        default :
                            // repose la question si le joueur entre quelque chose de différent de 1, 2 , 3
                            print("je n'ai pas compris votre choix veuillez écrire un nombre entre 1 et 3")
                            recursive_question_select_action( choice : "2", j : j, character_selected : character_selected)
                        }
                }
                
            }
        }
        
    }
    
    // fontion qui permet de demander a l'utilisateur le personnage ciblé
    // dans cette fonction on appelle la fonction recursive_question_select_action pour choisir l'action a effectuer
    // j correspond au numéro du joueur
    // character_selected correspond au numéro du personnage qui va effectuer l'action (mit en mémoire précédemment)
    private func recursive_question_select_character_target( j : Int, character_selected : Int){
        // tour du joueur 1
        if j == 1 {
        if let number = readLine(){
                switch number {
                        case "1" :
                            print("Quel personnage voulez vous soigner?")
                            print("1 : \(array_player1_team[0].name) ( \(array_player1_team[0].hp) hp )")
                            print("2 : \(array_player1_team[1].name) ( \(array_player1_team[1].hp) hp )")
                            print("3 : \(array_player1_team[2].name) ( \(array_player1_team[2].hp) hp )")
                                
                            // on appelle la fonction pour demander quelle action effectuer
                            recursive_question_select_action(choice : number, j : j , character_selected : character_selected)
                
                
                
                        case "2" :
                            print("Quel personnage voulez vous attaquer?")
                            print("1 : \(array_player2_team[0].name) ( \(array_player2_team[0].hp) hp )")
                            print("2 : \(array_player2_team[1].name) ( \(array_player2_team[1].hp) hp )")
                            print("3 : \(array_player2_team[2].name) ( \(array_player2_team[2].hp) hp )")
                            
                            // on appelle la fonction pour demander quelle action effectuer
                            recursive_question_select_action(choice : number,  j : j , character_selected : character_selected)
                       
                        // si le joueur entre un nombre différent de 1 et 2 alors la question est reposée
                        default :
                            print("je n'ai pas compris votre choix, veuillez écrire un nombre entre 1 et 2")
                            recursive_question_select_character_target(j : j , character_selected : character_selected)
                }
            }
        // tour du joueur 2
        } else if j == 2 {
                if let number = readLine(){
                        switch number {
                                case "1" :
                                    print("Quel personnage voulez vous soigner?")
                                    print("1 : \(array_player2_team[0].name) ( \(array_player2_team[0].hp) hp )")
                                    print("2 : \(array_player2_team[1].name) ( \(array_player2_team[1].hp) hp )")
                                    print("3 : \(array_player2_team[2].name) ( \(array_player2_team[2].hp) hp )")
                                        
                                    // on appelle la fonction pour demander quelle action effectuer
                                    recursive_question_select_action(choice : number, j : j , character_selected : character_selected)
                        
                        
                        
                                case "2" :
                                    print("Quel personnage voulez vous attaquer?")
                                    print("1 : \(array_player1_team[0].name) ( \(array_player1_team[0].hp) hp )")
                                    print("2 : \(array_player1_team[1].name) ( \(array_player1_team[1].hp) hp )")
                                    print("3 : \(array_player1_team[2].name) ( \(array_player1_team[2].hp) hp )")
                                    
                                    // on appelle la fonction pour demander quelle action effectuer
                                    recursive_question_select_action(choice : number ,  j : j , character_selected : character_selected)
                               
                                // si le joueur entre un nombre différent de 1 et 2 alors la question est reposée
                                default :
                                    print("je n'ai pas compris votre choix, veuillez écrire un nombre entre 1 et 2")
                                    recursive_question_select_character_target(j : j , character_selected : character_selected)
                    }
                }
            }
    }
    
    // fonction qui permet de commencer le jeu quand les équipes sont créées
    public func start_game(){
        
        //les deux joueurs vont créer leur équipes
        team_constructor()
        
        print("")
        print("Maintenant que les équipes sont créées, place à la bataille !")
        print("")
        
        // tant que les deux équipes sont en vie le while continue
        while one_team_death_or_not(tab1: array_player1_team, tab2: array_player2_team) {
            print("Tour n° \(rounds_game) :")
            rounds_game += 1
            for j in 1...2 {
                // affiche peut être un tresor en début de tour
                // il contient une arme aléatoire le joueur peut choisir quel personnage va l'équiper
                   tresor_random(j: j)
                    
                   // demande au joueur1 quel personnage il va utiliser, plusieurs fois si necessaire
                    recursive_question_select_character_action(j : j)
                    

                    print("")
                    print("Quelle action veux tu effectuer?")
                    print("1 : Soigner un de mes personnage")
                    print("2 : Attaquer un personnage ennemi")
                    print("")
                
                    recursive_question_select_character_target( j : j , character_selected : select_character)
                    
                    if !(one_team_death_or_not(tab1: array_player1_team, tab2: array_player2_team)){
                        print("Vous avez tué tout ses personnages ! ")
                        print("le Joueur \(j) à gagné ! félicitations !")
                        print("")
                        resume_2_teams()
                        print("")
                        print("Il a fallu \(rounds_game) tours pour terminer ce mini jeu ! ")
                        break
                    }
            }
        }
        
    }
    
    
}


class Character{
    var name = "nom_par_defaut"
    var weapon = Weapon(name : "hache", hp_attack : 6)
    
    // on observe la valeur hp, celà permettra d'afficher si un joueur gagne de la vie, perds de la vie
    // ou bien si il est mort, ou à atteint son seul de pv max
    var hp = 50 {
        willSet{
            
        }
        didSet{
            if hp <= 0{
                print("")
                print("Le personnage \(name) est mort il lui reste 0 hp")
                print("")
                hp = 0
            } else if hp > hp_max() {
                print("")
                print("Le personnage \(name) est au maximum de ses hp max il possède désormais \(hp_max()) hp ")
                hp = hp_max()
                print("")
            }
            else if oldValue < hp {
                print("")
                print("Votre personnage a récupéré \(abs(oldValue - hp)) hp il possède désormais \(hp) hp")
                print("")
            } else if oldValue > hp{
                print("")
                print("Le personnage \(name) a perdu \(abs(hp - oldValue)) hp ! il lui reste \(hp) hp")
                print("")
            }
        }
    }
    
    
    
    //initialisation comprenant le nom, l'arme et le nombre de pv
    init(name : String, weapon : Weapon, hp : Int){
        self.name = name
        self.weapon = weapon
        self.hp = hp
    }
    
    convenience init(){
        self.init(name : "nom par défaut", weapon : Axe(), hp : 50)
    }
    
    
    func shortDescription() -> String {
        return "\(name) : \(hp) hp, arme : \(weapon) ( \(weapon.hp_attack) dégats)"
    }
    
    //juste une description
    func create_description() -> String {
        return " vous venez de créer \(name) son arme est un(e) \(weapon.name) qui tape \(weapon.hp_attack)  et il possède \(hp) hp !"
    }
    
    func hp_max() -> Int {
        return hp
    }
    
    //permet d'attaquer le personnage ciblé
    func attaquer(perso_cible : Character){
        perso_cible.hp -= weapon.hp_attack
    }
    
    //permet de soigner le personnage ciblé
    func soigner(perso_soin : Character){
        perso_soin.hp += weapon.hp_attack
    }
}


class Legionnary : Character {
    let type: String = "Legionnaire"
    let max_hp = 45
    
    init(){
    let type: String = type
    let weapon: Weapon = Sword()
        
    super.init(name: type, weapon: weapon, hp: max_hp)
    }
        
    override func shortDescription() -> String {
        return "\(name) : \(hp) hp, arme : \(weapon.name) ( \(weapon.hp_attack) dégats )"
    }
    
    override func create_description() -> String{
        return "vous venez de créer \(name) qui est un \(type) , son arme est un(e) \(weapon.name) qui tape \(weapon.hp_attack)  et il possède \(hp) hp !"    }
    
     override func hp_max() -> Int {
        return max_hp
    }
}

class Assassin : Character {
    let type: String = "Assassin"
    let max_hp = 30
    
    init(){
    let type: String = "Assassin"
    let weapon: Weapon = Dagger()
    super.init(name: type, weapon: weapon, hp: max_hp)
    }
    
    override func shortDescription() -> String {
        return "\(name) : \(hp) hp, arme : \(weapon.name) ( \(weapon.hp_attack) dégats )"
    }
    
    
    override func create_description() -> String{
        return "vous venez de créer \(name) qui est un \(type) , son arme est un(e) \(weapon.name) qui tape \(weapon.hp_attack)  et il possède \(hp) hp !"
        
    }
    
    override func hp_max() -> Int {
       return max_hp
   }
}

class Monk : Character {
    let type: String = "Moine"
    let max_hp = 60
    
    init(){
    let type: String = "Moine"
    let weapon : Weapon = Scepter()
        
    super.init(name: type, weapon: weapon, hp: max_hp)
    }
    override func shortDescription() -> String {
        return "\(name) : \(hp) hp, arme : \(weapon.name) ( \(weapon.hp_attack) dégats )"
    }
    override func create_description() -> String{
        return "vous venez de créer \(name) qui est un \(type) , son arme est un(e) \(weapon.name) qui tape \(weapon.hp_attack)  et il possède \(hp) hp !"
        
    }
    
    override func hp_max() -> Int {
       return max_hp
   }
}

class Magician : Character {
    let type: String = "Magicien"
    let max_hp = 40
    
    init(){
    let type: String = "magicien"
    let weapon : Weapon = Stick()
    super.init(name: type, weapon: weapon, hp: max_hp)
    }
    override func shortDescription() -> String {
        return "\(name) : \(hp) hp, arme : \(weapon.name) ( \(weapon.hp_attack) dégats )"
    }
    override func create_description() -> String{
        return "vous venez de créer \(name) qui est un \(type) , son arme est un(e) \(weapon.name) qui tape \(weapon.hp_attack)  et il possède \(hp) hp !"
        
    }
    
    override func hp_max() -> Int {
       return max_hp
   }
}

class Barbaric : Character {
    let type: String = "Barbare"
    let max_hp = 35
    
    init(){
    let type: String = "Barbare"
    let weapon : Weapon = Axe()
        
    super.init(name: type, weapon: weapon, hp: max_hp)
    }
    
    override func shortDescription() -> String {
        return "\(name) : \(hp) hp, arme : \(weapon.name) ( \(weapon.hp_attack) dégats )"
    }
    override func create_description() -> String{
        return "vous venez de créer \(name) qui est un \(type) , son arme est un(e) \(weapon.name) qui tape \(weapon.hp_attack)  et il possède \(hp) hp !"
        
    }
    
    override func hp_max() -> Int {
       return max_hp
   }
    
}

//classe arme permettant de créer une arme
class Weapon{
    var name : String
    var hp_attack : Int
    
    
    init( name : String, hp_attack : Int ){
        self.name = name
        self.hp_attack = hp_attack
    }
    
    func description() {
        print("\(name) , attaque : \(hp_attack)")
    }
    
}

// classe permettant de créer une hache
class Stick : Weapon{
    let name_stick : String = "Baton"
    let stick_hp : Int = 13
    
    
    init(){
        super.init(name: name_stick, hp_attack: stick_hp)
    }
    
}


// classe permettant de créer une hache
class Axe : Weapon{
    let name_axe : String = "Hache"
    let axe_hp : Int = 15
    
    
    init(){
        super.init(name: name_axe, hp_attack: axe_hp)
    }

}

// classe permenant de créer une épée
class Sword : Weapon{
    let name_sword : String = "épée"
    let sword_hp : Int = 11
    
    init(){
        super.init(name: name_sword, hp_attack: sword_hp)
    }
}

// classe permenant de créer une épée en bois
class Wood_Sword : Weapon{
    let name_wood_sword : String = "épée en bois"
    let wood_sword_hp : Int = 1
    
    init(){
        super.init(name: name_wood_sword, hp_attack: wood_sword_hp)
    }
}

//une classe contenant l'arme Dague
class Dagger : Weapon{
    let dagger_name : String = "dague"
    let dagger_hp : Int = 19
    
    init(){
        super.init(name: dagger_name, hp_attack: dagger_hp)
    }
}

//une classe contenant l'arme septre
class Scepter : Weapon{
    let scepter_name : String = "sceptre"
    let scepter_hp : Int = 7
    
    init(){
        super.init(name: scepter_name, hp_attack: scepter_hp)
    }
}

// une classe contenant l'arme excalibur
class Excalibur : Weapon{
    let excalibur_name : String = "excalibur"
    let excalibur_hp : Int = 40
    
    init(){
        super.init(name: excalibur_name, hp_attack: excalibur_hp)
    }
}

var jeu = Game()
jeu.start_game()

