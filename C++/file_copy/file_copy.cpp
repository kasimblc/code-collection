#include <fstream>
#include <iostream>

int main(int argc, char** argv) {
    // Komut satırından kaynak ve hedef dosya adları alınıyor
    if (argc != 3) {
        std::cerr << "Kullanım: " << argv[0] << " <kaynak_dosya> <hedef_dosya>\n";
        return 1;
    }

    // Kaynak dosya açılıyor
    std::ifstream kaynak(argv[1], std::ios::binary);
    if (!kaynak) {
        std::cerr << "Hata: Kaynak dosya açılamadı\n";
        return 1;
    }

    // Hedef dosya açılıyor
    std::ofstream kopya(argv[2], std::ios::binary);
    if (!kopya) {
        std::cerr << "Hata: Hedef dosya açılamadı\n";
        return 1;
    }

    // Kaynak dosyanın içeriği hedef dosyaya kopyalanıyor
    kopya << kaynak.rdbuf();
    std::cout << "Dosya kopyalandı\n";

    return 0;
}
