import mysql.connector as conector

class Conecta():
  def Crea(Cdato):
    cnx = conector.connect(
    user='root', password='',#'mysql2019',
    host='localhost',
    database='contactos')
    cursor=cnx.cursor()
    
    sql="insert into persona (documento,nombre,apellidos) values (%s, %s, %s)"
    valores=[Cdato]#valores=[(2,"juan","lorenzo")]
    cursor.executemany(sql,valores)
    cnx.commit()
    cursor.close()
    cnx.close()
    
  def Modifica(Mdato):
    cnx = conector.connect(
    user='root', password='',#'mysql2019',
    host='localhost',
    database='contactos')
    cursor=cnx.cursor()
    
    sql="insert into persona (documento,nombre,apellidos) values (%s, %s, %s)"
    valores=[Cdato]#valores=[(2,"juan","lorenzo")]
    cursor.executemany(sql,valores)
    cnx.commit()
    cursor.close()
    cnx.close()

