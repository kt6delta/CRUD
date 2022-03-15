import mysql.connector as conector
cnx = conector.connect(user='root', password='root',#'mysql2019',
host='localhost',
database='contactos')
cursor=cnx.cursor()
#cursor.execute("select * from persona")
sql="insert into persona (nombre, apellidos, documento) values (%s, %s, %s)"
valores=[("juan","lorenzo",2),("carlos","garcia",3)]
cursor.execute(sql,valores)
cnx.commit()
cursor.close()
cnx.close()

