# Le jeu (on a pas encore de nom)
==

Jeu créé par : Mattéo Luque, Amélie Hacque et Xavier Maziere

## Description

Dans ce jeu vous traverserez un monde mysterieux, remplit de monstres plus dangereux les uns que les autres. N'ayez pas peur de la mort, car elle prendra votre vie de nombreuses fois avant que vous n'arriviez au bout de votre quête.

## Objectifs principaux

- [ ] Premier monde, la forêt
- [ ] Deuxième monde, les grottes
- [ ] Release jouable
- [ ] Multijoueur en co-op local

## Avancée

### 7 Avril 2022

* Choix du style de jeu (roguelike, rpg, die and retry)
* Création de l'arborescence des fichiers
* Définition de certains éléments de gameplay
    * Classes
        * Guerrier
        * Mage
        * Voleur
    * Monstres du premier monde
        * Plante carnivore
        * Gobelin
        * Singe
        * Ecureuil
    * Mini-boss du premier monde
        * Le sanglier enragé
        * Le Groblin
        * L'arbre vivant
    * Boss de fin de monde
        * Plob l'arbre poulpe, boss final du premier monde
        * Voglahm le golem, boss final du deuxième monde
    * Statistiques
        * Vitalité (Vie maximum)
        * Force (Attaque au corps-à-corps)
        * Défense (Réduction des dégats reçus)
        * Intelligence (Attaque magique)
        * Chance (Taux de critiques et meilleur butin)
        * Dextérité (Attaque à distance)
    * Types d'objets
        * Armures
            * Casques et couvre-chefs
            * Plastrons
            * Bottes
        * Armes
            * Haches
            * Arcs
            * Dagues
            * Sceptres
            * Sorts magiques
            * Epées
        * Bibelots
            * Colliers
            * Bagues
        * Consommables
            * Livres de magie
            * Parchemins
            * Potions
* Choix du style graphique (pixélisé, principalement en 16px * 16px)

Prochains objectifs :
* Un objet de chaque type
    * Sprite
    * Statistiques liées
* Personnage
    * Un sprite par classe
    * Statistiques de base
    * Déplacements
* Monde
    * Monde de test
    * Tile map du monde de test
    * Tile map du premier monde
* Monstres
    * Un sprite par monstre
    * Mouvements type "patrouille"