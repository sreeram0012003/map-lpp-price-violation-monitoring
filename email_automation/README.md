# MAP/LPP Email Automation

## Purpose
Automatically generate price violation notices and send email notifications to sellers.

## Features
- Generates Word violation notices.
- Includes SKU and seller details.
- Includes marketplace and violation date.
- Shows advertised price and promotional price.
- Records violation count and recommended action.
- Attaches the generated Word notice to the email.
- Sends notifications using Gmail SMTP.

## Project Files
- `src/email_automation/email_sender.py` – Sends email notifications.
- `src/email_automation/email_template.py` – Generates Word violation letters.
- `src/email_automation/templates/` – Stores the Word document template.

## Requirements
- Python
- `python-docx`
- Gmail account with an App Password

## Configuration
Configure your Gmail address and App Password securely before sending emails.

Never upload passwords or App Passwords to GitHub.

## Workflow
1. Read violation details.
2. Generate a Word violation notice.
3. Attach the notice to an email.
4. Send the notification using Gmail SMTP.
5. Display the email-sending status.

## Important
Use test email addresses during development. Verify recipient addresses before sending real notifications.
