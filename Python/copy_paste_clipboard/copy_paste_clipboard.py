import pyperclip
import keyboard
import threading
import time

class ClipboardManager:
    def __init__(self):
        self.previous_text = ""
        self.current_text = ""
        self.copy_count = 0

    def run(self):
        keyboard.add_hotkey('ctrl+c', self.on_copy)
        keyboard.add_hotkey('ctrl+v', self.on_paste)

        while True:
            time.sleep(1)  # Ana döngüyü uyutarak CPU kullanımını azaltır

    def on_copy(self):
        time.sleep(0.3)  # Kopyalama işleminden sonra kısa bir bekleme süresi

        if self.copy_count == 0:
            self.previous_text = pyperclip.paste()
            self.copy_count = 1
        elif self.copy_count == 1:
            self.current_text = pyperclip.paste()
            if self.current_text != self.previous_text:
                self.copy_count = 2
                pyperclip.copy("{} ({})".format(self.previous_text, self.current_text))
        elif self.copy_count >= 2:
            self.previous_text = pyperclip.paste()
            self.copy_count = 1

    def on_paste(self):
        self.copy_count = 0

# Ana programı başlatan fonksiyon
def main():
    manager = ClipboardManager()
    manager.run()

if __name__ == "__main__":
    main_thread = threading.Thread(target=main)
    main_thread.start()
