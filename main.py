import tkinter as tk
from tkinter import messagebox as ms
from conexion import Conecta as con

ventana = tk.Tk()
ventana.geometry("500x300")
ventana.resizable(0,0)
ventana.title("CRUD persona")
img = tk.PhotoImage(file = "img/fondo.gif")#solo .gif

background = tk.Label(image = img)
LDoc= tk.Label(ventana, text="documento",bg = "#88cffa")
LName= tk.Label(ventana, text="nombre",bg = "#88cffa")
LApelli= tk.Label(ventana, text="apellido",bg = "#88cffa")

txtDoc= tk.Entry(ventana, font="helvetica 13",bg = "#88cffa")
txtName= tk.Entry(ventana, font="helvetica 13",bg = "#88cffa")
txtApelli= tk.Entry(ventana, font="helvetica 13",bg = "#88cffa")

def fCrea():
  date=(int(txtDoc.get()),txtName.get(),txtApelli.get())
  con.Crea(date)
  ms.showinfo("CRUD", "Se creo exitosamente")
  
def fModifica():
  date=(int(txtDoc.get()),txtApelli.get(),txtName.get())
  con.Modifica(date)
  ms.showinfo("CRUD", "Se modifico exitosamente")
  

def fElimina():
  date=int(txtDoc.get())
  con.Elimina(date)
  ms.showinfo("CRUD", "Se elimino exitosamente")

def fRead():
  date=(int(txtDoc.get()),txtName.get(),txtApelli.get())
  consulta=con.Read(date)
  txtDoc.delete(0, tk.END)
  txtName.delete(0, tk.END)
  txtApelli.delete(0, tk.END)

  txtDoc.insert(0, str(consulta[0]))
  txtName.insert(0, consulta[1])
  txtApelli.insert(0, consulta[2])
  ms.showinfo("CRUD", "Se leyo exitosamente")

btnCrea =tk.Button(ventana, text="Crear", padx=30,pady=15, bg = "#88cffa",command = lambda: fCrea())
btnModifica=tk.Button(ventana, text="modificar", padx=18,pady=15, bg = "#88cffa", command = lambda: fModifica())
btnElimina=tk.Button(ventana, text="Eliminar", padx=21,pady=15, bg = "#88cffa", command = lambda: fElimina())
btnRead=tk.Button(ventana, text="Leer", padx=30,pady=15, bg = "#88cffa",command = lambda: fRead())

background.place(x = 0, y = 0, relwidth = 1, relheight = 1)
LDoc.place(x=50, y=50)
txtDoc.place(x=150, y=40)
LName.place(x=50, y=90)
txtName.place(x=150, y=80)
LApelli.place(x=50, y=130)
txtApelli.place(x=150, y=120)

btnCrea.place(x=40, y=170)
btnModifica.place(x=150, y=170)
btnElimina.place(x=260, y=170)
btnRead.place(x=370, y=170)

ventana.mainloop()


