#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Welcome to Ral's Salon! ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  SERVICES=$($PSQL "SELECT * FROM services ORDER BY service_id")

  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  echo -e "\nHow can I help you today?"
  read SERVICE_ID_SELECTED

  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

  if [[ -z $SERVICE_NAME ]]
  then
    MAIN_MENU "Please enter a valid option."
  else
    SERVICE $SERVICE_ID_SELECTED "$SERVICE_NAME"
  fi
}

SERVICE() {
  SERVICE_ID_SELECTED=$1
  SERVICE_NAME=$(echo $2 | sed -E 's/^ *| *$//g')

  # get customer info
  echo -e "\nPlease enter your phone number."
  read CUSTOMER_PHONE

  # check if customer data already exist
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME

    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi

  CUSTOMER_NAME_FORMATTED=$(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME_FORMATTED'")

  echo -e "\nAlright, $CUSTOMER_NAME_FORMATTED. Please enter the appointment time you want."
  read SERVICE_TIME

  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME_FORMATTED."
}

MAIN_MENU