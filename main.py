import tkinter as tk
ventana = tk.Tk()
ventana.geometry("500x300")
ventana.resizable(0,0)
ventana.title("CRUD persona")

LDoc= tk.Label(ventana, text="documento",bg = "#88cffa")
LName= tk.Label(ventana, text="nombre",bg = "#88cffa")
LApelli= tk.Label(ventana, text="apellido",bg = "#88cffa")

txtDoc= tk.Entry(ventana, font="helvetica 13",bg = "#88cffa")
txtName= tk.Entry(ventana, font="helvetica 13",bg = "#88cffa")
txtApelli= tk.Entry(ventana, font="helvetica 13",bg = "#88cffa")

def Crea(nombre):
  print("hola"+ nombre )

def Modifica(var1):
  print(var1)

def Elimina(var):
  print(var)

def Limpia(var):
  print(var)

btnCrea =tk.Button(ventana, text="Crear", padx=30,pady=15, bg = "#88cffa",command = lambda: Crea("python"))
btnModifica=tk.Button(ventana, text="modificar", padx=18,pady=15, bg = "#88cffa", command = lambda: Modifica("python"))
btnElimina=tk.Button(ventana, text="Eliminar", padx=21,pady=15, bg = "#88cffa", command = lambda: Elimina("python"))
btnLimpia=tk.Button(ventana, text="Limpiar", padx=23,pady=15, bg = "#88cffa",command = lambda: Limpia("python"))

LDoc.place(x=50, y=50)
txtDoc.place(x=150, y=40)
LName.place(x=50, y=90)
txtName.place(x=150, y=80)
LApelli.place(x=50, y=130)
txtApelli.place(x=150, y=120)

btnCrea.place(x=40, y=170)
btnModifica.place(x=150, y=170)
btnElimina.place(x=260, y=170)
btnLimpia.place(x=370, y=170)

ventana.mainloop()

