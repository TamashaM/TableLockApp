
require "selenium-webdriver"
require "test/unit"

class LoginClass < Test::Unit::TestCase

  def setup
    @driver = Selenium::WebDriver.for :firefox



    @driver.navigate.to "https://sleepy-lowlands-18893.herokuapp.com/login"

    @driver.manage.window.maximize
  end


  def teardown
    @driver.quit
  end


  def test_login
    @driver.find_element(:id, "email").send_keys "tam@gmail.com"
    @driver.find_element(:id, "password").send_keys "password"
    @driver.find_element(:name, "action").click

    assert(@driver.find_element(:tag_name => "body").text.include?("Home"),"Page contains the text")
    sleep 0.3
    @driver.find_element(:id, "log").click
    #@driver.findElement(By.xpath("//select[@id='groupSelect']/option[@value='data' and . = 'First value']")
    #).click();
    sleep 0.3
    @driver.find_element(:link, "Logout" ).click
    sleep 0.3
    assert(@driver.find_element(:tag_name => "body").text.include?("Login"),"Page contains the text")

      #assert(@driver.find_element(:id => "loggedin").text.include?("You Are Logged in"),"Assertion Failed")
    #@driver.find_element(:id, "logout").click
  end
end
