from PyQt5 import uic,QtWidgets

def funcao_principal():
    linha1 = telalogin.lineEdit.text()
    linha2 = telalogin.lineEdit_3.text()
    print("rA ou IdProfessor:",linha1) 
    print("Senha:",linha2)

    if telalogin.radioButton.isChecked() :
        print("Você está logado Professor")
    else:
          print("Você está logado Estudante")


app=QtWidgets.QApplication([])
telalogin=uic.loadUi("telalogin.ui")
telalogin.pushButton.clicked.connect(funcao_principal)

telalogin.show()
app.exec()
