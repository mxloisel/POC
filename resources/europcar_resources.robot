*** Variables ***

# Search Form de la page d'acceuil Europcar

${homePageSearchContainer}    //form[@action="#" and @id="search-form"]

${vehiculeType}   //div[./p[text()="Quel type de voiture ?"]]
${tousNosVehicules}    ${vehiculeType}//button[./p[text()="Tous nos véhicules"]]
${utilitaires}    ${vehiculeType}//button[./p[text()="Utilitaires"]]
${suv}    ${vehiculeType}//button[./p[text()="SUV"]]


${departurePointSelector}    //div[@aria-labelledby="search-form-agency-departure"]
${departureDateSelector}   //input[@id="search-form-date-departure"]
${departureTimeSelector}   //select[@name="hourDeparture"]

${arrivalPointSelector}    //div[@aria-labelledby="search-form-agency-arrival"]
${arrivalDateSelector}    //input[@id="search-form-date-arrival"]
${arrivalTimeSelector}    //select[@name="hourArrival"]

${differentDepartureArrivalCheckbox}    //label[@data-testid="search-form-show-return-agency"]/span/input

${promoCheckbox}    //div[./p[text()="J'ai un "]/span[text()="code promo"]]/div
${promoInput}    //input[@id="search-form-promo-code"]

${homepageSubmitSearchButton}    ${homePageSearchContainer}//button[./div[text()="Rechercher"]]

# Choix du véhicule
${firstAvailableVehicule}    (//button[.//p[text()="Paiement en ligne"]])[1]

# Choix des options
${highlightsContainer}      //div[./div[./div[./h3[text()="NOS INCONTOURNABLES"]]]]
${babyOptionContainer}      //div[./div[./div[./h3[text()="TOUT POUR BEBE !"]]]]
${confortOptionContainer}      //div[./div[./div[./h3[text()="PLUS DE CONFORT"]]]]
${protectionOptionContainer}      //div[./div[./div[./h3[text()="COMPLEMENTS DE PROTECTION"]]]]