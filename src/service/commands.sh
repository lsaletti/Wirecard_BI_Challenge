#!/bin/bash

python etl_payment_status.py
python etl_payment.py
python etl_brand.py
python etl_returned_code.py
python etl_acquirers.py
python etl_acquirer_responses.py
