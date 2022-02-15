from simpletelegrambot import telegrambot
import pyodbc
from random import randint

server = '127.0.0.1'
database = 'final_ppt'
username = 'SA'
password = 'Fbdu-2001'
conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
cur = conn.cursor()

def on_message_receive(bot, message):
    msg_text = message['text']
    if msg_text.startswith("BOOK"):
        custid = randint(100,10000)
        sp = msg_text.split(',')
        name = sp[1]
        phno = sp[2]
        address = sp[3]
        email = sp[4]
        cur.execute('INSERT INTO dbo.Customer_Data (Customer_ID,Customer_Name,Customer_PhoneNumber,Customer_Address,Customer_EmailID) VALUES ('+str(custid)+",'"+name+"',"+str(phno)+",'"+address+"','"+email+"');")
        conn.commit()
        bookingid = randint(100000,500000)
        driverid = randint(1,4)
        cur.execute('INSERT INTO dbo.Booking_Data(Booking_ID,Driver_ID,Customer_ID)VALUES ('+str(bookingid)+","+str(driverid)+","+str(custid)+");")
        conn.commit()

        cur.execute('SELECT * FROM dbo.Driver_Data WHERE Driver_ID ='+str(driverid))
        for i in cur:
            drivername = i[1]
        bot.send_message('Driver Name is '+drivername)
        cur.execute('SELECT * FROM dbo.Car_Data WHERE Driver_ID='+str(driverid))
        for i in cur:
            carnum = i[0]
            carmod = i[1]
            carcol = i[2]
        bot.send_message('Car number is '+str(carnum)+'\nCar model is '+carmod+"\nCar color is "+carcol )
        bot.send_message("CAB HAS BEEN BOOKED")
    else:
        bot.send_message('HEY THERE, TO BOOK A CAB, SEND BOOK <Comma> NAME <comma> MOBILE NO. <comma> ADDRESS <comma> EMAIL ID')

def main():
    bot = telegrambot.TelegramBot('1250615426:AAH_ZY8Ru26qRMoIeKEfpkd-pBGweYcTGsg')
    bot.set_message_handler(on_message_receive)
    bot.wait_for_messages()

if __name__ == '__main__':
    main()