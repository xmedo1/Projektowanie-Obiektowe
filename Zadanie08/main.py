from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time

driver = webdriver.Chrome()
bad_emails = [
    "mailbezmalpy.com",
    "@mailbezpoczatku.com",
    "mailbezdomeny@.com",
    "mailzzakrotkadomena@example.c"
]


def fill_and_click(login, email, password):
    driver.get("http://localhost:5173/register")
    time.sleep(1)
    inputs = driver.find_elements(By.TAG_NAME, "input")
    button = driver.find_element(By.CSS_SELECTOR, "button[type='submit']")

    inputs[0].send_keys(login)
    inputs[1].send_keys(email)
    inputs[2].send_keys(password)

    button.click()
    time.sleep(1)
    return inputs


try:
    print("\nTest 1: Puste pola")

    fields = fill_and_click("", "test@example.com", "password")
    message = fields[0].get_attribute("validationMessage")
    assert message != ""
    print(f"Pusty login zablokowany ({message})")

    fields = fill_and_click("user", "", "password")
    message = fields[1].get_attribute("validationMessage")
    assert message != ""
    print(f"Pusty email zablokowany ({message})")

    fields = fill_and_click("user", "test@example.com", "")
    message = fields[2].get_attribute("validationMessage")
    assert message != ""
    print(f"Puste haslo zablokowane ({message})")

    print(f"Test 1 zaliczony")
    print("-" * 50)
    print("Test 2: Niepoprawne emaile")

    for email in bad_emails:
        fill_and_click("user", email, "pass")

        message = WebDriverWait(driver, 3).until(
            EC.presence_of_element_located((By.TAG_NAME, "p"))
        )

        assert "Niepoprawny format emaila" in message.text
        print(f"Zablokowano maila: {email}")

    print("-" * 50)
    print("Testy zakonczono pomyslnie")

finally:
    time.sleep(1)
    driver.quit()
