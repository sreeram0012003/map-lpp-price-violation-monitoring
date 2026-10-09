import os
import smtplib
from email.message import EmailMessage
from email_template import create_letter

EMAIL = os.getenv("GMAIL_ADDRESS")
APP_PASSWORD = os.getenv("GMAIL_APP_PASSWORD")


def send_email(row, attachment):
    if not EMAIL or not APP_PASSWORD:
        raise ValueError("Configure GMAIL_ADDRESS and GMAIL_APP_PASSWORD first")

    msg = EmailMessage()
    msg["From"] = EMAIL
    msg["To"] = row["Seller_Email"]
    msg["Subject"] = f"Price Violation Notice - {row['SKU']}"

    msg.set_content(f"""
Dear {row['Seller_name']},

A pricing violation has been identified.

SKU: {row['SKU']}
Marketplace: {row['Marketplace']}
Violation Count: {row['Violation_count']}
Action: {row['Action']}

Please take the necessary corrective action.

Regards,
LPP / MAP Monitoring Team
""")

    with open(attachment, "rb") as file:
        msg.add_attachment(
            file.read(),
            maintype="application",
            subtype="vnd.openxmlformats-officedocument.wordprocessingml.document",
            filename=os.path.basename(attachment)
        )

    with smtplib.SMTP("smtp.gmail.com", 587) as server:
        server.starttls()
        server.login(EMAIL, APP_PASSWORD)
        server.send_message(msg)

    print(f"Email sent for SKU: {row['SKU']}")