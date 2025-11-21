#!/bin/bash

# Definir las carpetas de destino
IMAGENES_DIR="$HOME/Desktop/Imágenes"
DOCUMENTOS_DIR="$HOME/Desktop/Documentos"
MUSICA_DIR="$HOME/Desktop/Música"
OTROS_DIR="$HOME/Desktop/Otros"

# Crear las carpetas si no existen
mkdir -p "$IMAGENES_DIR"
mkdir -p "$DOCUMENTOS_DIR"
mkdir -p "$MUSICA_DIR"
mkdir -p "$OTROS_DIR"

# Mover archivos a las carpetas correspondientes
for file in "$HOME/Desktop"/*; do
    if [[ -f "$file" ]]; then
        case "$file" in
            *.jpg|*.png|*.gif)
                mv "$file" "$IMAGENES_DIR"
                ;;
            *.pdf|*.docx|*.txt)
                mv "$file" "$DOCUMENTOS_DIR"
                ;;
            *.mp3|*.wav)
                mv "$file" "$MUSICA_DIR"
                ;;
            *)
                mv "$file" "$OTROS_DIR"
                ;;
        esac
    fi
done

echo "Archivos organizados en el escritorio."

