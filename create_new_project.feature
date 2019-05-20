# 1 - alle schritte des scenarios "create_new_project" aufnehmen
# 2 - wie ich die scenarios ausführen: manuel oder automatisiert
Feature happycase:

            Scenario: create_new_project: 
                  Given I am using email channel to get in touch with the chatbot "pwc@bots.kore.com"
                  When I send the message "Create new project"
                  Then I should get: A message containing: "Ok, I will now ask you some questions, you can escape anytime saying „exit“. So let's start."

            Scenario: Get the name of the project.
                  Given scenario "create_new_project" is executed successful
                  When I get asked: "Please provide the name of the project?"
                  Then I answer: "A project test project description"  and the next question appears

            Scenario: Get the project description.
                   Given scenario "Get name of project" is executed successful
                   When I get asked: "What is the project description"
                   Then I answer: "Project description 101" and the next question appears

            Scenario:  Get start date of project.
                  Given scenario "Get name of project" is executed successful
                  When I get asked: "Please provide the start date of the order."
                  Then I answer: "01.01.2020" and the next question appears

            Scenario:  Get end date of project.
                  Given scenario "Get start of project" is executed successful
                  When I get asked: "Please provide the end date of the order."
                  Then I answer: "01.01.2021" and the next question appears

            Scenario:  Get responsible company code.
                  Given scenario "Get end of project" is executed successful
                  When I get asked: "What is the responsible company code?"
                  Then I answer: "CompanyCode123" and the next question appears
            
            Scenario:  Get responsible cost center.
                  Given scenario "Get responsible company code" is executed successful
                  When I get asked: "What is the responsible cost center?"
                  Then I answer: "Berlin" and the next question appears

            Scenario:  Get responsible project manager.
                  Given scenario "Get responsible cost center" is executed successful
                  When I get asked: "Who is the responsible project manager?"
                  Then I answer: "Patrick Richter" and the next question appears

            Scenario:  Get applicable plant.
                  Given scenario "Get responsible project manager?" is executed successful
                  When I get asked: "For which plant is the project applicable?"
                  Then I answer: "Plant321" and the next question appears

            Scenario:  Get location for applicable plant.
                  Given scenario "Get applicable plant?" is executed successful
                  When I get asked: "For which location is the project applicable?"
                  Then I answer: "001" and the next question appears

            Scenario:  Get PSP-element.
                  Given scenario "Get location for applicable plant" is executed successful
                  When I get asked: "What is the PSP-element?"
                  Then I answer: "PSP-001" and the next question appears

            Scenario:  Get PSP-element description.
                  Given scenario "Get PSP-element." is executed successful
                  When I get asked: "Please provide a description to the PSP-element."
                  Then I answer: "PSP-Description" and the next question appears

            Scenario:  Get project type - "No" .
                  Given scenario "Get PSP-element description." is executed successful
                  When I get asked: "Will it be a standard project?"
                  Then I answer: "No" and I will be asked to "Provide relevant components to this project"

                  Scenario:  Get relevant components.
                        Given scenario "Get project type" is answered with "No" 
                        When I get asked: "Please provide the list of relevant components and PSP-elements for the project."
                        Then I answer: "Component1, Component2, .." and I will be asked "Is it a matter of founding a company?"

            Scenario:  Get project type - "Yes".
                  Given scenario "Get project type" is answered with "Yes"
                  When I get asked: "Will it be a standard project?"
                  Then I answer: "Yes" and I will be asked if it "Is it a matter of founding a company?"

            Scenario:  Founding a company - "Yes"?.
                  Given scenario "Get project type" is answered with "Yes" OR "Get relevant components." has been answered
                  When I get asked: "Is it a matter of founding a company"
                  Then I answer: "Yes", I will be asked "Is it a matter of inferior economic goods?"
            
            Scenario:  Founding a company - "No"?.
                  Given scenario "Get project type" is answered with "Yes" OR "Get relevant components." has been answered
                  When I get asked: "Is it a matter of founding a company?"
                  Then I answer: "No", I will be asked "Is it a matter of inferior economic goods?"

                  Scenario:  Is raising equity - "No"?.
                        Given scenario "Founding a company" is answered with "No"
                        When I get asked: "Is it a matter of raising equity capital?"
                        Then I answer: "No", I will be asked "Is it a matter of insurance contracts?"
                  Scenario:  Is raising equity - "Yes"?.
                        Given scenario "Founding a company" is answered with "No"
                        When I get asked: "Is it a matter of raising equity capital?"
                        Then I answer: "Yes", I will be asked "Is it a matter of inferior economic goods?"

                  Scenario:  Is insurance contacts - "No" ?.
                        Given scenario "Is raising equity" is answered with "No"
                        When I get asked: "Is it a matter of raising equity capital?"
                        Then I answer: "No", I will be asked "Is it for research or sales"
                  Scenario:  Is raising equity - "Yes"?.
                        Given scenario "Is raising equity" is answered with "No"
                        When I get asked: "Is it a matter of raising equity capital?"
                        Then I answer: "Yes", I will be asked "Is it a matter of inferior economic goods?"

                  Scenario:  Is it research or sales - "No"?.
                        Given scenario "Is insurance contacts" is answered with "No"
                        When I get asked: "Is it research or sales?"
                        Then I answer: "No", I will be asked "Is it a matter of shares?"
                  Scenario:  Is it shares - "Yes"?.
                        Given scenario "Is insurance contacts" is answered with "Yes"
                        When I get asked: "Is it research or sales?"
                        Then I answer: "Yes", I will be asked "Is it a matter of inferior economic goods?"

                  Scenario:  Is it shares - "No"?.
                        Given scenario "Is it research or sales" is answered with "No"
                        When I get asked: "Is it a matter of shares?"
                        Then I answer: "No", I will be asked "Is it a matter of inferior economic goods?"
                  Scenario:  Is it shares - "Yes"?.
                        Given scenario "Is it research or sales" is answered with "Yes"
                        When I get asked: "Is it a matter of shares?"
                        Then I answer: "Yes", I will be asked "Is it a matter of inferior economic goods?"

                  Scenario:  Get Budget - "Yes"
                        Given scenario "Is founding a company - "No" 
                        AND  "Is it raising equity - "No"
                        AND "Is insurance contacts - "No"
                        AND "Is it research or sales - "No"
                        AND "Is it shares - "No" is TRUE 
                        OR one of the previous five is answered with "Yes" 
                        OR "Is it research or sales" is answered with ("research" OR "sales")
                        When I get asked: "Is it a matter of inferior economics?"
                        Then I answer: "Yes", I will be asked "Is it a self-created intangible asset?"
                   
                        Scenario:  Is self created intangible asset - "No"?.
                              Given scenario "Get Budget" is answered with "Yes"
                              When I get asked: "Is it a self-created intangible asset?"
                              Then I answer: "No", I will be asked "Please provide the currency"
                        Scenario:  Is self created intangible asset - "Yes"?.
                              Given scenario "Get Budget" is answered with "Yes"
                              When I get asked: "Is it a self-created intangible asset?"
                              Then I answer: "Yes", I will be asked "Is it a matter of accounting aid for deferred tax assets?Is it a matter of accounting aid for deferred tax assets?"

                              Scenario:  Is Accounting aid deffered tax asset - "No"?.
                                    Given scenario "Is self created intangible asset - "Yes"?
                                    When I get asked: "Is it a matter of accounting aid for deferred tax assets?Is it a matter of accounting aid for deferred tax assets?"
                                    Then I answer: "No", I will be asked "Please provide the currency"
                              Scenario:  Is Accounting aid deffered tax asset - "Yes"?.
                                    Given scenario "Is self created intangible asset - "Yes"?
                                    When I get asked: "Is it a matter of accounting aid for deferred tax assets?Is it a matter of accounting aid for deferred tax assets?"
                                    Then I answer: "Yes", I will be asked "Please provide the currency"
          
                  Scenario:  Get Budget - "No"
                        Given scenario "Is founding a company - "No" 
                        AND  "Is it raising equity - "No"
                        AND "Is insurance contacts - "No"
                        AND "Is it research or sales - "No"
                        AND "Is it shares - "No" is TRUE 
                        OR one of the previous five is answered with "Yes" 
                        OR "Is it research or sales" is answered with ("research" OR "sales")
                        When I get asked: "Is it a matter of inferior economics?"
                        Then I answer: "No", I will be asked "Please provide the currency"

            Scenario: Get currency 
                  Given scenario "Get Budget - "No"
                  AND scenario "Get Budget - "Yes"
                  OR scenario "Get Budget - "No"
                  AND scenario "Is self created intangible asset - "Yes"
                  OR scenario "Is self created intangible asset - "No"
                  AND scenario "Is Accounting aid deffered tax asset - "No" 
                  OR scenario "Is Accounting aid deffered tax asset - "Yes"
                  When I get asked: "Please provide the currency"
                  Then I answer: "dollar", I will receive a confirmation of all data 

            Scenario: Confirm user input - "No"
                  Given scenario "Get currency" is executed successful
                  Given scenario "Is it a matter of founding a company - "Yes" 
                  OR scenario "Is it a matter of raising equity capital? - "Yes"
                  OR scenario "Is it a matter of insurance contracts? - "Yes"
                  OR scenario "Is it research or sales?" is anwered with "Yes" OR "rearch" OR "sales"
                  OR scenario "Is it a matter of shares" is answered with "Yes" 
                  When I receive the message: 
                  "Great, I gathered followíng information: 
                  ● Name of the project 01.01.2020
                  ● Project description 01.01.2020 
                  ● Start date of project 2020-01-01
                  ● End date of project 2020-01-01
                  ● The responsible company code 01.01.2020
                  ● The responsible cost center 01.01.2020
                  ● The responsible project manager 01.01.2020
                  ● The applicable plant for this project 01.01.2020
                  ● The location of the project 456
                  ● The PSP-element 01.01.2020
                  ● The PSP-element description 01.01.2020
                  ● Is the project a standard project: yes
                  ● The responsible project manager 01.01.2020
                  ● Project will be classified as an expense to be capitalized 
                  ● Project will not be classified as a capitalization option. 
                  ● The currency dollar
                  Is this information correct? Please answer "yes" or "no"
                  Then I answer: "No" the process is aborted

                  Scenario: Confirm user input - Classify expense
                        Given scenario "Get currency" is executed successful
                        Given that one of the following scenarios is answered with "Yes"
                        "Is it a matter of founding a company - "Yes" 
                        OR scenario "Is it a matter of raising equity capital? - "Yes"
                        OR scenario "Is it a matter of insurance contracts? - "Yes"
                        OR scenario "Is it research or sales?" is anwered with "Yes" OR "rearch" OR "sales"
                        OR scenario "Is it a matter of shares" is answered with "Yes" 
                        Then I receive the message: 
                        "Great, I gathered followíng information: 
                        ● ...
                        ● Project will be classified as an expense to be capitalized 
                        ● ... "
                        
                  Scenario: Confirm user input - Classify asset
                        Given scenario "Get currency" is executed successful
                        Given that all of the following scenarios is answered with "No"
                        Given scenario "Is it a matter of founding a company - "No" 
                        OR scenario "Is it a matter of raising equity capital? - "No"
                        OR scenario "Is it a matter of insurance contracts? - "No"
                        OR scenario "Is it research or sales?" is anwered with "No" 
                        OR scenario "Is it a matter of shares" is answered with "No" 
                        Then I receive the message: 
                        "Great, I gathered followíng information: 
                        ● ...
                        ● Project will be classified as an asset to be capitalized 
                        ● ... "
                                          
                  Scenario: Confirm user input - Capitalization True
                        Given scenario "Get currency" is executed successful
                        Given that one of the following scenarios is answered with "No"
                        Given scenario "Is it a self created intangible asset? - "No" 
                        OR scenario "Is it a matter of inferior economic goods? - "No"
                        OR scenario "Is it a matter of accounting aid for deferred tax assets? - "No"
                        Then I receive the message: 
                        "Great, I gathered followíng information: 
                        ● ...
                        ● Project will be classified as a capitalization option.  
                        ● ... "
                     
                   Scenario: Confirm user input - Capitalization False
                        Given scenario "Get currency" is executed successful
                        Given that all of the following scenarios is answered with "Yes"
                        Given scenario "Is it a self created intangible asset? - "Yes" 
                        OR scenario "Is it a matter of inferior economic goods? - "Yes"
                        OR scenario "Is it a matter of accounting aid for deferred tax assets?? - "Yes"
                        Then I receive the message: 
                        "Great, I gathered followíng information: 
                        ● ...
                        ● Project will not be classified as a capitalization option.  
                        ● ... "
                        
            Scenario: Confirm user input - "Yes"
                  Given scenario "Get currency" is executed successful
                  Given scenario "Is it a matter of founding a company - "Yes" 
                  OR scenario "Is it a matter of raising equity capital? - "Yes"
                  OR scenario "Is it a matter of insurance contracts? - "Yes"
                  OR scenario "Is it research or sales?" is anwered with "Yes" OR "rearch" OR "sales"
                  OR scenario "Is it a matter of shares" is answered with "Yes" 
                  When I receive the message: 
                  "Great, I gathered followíng information: 
                  ● ...
                  Is this information correct? Please answer "yes" or "no"
                  Then I answer: "Yes", I will be asked "Great, shall I forward this information?"


            Scenario: Send email - True.
                  Given scenario "Confirm user input - "Yes" is executed successful
                  When I get asked: "Great, shall I forward this information?"
                  Then I answer: "Yes" and a email shall be send with the gathered information

              Scenario: Send email - False.
                  Given scenario "Confirm user input - "Yes" is executed successful
                  When I get asked: "Great, shall I forward this information?"
                  Then I answer: "No" and the process is aborted

























