import mysql.connector as conector

class Conecta():
  def __init__(self):
    self.cnx = conector.connect(
    user='root', password='',#'mysql2019',
    host='localhost',
    database='contactos')
    self.cursor=self.cnx.cursor()
    
  def Crea(self,Cdato):
    sql="insert into persona (nombre,apellidos,documento) values (%s, %s, %s)"
    valores=[Cdato]#valores=[("juan","lorenzo",2)]
    self.cursor.execute(sql,valores)
    self.cnx.commit()
    self.cursor.close()
    self.cnx.close()
  #def Modifica(Mdato):

