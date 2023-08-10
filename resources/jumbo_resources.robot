***Variables***

# Variables de test

# Conteneur du module de recherche
${searchForm}   //form[@id="search-form" and @action="#"]

${cookies}      //div[@data-service="cookies"]
${closeCookies}     ${cookies}//span[text()="Continuer sans accepter"]

# Choix de lieu de départ de la location
${departurePointSelector}      (${searchForm}//div[@iconstyle="jss25"])[1]
${arrivalPointSelector}      (${searchForm}//div[@iconstyle="jss25"])[2]
${checkboxSeperatePoints}       ${searchForm}//input[@type="checkbox"]

# Choix de la date de départ/arrivée
${departureDateSelector}    ${searchForm}//input[@name="dateDeparture"]
${arrivalDateSelector}    ${searchForm}//input[@name="dateArrival"]
${selectionCalendar}       //div[@aria-roledescription="datepicker"]

# Choix de l'heure de départ/arrivée
${departureTimeSelector}    ${searchForm}//select[@name="hourDeparture"]
${arrivalTimeSelector}    ${searchForm}//select[@name="hourArrival"]

# Entrées complémetaires
${promoCodeInput}    ${searchForm}//input[@id="search-form-promo-code" and @placeholder="Code promo"]
${ageSelector}    ${searchForm}//select[@name="driverAge"]

# Envoie de la recherche
${searchSubmitButton}    ${searchForm}//button

# Elements d'Header
${headerContainer}    //header
${headerLogo}   ${headerContainer}//a//img[@alt="jumbocar quadri sans slog blanc-bleu"]
${faqLink}    (${headerContainer}//ul)[1]/li[7]
${languageSelection}    (${headerContainer}//ul)[2]/li/a

# Elements de footer
${footerContainer}    //footer
${footerMenu1}    ${footerContainer}/div/div/div/div[1]
${footerMenu2}    ${footerContainer}/div/div/div/div[2]
${footerMenu3}    ${footerContainer}/div/div/div/div[3]
${footerMenu4}    ${footerContainer}/div/div/div/div[4]

# Element de bandeau étapes de location
${step_band}    (//div[@class="MuiContainer-root MuiContainer-maxWidthLg css-ak0fp0"])[1]
${step_band_steps}      ${step_band}//div[contains(@class, "MuiBox-root css-8jc67i")]
${current_step_BG_color}     'rgb(9, 168, 224)'
${to_be_current_step_BG_color}     'rgb(245, 246, 250)'   

# Element de bandeau Type de véhicules
${vehicule_type_band}     (//div[@class="slick-slider slick-initialized"]//div[@class="slick-track"])[1]
${vehicule_types}     ${vehicule_type_band}/div[@style="outline: none; width: 117px;"]
${slide_right}     //span[@class="slick-arrow slick-next"]
${slide_left}     //span[@class="slick-arrow slick-prev"]
${selected_vehicule_type}     ${vehicule_type_band}/div[@class="slick-slide slick-active slick-current"]

# Element de resume recherche
${search_resume}    //form[@id="search-form" and @action="#" and @autocomplete="off"]

# Element du filtre
${filter}       //div[@class="MuiBox-root css-1g48ue6"]