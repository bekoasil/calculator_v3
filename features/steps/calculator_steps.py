from behave import given, when, then
from calculator import add, subtract, multiply, divide
from pytest import approx

@given('I have entered {number:d} as the first number')
def step_impl(context, number):
    context.first_number = number

@given('I have entered {number:d} as the second number')
def step_impl(context, number):
    context.second_number = number

@when('I choose to perform "{operation}"')
def step_impl(context, operation):
    context.operation = operation
    if operation == "add":
        context.result = add(context.first_number, context.second_number)
    elif operation == "subtract":
        context.result = subtract(context.first_number, context.second_number)
    elif operation == "multiply":
        context.result = multiply(context.first_number, context.second_number)
    elif operation == "divide":
        try:
            context.result = divide(context.first_number, context.second_number)
        except ValueError as e:
            context.error_message = str(e)

@then('the result should be {result:d}')
def step_impl(context, result):
    assert context.result == approx(result)

@then('I should see an error message "{error_message}"')
def step_impl(context, error_message):
    assert context.error_message == error_message

