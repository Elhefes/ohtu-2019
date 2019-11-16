Feature: A new user account can be created if a proper unused username and password are given

    Scenario: creation is successful with valid username and password
        Given command new is selected
        When  username "okke" and password "ekko1234" are entered
        Then  system will respond with "new user registered"
    
    Scenario: creation fails with already taken username and valid password
        Given command new is selected
        When  username "pekka" and password "akkep" are entered
        Then  system will respond with "new user not registered"

    Scenario: creation fails with too short username and valid password
        Given command new is selected
        When  username "l" and password "password123" are entered
        Then  system will respond with "new user not registered"

    Scenario: creation fails with valid username and too short password
        Given command new is selected
        When  username "ukko" and password "" are entered
        Then  system will respond with "new user not registered"

    Scenario: creation fails with valid username and password long enough but consisting of only letters
        Given command new is selected
        When  username "kalle" and password "aaaaaaaaaa" are entered
        Then  system will respond with "new user not registered"

    Scenario: can login with successfully generated account
        Given user "timo" with password "omit1234" is created
        And   command login is selected
        When  username "timo" and password "omit1234" are entered
        Then  system will respond with "logged in"
