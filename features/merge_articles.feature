Feature: Merge Articles
  As an admin
  In order to reduce clutter
  I want to be able to merge two articles

Background:

  Given the following blogs exist:
  | title        | author          | body                   | published | id |
  | Amurrica     | Romney          | Vote for me            |  t        |  1 |
  | Elections    | Jon Stewart     | Be educated            |   t       |  2 |
  | Aliens       | James Cameron   | Run, run!              |    t      |  3 |
  | Tweeting     | Big Bird        | Sesame Street has wifi |     t     |  4 |


  Scenario: A non-admin cannot merge two articles
    Given I am not an admin
    And I am on the home page
    When I follow "Amurrica"
    Then I should not see "Merge Articles"

  Scenario: An admin can merge two articles
    Given I am logged into the admin panel
    And I am on the admin content page
    When I follow "Amurrica"
    Then I should see "Merge Articles"

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I am logged into the admin panel
    And I am on the admin content page
    When I follow "Amurrica"
    And I fill in "merge_with" with "2"
    And I press "Merge with Article"
    Then I should be on the admin content page
    When I follow "Amurrica"
    Then I should see "Vote for meBe educated"

  Scenario: The merged article should have one author
    Given I am logged into the admin panel
    And I am on the admin content page
    When I follow "Aliens"
    And I fill in "merge_with" with "4"
    And I press "Merge with Article"
    Then I should be on the admin content page
    When I press "Aliens"
    Then I should see "James Cameron"
 
  Scenario:When articles are merged, the merged article should contain the comments of both previous articles
    Given I am on the home page
    When I follow "Amurrica"
    And I fill in "comment_author" with "Ritu"
    And I fill in "comment_email" with "ritu@mail.com"
    And I fill in "comment_url" with "ritu.com"
    And I fill in "comment_body" with "hi"
    And I press "comment"
    And I follow "Admin"
    Then I should be on the admin content page
    When I follow "Elections"
    And I fill in "merge_with" with "1"
    And I press "Merge with Article"
    Then I should be on the admin content page
    When I press "Elections"
    Then I should see "1 comment"
    And I should see "hi"
    

  Scenario:Merged articles should have a title from either one of previous articles
    Given I am logged into the admin panel
    And I am on the admin content page
    When I follow "Amurrica"
    And I fill in "merge_with" with "2"
    And I press "Merge with Article"
    Then I should be on the admin content page
    And I should see "Amurrica"
    And I should not see "Elections"
  
