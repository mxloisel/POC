*** Settings ***
Documentation    Test récupéré sur Squash traduit en Robotframework pour le POC de l'outil T-A
Library    SeleniumLibrary
Library    DateTime
Library    String
Resource    ../../custom_keywords/Europcar_keywords.robot
Resource    ../../custom_keywords/jumbo_keywords.robot
Resource    ../../custom_keywords/contentful_keywords.robot
Resource    ../../custom_keywords/POC_keywords.robot
Resource    ../../custom_keywords/database_keywords.robot

***Variables***
${depatureTime}    09:30
${arrivalTime}    14:30
${depatureIn}    22
${arrivalIn}    23
${selectedAge}    48
${testDepartureDestination}    Abymes - Aéroport Pôle Caraibes
${testArrivalDestination}    Gourbeyre - Basse Terre

*** Test Cases ***

Passage de TNR Generique
    [Teardown]    Close Browser
    [Tags]      JUMBO      M00C00
    # Step 1 : Ouverture de la plateforme Jumbo 
    Open Jumbo
    
    # Step 2 : Lance une recherche de véhicule avec point de restitution différent depuis la plateforme Jumbo et vérifie l'affichae de la page suivante
    Lanuch Jumbo Vehicule Search With Different Arrival Point
    ...     ${depatureTime}
    ...     ${arrivalTime}
    ...     ${depatureIn} 
    ...     ${arrivalIn}
    ...     ${selectedAge}
    ...     ${testDepartureDestination}
    ...     ${testArrivalDestination}
    
    # Step 3 : Vérifie le bon affichage de la page Choix Du Véhicule
    Verify Current Step     1
    Verify Vehicule Type Bande    9    Tous les véhicules

    # Step 4 : Sélection du véhicule
    Select Vehicule Type    Familiale
    Select Vehicule Type    Tous les véhicules
    Activate Filter     Energie     Diesel
    Activate Filter     Boite de vitesse     Automatique
    Activate Filter     Places     5 places
    Choose Vehicule     Hyundai Tucson
    Sleep   15s

    # Step 5 : Vérifie le bon affichage de la page Choix Des Options
    Verify Current Step     2

Tests avec jeu de données variant
    [Teardown]    Close Browser
    [Tags]      Europcar    POC     Data
    # Étape 1 : Charger les jeux de données
    Execute SQL Request Through Command     select count(*) from group_extra
    # Étape 2 : Effectuer une recherche de véhicule dans Europcar et vérifier l'affichage des options
    Europcar_keywords.Open Europcar PreProd
    Close Cookies
    Wait Until Element Is Visible    ${homepageSubmitSearchButton}
    Europcar_keywords.Select Departure Date
    Sleep   1s
    Europcar_keywords.Submit Search

    Wait Until Element Is Visible    //h2[text()="LES PLUS LOUÉS"]      20s
    Select Vehicule By Type     IMMR
    Sleep   0.5s
    
    Wait Until Element Is Visible    (//div[text()="Réserver"])[2]      20s
    Sleep   5s
    ${is_visible}    Run Keyword And Return Status    Element Should Be Visible    ${highlightsContainer}
    Should Be Equal    '${is_visible}'    'True'
    
    # Étape 3 : Changer le jeu de données (requête SQL)
    Execute SQL Request Through Command     update group_extra set active = 0 where group_extra_id = 111
    
    # Étape 4 : Effectuer une nouvelle recherche de véhicule dans Europcar et vérifier la modification de l'affichage des options (should fail)
    Reload Page
    Wait Until Element Is Visible    (//div[text()="Réserver"])[2]      20s
    Sleep   5s
    ${is_visible}    Run Keyword And Return Status    Element Should Be Visible    ${highlightsContainer}
    Should Be Equal    '${is_visible}'    'False'
    
    # Étape 5 : Restaurer la base de données
    Execute SQL Request Through Command     update group_extra set active = 1 where group_extra_id = 111