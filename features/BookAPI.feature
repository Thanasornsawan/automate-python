# command: behave  features/BookAPI.feature --no-capture (--no-capture mean not store log but print output to console)
# behave  features/BookAPI.feature --no-capture --tags=smoke (it's mean we want to run only smoke tag)
# behave --no-capture -f allure_behave.formatter:AllureFormatter -o AllureReports
# allure serve **allure_result_json**  (command for convert json to html)
Feature: Verify if Books are added and deleted using Library API
  # we can use tag @smoke on top Scenario
  @library
  Scenario: Verify AddBook API functionality
    Given the Book details which needs to be added to Library
    When we execute the AddBook PostAPI method
    Then book is successfully added
    And  status code of response should be 200

   @library
    #This one will run 2 scenario because have 2 data set, <isbn> is the way to sent data as argument
    Scenario Outline: Verify AddBook API functionality
    Given the Book details with <isbn> and <aisle>
    When we execute the AddBook PostAPI method
    Then book is successfully added
      Examples:
        |isbn  |  aisle |
        | fdfee| 8949   |
        | powr | 76334  |




