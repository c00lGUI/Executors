# hey gang
installLink='bash -c "$(curl -fsSL https://www.hydrogen.lat/install)"'

main() {
    clear
    echo "\033[1;33mWarning\033[0m: Asta e \033[1;31munofficial\033[0m o aplicatie facuta de Louis si @109dg."
    echo "Rețineți că atât Dezinstalarea, cât și Reinstalarea reinstalează automat ROBLOX la cea mai recentă versiune."
    sleep 1
    echo "Instaleaza Hydrogen:      Apasa 1"
    echo "Sterge Hydrogen:          Apasa 2"
    echo "ReInstaleaza Hydrogen:    Apasa 3"
    echo "Desinstalare Curata:      Apasa 4"
    echo "Iesire:                   Apasa orcie tasta"

    read -n 1 -s user_input
    
    if [ "$user_input" == "1" ]; then
        echo "[!] Instalare Hydrogen"
        eval $installLink
        
    elif [ "$user_input" == "2" ]; then
        echo "[!] Dezinstalare Hydrogen"

        if [ -d "/Applications/Hydrogen.app" ]; then
            echo "[-] Stergere /Applications/Hydrogen.app..."
            rm -rf "/Applications/Hydrogen.app"
        else
            echo "[!] Aplicatia Hydrogen nu este gasita!"
        fi
        
        
        if [ -d "/Applications/Roblox.app" ]; then
            echo "[-] Stergere /Applications/Roblox.app..."
            rm -rf "/Applications/Roblox.app"
        else
            echo "[!] Aplicatia Roblox nu este gasita!"
        fi

        cd /tmp
        

        [ -f ./RobloxPlayer.zip ] && rm ./RobloxPlayer.zip

        arch=$(uname -m)
        
        if [[ "$arch" == "arm64" ]]; then
            echo "[!] Apple Silicon CPU Detectat"
            echo "[+] Descărcarea celei mai recente versiuni Roblox..."
            version=$(curl -s http://setup.roblox.com/mac/arm64/DeployHistory.txt | grep "New Client version" | tail -n 1 | sed -n 's/.*\(version-[^ ]*\).*/\1/p')
            curl -f --progress-bar "http://setup.rbxcdn.com/mac/arm64/{$version}-RobloxPlayer.zip" -o "./RobloxPlayer.zip"
        elif [[ "$arch" == "x86_64" ]]; then
            echo "[!] Intel CPU Detectat"
            echo "[+] Descărcarea celei mai recente versiuni Roblox..."
            version=$(curl -s http://setup.roblox.com/mac/DeployHistory.txt | grep "New Client version" | tail -n 1 | sed -n 's/.*\(version-[^ ]*\).*/\1/p')
            curl -f --progress-bar "http://setup.rbxcdn.com/mac/{$version}-RobloxPlayer.zip" -o "./RobloxPlayer.zip"
        else
            echo "Unknown architecture: $arch. Aborting"
            exit 1
        fi

        
        
        echo "[+] Descărcarea celei mai recente versiuni Roblox..."

        unzip -qo "./RobloxPlayer.zip"
        mv ./RobloxPlayer.app /Applications/Roblox.app
        rm ./RobloxPlayer.zip
        echo "[+] Hydrogen Desinstalat."
        echo "[+] Script by @109dg and Louis"
        echo "[-] Stergere Hydro installer"
        cd
        rm -rf hydro-uninstaller.sh

        exit 0
        
    elif [ "$user_input" == "3" ]; then
        echo "Stergere Hydrogen"

        if [ -d "/Applications/Hydrogen.app" ]; then
            echo "[-] Stergere /Applications/Hydrogen.app..."
            rm -rf "/Applications/Hydrogen.app"
        else
            echo "[!] Aplicatia Hydrogen nu este gasita!"
        fi
        
        if [ -d "/Applications/Roblox.app" ]; then
            echo "[-] Stergere /Applications/Roblox.app..."
            rm -rf "/Applications/Roblox.app"
        else
            echo "[!] Aplicatia Roblox nu este gasita!"
        fi

        sleep 1
        echo "[+] Se reinstaleaza Hydrogen"

        eval $installLink

    elif [ "$user_input" == "4" ]; then
        echo "Se perfomeaza dezinstalare curată"

        if [ -d "/Applications/Hydrogen.app" ]; then
            echo "[-] Stergere /Applications/Hydrogen.app..."
            rm -rf "/Applications/Hydrogen.app"
        else
            echo "[!] Aplicatia Hydrogen nu se poate gasi!"
        fi
        
        if [ -d "/Applications/Roblox.app" ]; then
            echo "[-] stergere /Applications/Roblox.app..."
            rm -rf "/Applications/Roblox.app"
        else
            echo "[!] Aplicatia Roblox nu este gasita!"
        fi

        echo "[-] Stergere toate filele Hydrogen."
        if [ -d "~/Hydrogen" ]; then
            rm -rf "~/Hydrogen"
        fi

        if [ -d "~/Library/Application\ Support/Hydrogen" ]; then
            rm -rf "~/Library/Application\ Support/Hydrogen"
        fi

        if [ -d "~/Library/Application\ Support/Roblox" ]; then
            rm -rf "~/Library/Application\ Support/Roblox"
        fi

        cd /tmp

        [ -f ./RobloxPlayer.zip ] && rm ./RobloxPlayer.zip

        arch=$(uname -m)
        
        if [[ "$arch" == "arm64" ]]; then
            echo "[!] Apple Silicon CPU Detectat"
            echo "[+] Descărcarea celei mai recente versiuni Roblox..."
            version=$(curl -s http://setup.roblox.com/mac/arm64/DeployHistory.txt | grep "New Client version" | tail -n 1 | sed -n 's/.*\(version-[^ ]*\).*/\1/p')
            curl -f --progress-bar "http://setup.rbxcdn.com/mac/arm64/{$version}-RobloxPlayer.zip" -o "./RobloxPlayer.zip"
        elif [[ "$arch" == "x86_64" ]]; then
            echo "[!] Intel CPU Detectat"
            echo "[+] Descărcarea celei mai recente versiuni Roblox..."
            version=$(curl -s http://setup.roblox.com/mac/DeployHistory.txt | grep "New Client version" | tail -n 1 | sed -n 's/.*\(version-[^ ]*\).*/\1/p')
            curl -f --progress-bar "http://setup.rbxcdn.com/mac/{$version}-RobloxPlayer.zip" -o "./RobloxPlayer.zip"
        else
            echo "Unknown architecture: $arch. Aborting"
            exit 0
        fi
        
        echo "[+] Descărcarea celei mai recente versiuni Roblox..."

        unzip -qo "./RobloxPlayer.zip"
        mv ./RobloxPlayer.app /Applications/Roblox.app
        rm ./RobloxPlayer.zip

        sleep 1
        echo "[+] Reinstaleaza Hydrogen"
        
    else
        echo "Aveti o zi faina!"
        rm -rf hydro-uninstaller.sh
        exit 0
    fi

    clear

}

main