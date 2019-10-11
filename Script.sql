CurrentDb.Execute ("DROP TABLE Payment")
CurrentDb.Execute ("DROP TABLE Payment_Mehtod")
CurrentDb.Execute ("DROP TABLE Contract")
CurrentDb.Execute ("DROP TABLE Student")
CurrentDb.Execute ("DROP TABLE Apartment")
CurrentDb.Execute ("DROP TABLE Building")


sql = "CREATE TABLE Building (building_name text PRIMARY KEY," + _
"address text)"

CurrentDb.Execute (sql)

sql = "CREATE TABLE Apartment(building_name text REFERENCES Building(building_name)," + _
"apt_no text," + _
"no_of_rooms int," + _
"PRIMARY KEY (building_name, apt_no))"

CurrentDb.Execute (sql)

sql = "CREATE TABLE Student(studentID text PRIMARY KEY," + _
"name text," + _
"university text," + _
"apt_no text," + _
"building_name text," + _
"FOREIGN KEY (building_name, apt_no) REFERENCES Apartment(building_name, apt_no))"

CurrentDb.Execute (sql)

sql = "CREATE TABLE Contract(studentID text REFERENCES Student(studentID)," + _
"from_date datetime," + _
"to_date datetime," + _
"monthly_rental int," + _
"PRIMARY KEY (studentID))"

CurrentDb.Execute (sql)


sql = "CREATE TABLE Payment_Mehtod(pay_method_id counter PRIMARY KEY," + _
"studentID text REFERENCES Student(studentID)," + _
"details text)"

CurrentDb.Execute (sql)

sql = "CREATE TABLE Payment(paymentID counter," + _
"pay_method_id long REFERENCES Payment_Mehtod(pay_method_id)," + _
"amount_paid currency," + _
"amount_due currency," + _
"PRIMARY KEY(paymentID, pay_method_id))"

CurrentDb.Execute (sql)

CurrentDb.Execute ("INSERT INTO Building VALUES('The Gates', 'Blackthorn Road, Sandyford, Dublin')")
CurrentDb.Execute ("INSERT INTO Building VALUES('The Edges', 'Blackthorn Road, Sandyford, Dublin')")
CurrentDb.Execute ("INSERT INTO Building VALUES('Vantage 7', 'Central Park, Leopardstown Rd, Tipperstown, Dublin 18')")
CurrentDb.Execute ("INSERT INTO Apartment VALUES('The Gates', '101', 2)")
CurrentDb.Execute ("INSERT INTO Apartment VALUES('The Edges', '304', 4)")
CurrentDb.Execute ("INSERT INTO Apartment VALUES('Vantage 7', '616', 6)")
CurrentDb.Execute ("INSERT INTO Student VALUES('C17500926', 'Adam Murphy', 'TUD', '101', 'The Gates')")
CurrentDb.Execute ("INSERT INTO Student VALUES('D18126895', 'Michael Halpert', 'DCU', '304', 'The Edges')")
CurrentDb.Execute ("INSERT INTO Student VALUES('16269745', 'Susan Goldenberg', 'UCD', '616', 'Vantage 7')")
CurrentDb.Execute ("INSERT INTO Contract VALUES('C17500926', '14/2/2019', '14/2/2020', 1300)")
CurrentDb.Execute ("INSERT INTO Contract VALUES('D18126895', '10/1/2019', '9/1/2020', 2300)")
CurrentDb.Execute ("INSERT INTO Contract VALUES('16269745', '14/4/2019', '14/10/2019', 2600)")
CurrentDb.Execute ("INSERT INTO Payment_Mehtod VALUES('1', 'C17500926', 'debit card: 102486215645')")
CurrentDb.Execute ("INSERT INTO Payment_Mehtod VALUES('2', 'C17500926', 'debit card: 123496258976')")
CurrentDb.Execute ("INSERT INTO Payment_Mehtod VALUES('3', 'D18126895', 'debit card: 369752489654')")
CurrentDb.Execute ("INSERT INTO Payment_Mehtod VALUES('4', '16269745', 'debit card: 469759743697')")
CurrentDb.Execute ("INSERT INTO Payment VALUES('1', '1', 1300, 1300)")
CurrentDb.Execute ("INSERT INTO Payment VALUES('2', '3', 2000, 2600)")
CurrentDb.Execute ("INSERT INTO Payment VALUES('3', '2', 1000, 300)")
CurrentDb.Execute ("INSERT INTO Payment VALUES('4', '4', 2600, 2600)")
