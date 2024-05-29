from PyQt5.QtWidgets import QMainWindow, QTabWidget, QScrollArea, QApplication
from gui.Ip import Ip
import sys

class MainWindow(QMainWindow):
    def __init__(self):
        super(MainWindow, self).__init__()
        self.tab_widget = QTabWidget()
        self.tab_widget.addTab(Ip(), "Bilgisayar Ağ Güvenliği Final Ödevi")
        self.setCentralWidget(self.tab_widget)
        self.setWindowTitle("16-701-005 Kasım Bölücü")
        self.setFixedSize(480, 480)
        self.show()

if __name__ == '__main__':
    app = QApplication(sys.argv)
    w = MainWindow()
    sys.exit(app.exec_())
