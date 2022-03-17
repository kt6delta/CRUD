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

    sql="UPDATE `persona` SET `nombre` = %s, `apellidos` = %s WHERE `persona`.`documento` = %s"
    valores=Mdato#valores=[("pepa","perez",54)]
    cursor.execute(sql,valores)
    cnx.commit()
    cursor.close()
    cnx.close()
    
  def Elimina(Edato):
    cnx = conector.connect(
    user='root', password='',#'mysql2019',
    host='localhost',
    database='contactos')
    cursor=cnx.cursor()
    sql="DELETE FROM persona WHERE persona.documento = %s"
    valor=(Edato,)
    cursor.execute(sql,valor)
    cnx.commit()
    cursor.close()
    cnx.close()

  def Read(Rdato):
    cnx = conector.connect(
    user='root', password='',#'mysql2019',
    host='localhost',
    database='contactos')
    mycursor=cnx.cursor()
    sql="SELECT * FROM persona  WHERE documento = %s"
    valores=[Rdato[0]]#valores=[(2,"juan","lorenzo")]
    mycursor.execute(sql,valores)
    consulta = mycursor.fetchone()
    cnx.commit()
    mycursor.close()
    cnx.close()
    return consulta



 



 
