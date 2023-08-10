***Keywords***
Click Submit Button
    [Arguments]     ${locator}
    Wait Until Element Is Visible 	 ${locator}
    Run Keywords    Mouse Over      ${locator}   AND    Click Element	 ${locator}

Get Converted Age Value
    [Arguments]    ${age}
    Run Keyword If    '${age}' <= '20'    
    ...     Return From Keyword    53
    ...     ELSE IF    '${age}' >= '26'    Return From Keyword    59
    ...     ELSE        Return From Keyword    ${age} + 33

Get Formatted Date
    [Arguments]     ${numberOfDays}    
    ${currentDate}      Get Current Date 
    ${resultDate}      Add Time To Date    ${current_date}    ${numberOfDays} days    result_format=%d
    Run Keyword If    "${resultDate}"[0] == "0"    
    ...     Return From Keyword    ${resultDate}[1:]
    [Return]    ${resultDate}

Get Background Color
    [Arguments]     ${elem}
    ${background_color}=    Execute Javascript   return window.getComputedStyle(document.querySelector('.${elem}')).backgroundColor
    [Return]    ${background_color}

Get Border-Bottom Element
    [Arguments]     ${elem}
    ${background_color}=    Execute Javascript   return window.getComputedStyle(document.querySelector('.${elem}')).border-bottom
    [Return]    ${background_color}

Convert Time To Seconds
    [Arguments]    ${time}
    ${hours}=    Evaluate    int("${time[:2]}")
    ${minutes}=    Evaluate    int("${time[3:]}")
    ${total_seconds}=    Evaluate    ${hours} * 3600 + ${minutes} * 60
    [Return]    ${total_seconds}