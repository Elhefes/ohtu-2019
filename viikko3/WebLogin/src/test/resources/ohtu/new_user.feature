
Feature: A new user account can be created if a proper unused username and password are given

  Scenario: creation is successful with valid username and password
    Given command new user is selected
    When  a valid username "okko" and password "password123" and matching password confirmation are entered
    Then  a new user is created

  Scenario: creation fails with too short username and valid password
    Given command new user is selected
    When  a too short username "a" and valid password "password1" and matching password confirmation are entered
    Then user is not created and error "username should have at least 3 characters" is reported

  Scenario: creation fails with correct username and too short password
    Given command new user is selected
    When  a valid username "kalle123" and too short password "ella1" and matching password confirmation are entered
    Then user is not created and error "password should have at least 8 characters" is reported

  Scenario: creation fails when password and password confirmation do not match
    Given command new user is selected
    When a valid username "timo123" and password "omit1234" and not matching password confirmation "omit12345" are entered
    Then user is not created and error "password and password confirmation do not match" is reported

  Scenario: user can login with successfully generated account
    Given user with username "jones" with password "senoj1234" is successfully created
    And   login is selected
    When  correct username "jones" and password "senoj1234" are given
    Then  user is logged in

  Scenario: user can not login with account that is not successfully created
    Given user with username "mick" and password "kcim" is tried to be created
    And   login is selected
    When  correct username "mick" and incorrect password "kcim" are given
    Then  user is not logged in and error message is given
